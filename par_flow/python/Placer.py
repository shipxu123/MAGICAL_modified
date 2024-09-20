import magicalFlow
import IdeaPlaceExPy
import anaroutePy
import sys
import os.path
import device_generation.basic as basic
import gdspy
import device_generation.glovar as glovar
import time
import subprocess
import os
import json
import copy

import pdb

class Placer(object):
    def __init__(self, magicalDB, cktIdx, dirname, gridStep, halfMetWid, no, nw_params):
        self.no = no
        self.nw_params = nw_params

        self.mDB = magicalDB
        self.dDB = magicalDB.designDB.db
        self.tDB = magicalDB.techDB
        self.debug = True
        self.cktIdx = cktIdx
        self.ckt = self.dDB.subCkt(cktIdx)
        self.placer = IdeaPlaceExPy.IdeaPlaceEx()

        # initilize performace guiding placer
        self.paplacer = IdeaPlaceExPy.PAPlace()
        self.paplacer.setIdeaPlaceEX(self.placer)

        # self.guide = IdeaPlaceExPy、conste
        self.dirname = dirname
        self.numCktNodes = self.ckt.numNodes() # without io pins
        self.gridStep = gridStep
        self.halfMetWid = halfMetWid
        self.subShapeList = list()
        self.params = magicalDB.params
        self.nodeToCellIdx = []
        self.placeParams()
        self.guardRingGrCells = []
        self.implRealLayout = True # if we want to implement new layout 

    def placeParams(self):
        self.deviceProximityTypes = [magicalFlow.ImplTypePCELL_Nch, magicalFlow.ImplTypePCELL_Pch]

    def run(self):
        self.useIoPin = True
        self.usePowerStripe = True
        self.isTopLevel = False
        if (self.dDB.rootCktIdx() ==  self.cktIdx):
            self.useIoPin = False
            self.isTopLevel = True
        if not self.implRealLayout:
            self.useIoPin = False # in early floorplan stage, don't need real io pins
        self.dumpInput()
        self.placer.numThreads(1) #FIXME
        start = time.time()

        # nw_params is not none and is not empty
        if self.nw_params:
            ###############################
            # set net weights parameters
            ###############################
            for netIdx in range(self.ckt.numNets()):
                self.placer.setNetWgt(netIdx, self.nw_params[netIdx])

        # initilize here
        self.symAxis = self.placer.solve(self.gridStep)

        end = time.time()
        self.runtime = end-start
        print("placement finished: ", self.ckt.name, "runtime", end-start)
        self.processPlacementOutput()

    def dumpInput(self):
        self.placer.readTechSimpleFile(self.params.simple_tech_file)
        self.placeParsePin()
        self.placeConnection()
        self.placer.readSymFile(self.dirname + self.ckt.name + '.sym') # FIXME: use in memory interface
        self.placeParseSigpath()
        self.computeAndAddPowerCurrentFlow()
        self.placeParseBoundary()
        if self.debug:
            gdspy.current_library = gdspy.GdsLibrary()
            self.tempCell = gdspy.Cell("FLOORPLAN")
        self.configureIoPinParameters()
        self.placer.readSymNetFile(self.dirname + self.ckt.name + '.symnet') # FIXME: use in memory interface
        #self.feedDeviceProximity()
    
    def placeParseSigpath(self):
        filename = self.dirname + self.ckt.name + '.sigpath' #FIXME: use in memeory interface
        if os.path.isfile(filename):
            self.placer.readSigpathFile(filename)
    def computeAndAddPowerCurrentFlow(self):
        #if self.isTopLevel:
        #    return
        print("computeAndAddPowerCurrentFlow")
        csflow = magicalFlow.CSFlow(self.dDB)
        ckt = self.ckt
        if ckt.implType == magicalFlow.ImplTypeUNSET:
            csflow.computeCurrentFlow(ckt)
            pinNamePaths = csflow.currentPinPaths()
            cellNamePaths = csflow.currentCellPaths()
            csflow.computeCurrentFlow(ckt)
            for i in range(len(pinNamePaths)):
                pathIdx = self.placer.allocateSignalPath()
                self.placer.markSignalPathAsPower(pathIdx)
                print("allocate signal path", pathIdx)
                for j in range(len(pinNamePaths[i])):
                    self.placer.addPinToSignalPath(pathIdx, cellNamePaths[i][j], pinNamePaths[i][j])
                    print("add pin to signal path", pathIdx, cellNamePaths[i][j], pinNamePaths[i][j])
    def feedDeviceProximity(self):
        for idx in range(len(self.deviceProximityTypes)):
            deviceType = self.deviceProximityTypes[idx]
            cells = []
            for nodeIdx in range(self.ckt.numNodes()):
                # Find the correct node from subgraph
                node = self.ckt.node(nodeIdx)
                if node.isLeaf():
                    continue
                subCktIdx = node.graphIdx
                subCkt = self.dDB.subCkt(subCktIdx)
                placerCellIdx = self.nodeToCellIdx[nodeIdx]
                if subCkt.implType == deviceType:
                    cells.append(placerCellIdx)
            if len(cells) > 1:
                proxGrpIdx = self.placer.allocateProximityGroup()
                for placerCellIdx in cells:
                    self.placer.addCellToProximityGroup(placerCellIdx, proxGrpIdx)

    def configureIoPinParameters(self):
        #if self.useIoPin == False:
        #    self.placer.closeVirtualPinAssignment()
        #    return
        self.placer.openVirtualPinAssignment()
        self.placer.setIoPinBoundaryExtension(12 * 1 * self.gridStep)
        self.placer.setIoPinInterval(5 * 2 * self.gridStep)
        for netIdx in range(self.ckt.numNets()):
            net = self.ckt.net(netIdx)
            if (net.isIo() and (not net.isPower()) and self.useIoPin):
                self.placer.markIoNet(netIdx)
            #if net.isVdd() and not self.isTopLevel:
            if net.isVdd():
                self.placer.markAsVddNet(netIdx)
            if net.isVss():
            #if net.isVss() and not self.isTopLevel:
                self.placer.markAsVssNet(netIdx)

    def processPlacementOutput(self):
        #  Set Placement origin
        self.setPlaceOrigin()
        print("origin, ", self.origin[0], self.origin[1])
        self.symAxis = int(self.symAxis - self.origin[0])
        self.readoutIoPins()
        self.writeoutPlacementResult()

        # For generating dataset
        self.extract_features()

    def readoutIoPins(self):
        self.iopinOffsetx =[]
        self.iopinOffsety = []
        if self.useIoPin == False:
            return
        for netIdx in range(self.ckt.numNets()):
            net = self.ckt.net(netIdx)
            if (net.isIo() and (not net.isPower())):
                ioPinX = self.placer.iopinX(netIdx) - self.origin[0]
                ioPinY = self.placer.iopinY(netIdx) - self.origin[1]
                self.iopinOffsetx.append(ioPinX)
                self.iopinOffsety.append(ioPinY)
                #FIXME
                size_scale = 1
                if (self.placer.isIoPinVertical(netIdx)):
                    metals = [
                            [- 65, -self.gridStep * (1 + size_scale)  - 70 - 30, 65, self.gridStep * (1+size_scale)  + 70 + 30]
                            ]
                    metalPkdLayers = [31]
                    metalIoLayers = [1]
                else:
                    metals = [
                            [-self.gridStep * (1+size_scale)  - 70 - 30, - 65 , self.gridStep  * (1 + size_scale) + 70 + 30, 65]
                            ]
                    metalPkdLayers = [31]
                    metalIoLayers = [1]
                cuts = []
                cutsPdkLayers = []
                # add a new pin to the net
                self.addIoPinToNet(netIdx, ioPinX, ioPinY, metals, metalPkdLayers, cuts, cutsPdkLayers)
        self.ckt = self.dDB.subCkt(self.cktIdx)

    def upscaleBBox(self, gridStep, ckt, origin):
        """
        @brief for legalize the boundary box after the routing. The routing wire might change the boundary of placement, so that the bounding box need to be adjust to multiple of grid step
        """
        bBox = ckt.layout().boundary()
        xLoLen = origin[0] - bBox.xLo 
        yLoLen = origin[1] - bBox.yLo 
        xHiLen = bBox.xHi - origin[0] 
        yHiLen = bBox.yHi - origin[1] 
        print("adjust bbox ", xLoLen, yLoLen, xHiLen, yHiLen)
        xLoLen += gridStep - (xLoLen % gridStep)
        xHiLen += gridStep - (xHiLen % gridStep)
        yLoLen += gridStep - (yLoLen % gridStep)
        yHiLen += gridStep - (yHiLen % gridStep)
        ckt.layout().setBoundary( origin[0] - xLoLen,
                                  origin[1] - yLoLen,
                                  origin[0] + xHiLen,
                                  origin[1] + yHiLen)

    def updatePlacementResult(self):
        self.ckt.layout().clear()
        for nodeIdx in range(self.ckt.numNodes()):
            cktNode = self.ckt.node(nodeIdx)
            subCkt = self.dDB.subCkt(cktNode.graphIdx)
            x_offset = cktNode.offset().x
            y_offset = cktNode.offset().y
            self.ckt.layout().insertLayout(subCkt.layout(), x_offset, y_offset, cktNode.flipVertFlag)
        # write guardring using gdspy
        for grCell in self.guardRingGrCells:
            self.addPycell(self.ckt.layout(), grCell)
        # Output placement result
        magicalFlow.writeGdsLayout(self.cktIdx, self.dirname + self.ckt.name + '.place.gds', self.dDB, self.tDB)

    def resetPlacer(self):
        """
        Reset the placer
        """
        if self.implRealLayout:
            assert(False) # reset is only working when the placer is not in implement real circuit mode
        self.ckt.resizeNodes(self.numCktNodes) #remove the additional pin nodes
        self.placer = IdeaPlaceExPy.IdeaPlaceEx() # Create a new placer solver
        self.ckt.layout().clear()

    def writeoutPlacementResult(self):
        # Write results to flow
        self.initPowerPins()
        print("origin again  ",self.origin)
        for nodeIdx in range(self.numCktNodes):
            cktNode = self.ckt.node(nodeIdx)
            subCkt = self.dDB.subCkt(cktNode.graphIdx)
            x_offset = self.placer.xCellLoc(nodeIdx) - self.origin[0]
            y_offset = self.placer.yCellLoc(nodeIdx) - self.origin[1]
            print("node ", cktNode.name, x_offset, y_offset)
            cktNode.setOffset(x_offset, y_offset)
            self.ckt.layout().insertLayout(subCkt.layout(), x_offset, y_offset, cktNode.flipVertFlag)
            print(cktNode.name, self.placer.cellName(nodeIdx), x_offset, y_offset, "PLACEMENT")
            if self.debug:
                boundary = subCkt.layout().boundary()
                rect = gdspy.Rectangle((boundary.xLo+x_offset,boundary.yLo+y_offset), (boundary.xHi+x_offset,boundary.yHi+y_offset))
                text = gdspy.Text(cktNode.name,50,((boundary.xLo+boundary.xHi)/2+x_offset,(boundary.yLo+boundary.yHi)/2+y_offset),layer=100)
                self.tempCell.add(rect)
                self.tempCell.add(text)
        cktBoundaryBox = self.ckt.layout().boundary()
        #Process io pins      
        if self.useIoPin:
            for nodeIdx in range(self.numCktNodes, self.ckt.numNodes()):
                cktNode = self.ckt.node(nodeIdx)
                subCkt = self.dDB.subCkt(cktNode.graphIdx)
                x_offset = self.iopinOffsetx[nodeIdx - self.numCktNodes]
                y_offset = self.iopinOffsety[nodeIdx - self.numCktNodes]
                cktNode.setOffset(x_offset, y_offset)
                self.ckt.layout().insertLayout(subCkt.layout(), x_offset, y_offset, cktNode.flipVertFlag)
        # write guardring using gdspy
        if self.cktNeedSub(self.cktIdx) and self.implRealLayout:
            print("Adding GuardRing to Cell")
            print("origin", self.origin[0], self.origin[1])
            # Leave additional 80nm spacing
            grCell, subPin = basic.basic.sub_GR([cktBoundaryBox.xLo/1000.0-0.08, cktBoundaryBox.yLo/1000.0-0.08], [cktBoundaryBox.xHi/1000.0+0.08, cktBoundaryBox.yHi/1000.0+0.08], [self.origin[0]-self.halfMetWid/1000.0,self.origin[1]-self.halfMetWid/1000.0])
            self.addPycell(self.ckt.layout(), grCell)
            bBox = self.ckt.layout().boundary()
            self.subShape(subPin)
            self.guardRingGrCells.append(grCell)
        #change small
        self.checkSmallModule(self.cktIdx)
        # Power stripes
        if self.usePowerStripe:
            existingNodes = self.ckt.numNodes()
            cktBBoxAfterGuardRing = self.ckt.layout().boundary()
            self.addPowerStripe(cktBoundaryBox, cktBBoxAfterGuardRing)
            for nodeIdx in range(existingNodes, self.ckt.numNodes()):
                cktNode = self.ckt.node(nodeIdx)
                subCkt = self.dDB.subCkt(cktNode.graphIdx)
                cktNode.setOffset(0, 0)
                self.ckt.layout().insertLayout(subCkt.layout(), 0, 0, cktNode.flipVertFlag)

        # Output placement result
        dataset_gds_dir = self.dirname + "dataset/rundir_" + str(self.no) + "/"
        if not os.path.exists(dataset_gds_dir):
            subprocess.call("mkdir {}".format(dataset_gds_dir),shell=True)

        magicalFlow.writeGdsLayout(self.cktIdx, self.dirname + self.ckt.name + '.place.gds', self.dDB, self.tDB)
        magicalFlow.writeGdsLayout(self.cktIdx, dataset_gds_dir + self.ckt.name + '_' + str(self.no)+'.place.gds', self.dDB, self.tDB)
        self.origin = [0,0]
        if self.debug:
            gdspy.write_gds(self.dirname+self.ckt.name+'.floorplan.gds', [self.tempCell], unit=1.0e-9, precision=1.0e-9)

    def hardcodeConvertPdkLayerToIoLayer(self, pdkLayer):
        #print("WARNING: using hard-coded IO layer conversion")
        if pdkLayer == 31:
            return 1
        elif pdkLayer == 32:
            return 2
        elif pdkLayer == 33:
            return 3
        elif pdkLayer == 34:
            return 4
        elif pdkLayer == 35:
            return 5
        elif pdkLayer == 36:
            return 6
        elif pdkLayer == 37:
            return 7
        else:
            return -1

    def initPowerPins(self):
        """
        Implement the power pin and layout for power nets.
        The stacked VIA to the power layer
        """
        if not self.implRealLayout:
            return
        for netIdx in range(self.ckt.numNets()):
            net = self.ckt.net(netIdx)
            if net.isVdd():
                self.initNetPinToPower(netIdx)
            elif net.isVss():
                self.initNetPinToPower(netIdx)

    def initNetPinToPower(self, netIdx, topmet=6):
        net = self.ckt.net(netIdx)
        for pinId in range(net.numPins()):
            pinIdx = net.pinIdx(pinId)
            pin = self.ckt.pin(pinIdx)
            conNode = pin.nodeIdx
            conNet = pin.intNetIdx
            conCkt = self.dDB.subCkt(self.ckt.node(conNode).graphIdx)
            if not pin.valid:
                continue
            if pin.pinType == magicalFlow.PinType.PSUB:
                assert net.isSub, net.name
                if conCkt.implType != magicalFlow.ImplTypePCELL_Cap:
                    continue
            conLayer = conCkt.net(conNet).ioPinMetalLayer(0) 
            ioshape = conCkt.net(conNet).ioPinShape(0)
            if conLayer < topmet:
                met_cell = basic.basic.power_pin_init([ioshape.xLo/1000.0, ioshape.yLo/1000.0], [ioshape.xHi/1000.0, ioshape.yHi/1000.0], conLayer+1, topmet)
                self.addPycell(conCkt.layout(), met_cell)
                conCkt.net(conNet).ioLayer = topmet


    def addPycellIoPinToNet(self, netIdx, offsetX, offsetY, pyCell, isPowerStripe=False):
        polygons = pyCell.get_polygons(True)
        layers = polygons.keys()
        routableShapes = []
        routablePdkLayers = []
        routableDatatype = []
        otherShapes = []
        otherPdkLayers = []
        otherDataType = []
        for layer in layers:
            layerIdx = self.tDB.pdkLayerToDb(layer[0])
            datatype = layer[1]
            polyList = polygons[layer]
            for poly in polyList:
                xLo = int(round(poly[0][0]*200))*5
                yLo = int(round(poly[0][1]*200))*5
                xHi = int(round(poly[2][0]*200))*5
                yHi = int(round(poly[2][1]*200))*5
                if self.hardcodeConvertPdkLayerToIoLayer(layer[0]) != -1:
                    routableShapes.append([ xLo, yLo, xHi, yHi])
                    routablePdkLayers.append(layer[0])
                    routableDatatype.append(datatype)
                    print("metal ", xLo, yLo, xHi, yHi, layer[0])
                else:
                    otherShapes.append([xLo, yLo, xHi, yHi])
                    otherPdkLayers.append(layer[0])
                    otherDataType.append(datatype)
        self.addIoPinToNet(netIdx, offsetX, offsetY, routableShapes, routablePdkLayers, otherShapes, otherPdkLayers, addtocurrentlayout=False, isPowerStripe=isPowerStripe, useDatatype=True, routableDatatype=routableDatatype, otherDataType=otherDataType)

    def addIoPinToNet(self, netIdx, offsetX, offsetY, routableShapes, routablePdkLayers, otherShapes, otherPdkLayers, addtocurrentlayout=False,
            isPowerStripe=False, useDatatype=False, routableDatatype=[], otherDataType=[]):
        routableDbLayers = []
        routableIoLayers = []
        for pdkLayer in routablePdkLayers:
            routableDbLayers.append(self.tDB.pdkLayerToDb(pdkLayer))
            routableIoLayers.append(self.hardcodeConvertPdkLayerToIoLayer(pdkLayer))
        otherDbLayers = []
        for pdkLayer in otherPdkLayers:
            otherDbLayers.append(self.tDB.pdkLayerToDb(pdkLayer))
        net = self.ckt.net(netIdx)

        # add a new pin to the net
        iopinNodeIdx = self.ckt.allocateNode()
        iopinPinIdx = self.ckt.allocatePin()
        net.appendPinIdx(iopinPinIdx)
        iopinNode = self.ckt.node(iopinNodeIdx)
        iopinNode.isImpl = True
        iopinGraphIdx = self.dDB.allocateCkt() # this step will cause the change on the ckt vector. Potentially change the reference/pointer. So need to re-reference the ckt
        self.ckt = self.dDB.subCkt(self.cktIdx)
        iopinGraph = self.dDB.subCkt(iopinGraphIdx)
        iopinGraph.isImpl = True
        iopinGraph.allocateNet()
        subiopinNet = iopinGraph.net(0)
        for mIdx in range(len(routableShapes)):
            metal = routableShapes[mIdx]
            mPdkLayer = routablePdkLayers[mIdx]
            mIoLayer = routableIoLayers[mIdx]
            dbLayer = routableDbLayers[mIdx]
            net.addIoPin(metal[0] + offsetX,  metal[1] + offsetY,  metal[2] + offsetX,  metal[3] + offsetY, mIoLayer)
            if isPowerStripe:
                net.markLastIoPowerStripe()
            if addtocurrentlayout:
                rectIdx = self.ckt.layout().insertRect(dbLayer, metal[0] + offsetX,  metal[1] + offsetY,  metal[2] + offsetX,  metal[3] + offsetY)
                if useDatatype:
                    self.ckt.layout().setRectDatatype(dbLayer, rectIdx, routableDatatype[mIdx])
            print("pin shape", metal[0] + offsetX,  metal[1] + offsetY,  metal[2] + offsetX,  metal[3] + offsetY)
            print("layer ", mIoLayer)
            rectIdx = iopinGraph.layout().insertRect(dbLayer,  metal[0],  metal[1],  metal[2],  metal[3])
            if useDatatype:
                iopinGraph.layout().setRectDatatype(dbLayer, rectIdx, routableDatatype[mIdx])
            subiopinNet.addIoPin( metal[0],  metal[1],  metal[2],  metal[3], mIoLayer)
            if isPowerStripe:
                subiopinNet.markLastIoPowerStripe()
        for cIdx in range(len(otherShapes)):
            other = otherShapes[cIdx]
            oPdkLayer = otherPdkLayers[cIdx]
            dbLayer = otherDbLayers[cIdx]
            rectIdx = iopinGraph.layout().insertRect(dbLayer, other[0], other[1], other[2], other[3])
            if useDatatype:
                rectIdx = iopinGraph.layout().setRectDatatype(dbLayer, rectIdx, otherDataType[cIdx])
            if addtocurrentlayout:
                rectIdx = self.ckt.layout().insertRect(dbLayer, other[0] + offsetX,  other[1] + offsetY,  other[2] + offsetX,  other[3] + offsetY)
                if useDatatype:
                    self.ckt.layout().setRectDatatype(dbLayer, rectIdx, otherDataType[cIdx])
        zeroOrigin = [0, 0]
        self.upscaleBBox(self.gridStep, iopinGraph, zeroOrigin)
        iopinNode.graphIdx = iopinGraphIdx
        iopinNode.appendPinIdx(iopinPinIdx)
        iopinPin = self.ckt.pin(iopinPinIdx)
        iopinPin.intNetIdx = 0
        iopinPin.nodeIdx = iopinNodeIdx
        iopinPin.netIdx = netIdx

    def addPowerStripe(self, boundary, boundaryWithGuardRing):
        # Use 80 nm spacing.
        width = int(boundaryWithGuardRing.xLen() + 2 * self.gridStep)
        print("addPowerStripe length ", boundary.xLen(), boundaryWithGuardRing.xLen())
        print("width", width)
        width = width + (self.gridStep - (width % self.gridStep))
        if width / self.gridStep % 2 == 0:
            width += self.gridStep
        print("width", width)
        height = int(1500)  # Just give a try FIXME
        if self.isSmallModule:
            height = int(200)
        height = height + (self.gridStep - (height % self.gridStep))  
        if height / self.gridStep % 2 == 0:
            height += self.gridStep
        fWidth = float(width) / 1000.0
        fHeight = float(height) / 1000.0
        print("fWidth", fWidth)
        vddOffset = [0.0, 0.0]
        vddOffset[0] = ( self.origin[0] - self.gridStep ) / 1000.0
        vddOffset[1] = ( float(boundary.yHi +  5 * self.gridStep)) / 1000.0
        while vddOffset[0] > (float(self.symAxis) / 1000.0) - fWidth / 2.0:
            vddOffset[0] -= self.gridStep / 1000.0
        vssOffset = [0.0, 0.0]
        vssOffset[0] = ( self.origin[0] - self.gridStep    ) / 1000.0
        while vssOffset[0] > (float(self.symAxis) / 1000.0) - fWidth / 2.0:
            vssOffset[0] -= self.gridStep / 1000.0
        offsetLo = self.origin[1] - 5 * self.gridStep + self.gridStep / 2
        while offsetLo > boundaryWithGuardRing.yLo - self.gridStep * 5 - height:
            offsetLo -= self.gridStep
        vssOffset[1] = ( float(offsetLo)) / 1000.0 
        # update width to ensure symmetry
        halfWidth = float(self.symAxis) / 1000.0 - vddOffset[0]
        fWidth =  halfWidth *2 
        print("width, ", fWidth, "height", fHeight, "vdd offset", vddOffset[0], vddOffset[1])
        print("width, ", fWidth, "height", fHeight, "vss offset", vssOffset[0], vssOffset[1])
        vddStripe = basic.basic.power_strip(fWidth, fHeight, vddOffset, lay=[self.params.powerLayer])
        print("generated vdd")
        vssStripe = basic.basic.power_strip(fWidth, fHeight, vssOffset, lay=[self.params.powerLayer])
        print("generated vss")
        for netIdx in range(self.ckt.numNets()):
            net = self.ckt.net(netIdx)
            if net.isVdd():
                print("\n\n\n\n add vdd ")
                self.addPycellIoPinToNet(netIdx, 0, 0, vddStripe, isPowerStripe=True)
            elif net.isVss():
                print("\n\n\n\n add vss ")
                self.addPycellIoPinToNet(netIdx, 0, 0, vssStripe, isPowerStripe=True)

    def placeConnection(self):
        """
        @brief add pin connection info to placer
        """
        fileName = self.dirname + self.ckt.name + '.con'
        if self.debug:
            outFile = open(fileName, 'w')
            outFile.write("%d\n" % self.ckt.numNets())
        for netIdx in range(self.ckt.numNets()):
            net = self.ckt.net(netIdx)
            dbNetIdx = self.placer.allocateNet()
            if net.isPower():
                self.placer.setNetWgt(dbNetIdx, 0)
            self.placer.setNetName(dbNetIdx, net.name) # FIXME: the only purpose is to use parse symnet file. Which ideally can be avoided
            assert netIdx == dbNetIdx, "placeConnection, netIdx == dbNetIdx"
            if self.debug:
                outFile.write("%d\n" % net.numPins())
            for pinIdx in range(net.numPins()):
                pinidxidx = net.pinIdx(pinIdx)
                pin = self.ckt.pin(pinidxidx)
                nodeIdx = pin.nodeIdx
                if not pin.valid:
                    if self.debug:
                        outFile.write("-1\n")
                    continue
                if self.placer.pinIdx(nodeIdx, pin.intNetIdx) < pow(2,32)-1:
                    self.placer.addPinToNet(self.placer.pinIdx(nodeIdx, pin.intNetIdx), netIdx)
                    if self.debug:
                        outFile.write("%d\n" % self.placer.pinIdx(nodeIdx, pin.intNetIdx))
                else:
                    device_type = self.dDB.subCkt(self.ckt.node(nodeIdx).graphIdx).implType
                    if device_type == magicalFlow.ImplTypePCELL_Nch:
                        assert pin.intNetIdx == 3, "placeConnection, sub not NMOS BODY pin"
                    elif device_type == magicalFlow.ImplTypePCELL_Res:
                        assert pin.intNetIdx == 2, "placeConnection, sub not RES BODY pin"
                    else:
                        assert False, "placeConnection, sub not NMOS or RES device"
                    if self.debug:
                        outFile.write("-1\n")

    def placeParsePin(self):
        """
        @brief parse pin and cell for placer
        """
        fileName = self.dirname + self.ckt.name + '.pin'
        if self.debug:
            outFile = open(fileName, 'w') #
            outFile.write("%d\n" % self.ckt.numNodes())
        for nodeIdx in range(self.ckt.numNodes()):
            cellIdx = self.placer.allocateCell()
            self.nodeToCellIdx.append(cellIdx)
            assert nodeIdx == cellIdx, "placeParsePin, nodeIdx != ckdIdx"
            node = self.ckt.node(nodeIdx)
            self.placer.setCellName(nodeIdx, node.name)
            subCkt = self.dDB.subCkt(node.graphIdx)
            if self.debug:
                outFile.write('%s %d\n' % (node.name,subCkt.numNets())) #
            for netIdx in range(subCkt.numNets()):
                net = subCkt.net(netIdx)
                shape = net.ioShape()
                layer = net.ioLayer
                # pinIdx not exists, unsigned int max:pow(2,32)-1
                if layer > 10:
                    outFile.write("-1\n")
                    continue
                pinIdx = self.placer.allocatePin(nodeIdx)
                self.placer.setPinName(pinIdx, net.name)
                print("add pin", net.name, "to cell", node.name)
                assert pinIdx == self.placer.pinIdx(nodeIdx, netIdx), "placeParsePin, pin insertion error"
                self.placer.addPinShape(pinIdx, shape.xLo, shape.yLo, shape.xHi, shape.yHi)
                if self.debug:
                    outFile.write("%d %d %d %d\n" % (shape.xLo, shape.yLo, shape.xHi, shape.yHi))

    def placeParseBoundary(self):
        fileName = self.dirname + self.ckt.name + '.bound'
        if self.debug:
            outFile = open(fileName, 'w') #
            outFile.write("%d\n" % self.ckt.numNodes())
        for nodeIdx in range(self.ckt.numNodes()):
            cktNode = self.ckt.node(nodeIdx)
            subCkt = self.dDB.subCkt(cktNode.graphIdx)
            bBox = subCkt.layout().boundary()
            self.placer.addCellShape(nodeIdx, 0, bBox.xLo, bBox.yLo, bBox.xHi, bBox.yHi)
            if self.debug:
                outFile.write("%d %d %d %d\n" % (bBox.xLo, bBox.yLo, bBox.xHi, bBox.yHi))

    def setPlaceOrigin(self):
        self.origin = [self.placer.xCellLoc(0), self.placer.yCellLoc(0)]
        for nodeIdx in range(self.numCktNodes):
            if self.origin[0] > self.placer.xCellLoc(nodeIdx):
                self.origin[0] = self.placer.xCellLoc(nodeIdx)
            if self.origin[1] > self.placer.yCellLoc(nodeIdx):
                self.origin[1] = self.placer.yCellLoc(nodeIdx)

        if self.useIoPin:
            print("use io pin or not?")
            for netIdx in range(self.ckt.numNets()):
                net = self.ckt.net(netIdx)
                if (net.isIo() and (not net.isPower())):
                    ioPinX = self.placer.iopinX(netIdx)
                    ioPinY = self.placer.iopinY(netIdx)
                    if self.origin[0] > ioPinX:
                        self.origin[0] = ioPinX
                    if  self.origin[1] > ioPinY:
                        self.origin[1] = ioPinY
        self.origin[0]=int(round(self.origin[0]))
        self.origin[1]=int(round(self.origin[1]))
    def cktNeedSub(self, cktIdx):
        ckt = self.dDB.subCkt(cktIdx)
        for netIdx in range(ckt.numNets()):
            net = ckt.net(netIdx)
            _, isPsub, _ = self.netPinCount(ckt, net)
            if isPsub:
                return True
        return False

    @staticmethod
    def netPinCount(ckt, net):
        netPsub = 0
        netNwell = 0
        pinCount = 0
        for pinId in range(net.numPins()):
            pinIdx = net.pinIdx(pinId)
            pin = ckt.pin(pinIdx)
            if pin.pinType == magicalFlow.PinType.PSUB:
                netPsub = 1
            elif pin.pinType == magicalFlow.PinType.NWELL:
                netNwell = 1
                pinCount += 1
            else:
                pinCount += 1
        return pinCount + netPsub, bool(netPsub), bool(netNwell)

    def addPycell(self, layout, pyCell):
        polygons = pyCell.get_polygons(True)
        layers = polygons.keys()
        for layer in layers:
            layerIdx = self.tDB.pdkLayerToDb(layer[0])
            datatype = layer[1]
            polyList = polygons[layer]
            for poly in polyList:
                xLo = int(round(poly[0][0]*200))*5
                yLo = int(round(poly[0][1]*200))*5
                xHi = int(round(poly[2][0]*200))*5
                yHi = int(round(poly[2][1]*200))*5
                rectIdx = layout.insertRect(layerIdx, xLo, yLo, xHi, yHi)
                if datatype != 0:
                    layout.setRectDatatype(layerIdx, rectIdx, datatype)

    def subShape(self, subPin):
        shape = subPin.normalize_shape()
        # Only the lower metal for now
        self.subShapeList.append(shape[1:5])
    
    def checkSmallModule(self, cktIdx):
        """
        This is a dirty tuning module
        For small layout, there is likely a DRV related to power stripes,
        if we are using a regular wide one.
        So we check whether this is a small module, and if so,
        use smaller power shapes
        """
        ckt = self.dDB.subCkt(cktIdx)
        bbox = ckt.layout().boundary()
        xlen = bbox.xLen()
        ylen = bbox.yLen()
        area = xlen * ylen
        if area < self.params.smallModuleAreaThreshold * 1000 * 1000:
            self.isSmallModule = True
        else:
            self.isSmallModule = False
    
    def extract_features(self):
        dataset_dir = self.dirname + "dataset/"
        rundir = "{}rundir_{}/".format(dataset_dir, self.no)

        net_file = rundir + "data_net.json"
        layout_file = rundir + "data_layout.json"
        nets_feature_map = {}
        layout_feature_map = {}
        if os.path.exists(net_file) and os.path.exists(layout_file):
            return

        if not os.path.exists(dataset_dir):
            subprocess.call("mkdir {}".format(dataset_dir), shell=True)
        if not os.path.exists(rundir):
            subprocess.call("mkdir {}".format(rundir), shell=True)
        
        for netIdx in range(self.ckt.numNets()):
            net = self.ckt.net(netIdx)
            net_feature = {
                "degree":net.numPins(),
                "name":net.name,
                "pins": [],
                "parasitic_cap": -1
            }

            for pinIndex in range(net.numPins()):
                pinidxidx = net.pinIdx(pinIndex)
                pin = self.ckt.pin(pinidxidx)
                nodeIdx = pin.nodeIdx
                net_feature["pins"].append(self.ckt.node(nodeIdx).name)
            nets_feature_map[net.name] = net_feature
        json_net_obj = json.dumps(nets_feature_map)
        with open(net_file, "w") as f:
            f.write(json_net_obj)

        for nodeIdx in range(self.numCktNodes):
            cktNode = self.ckt.node(nodeIdx)
            subCkt = self.dDB.subCkt(cktNode.graphIdx)
            boundary = subCkt.layout().boundary()
            x_offset = self.placer.xCellLoc(nodeIdx) - self.origin[0]
            y_offset = self.placer.yCellLoc(nodeIdx) - self.origin[1]
            node_feature = {
                "x_offset":x_offset,
                "y_offset":y_offset,
                "name":cktNode.name,
                "xLo":boundary.xLo,
                "yLo":boundary.yLo,
                "xHi":boundary.xHi,
                "yHi":boundary.yHi,
                "refName":cktNode.refName
            }
            layout_feature_map[cktNode.name] = node_feature
        json_layout_obj = json.dumps(layout_feature_map)
        with open(layout_file, "w") as f:
            f.write(json_layout_obj)

        place_pin_file = rundir + "place.pin"
        self.writePlacePinFile(place_pin_file)

        place_result_file = rundir + "place.result"
        self.writePlaceResultFile(place_result_file)

        place_connection_file = rundir + "place.connection"
        self.writePlaceConnectionFile(place_connection_file)

    def writePlacePinFile(self, fileName):
        pin_type_codes_pn = ['D', 'G', 'S', 'B']
        pin_type_codes_rm = ['PLUS', 'MINUS', 'B']

        with open(fileName, 'w') as fn:
            for nodeIdx in range(self.numCktNodes):
                node = self.ckt.node(nodeIdx)
                cellName = node.name
                fn.write("%s\n" % (cellName.split("_")[-1]))
                subCkt = self.dDB.subCkt(node.graphIdx)
                boundary = subCkt.layout().boundary()

                for pinInNodeIdx in range(node.numPins()):
                    pin = self.ckt.pin(node.pinIdx(pinInNodeIdx))
                    internalNetIdx = pin.intNetIdx
                    subnet = subCkt.net(internalNetIdx)
                    shape = subnet.ioShape()
                    layer = subnet.ioLayer

                    if node.numPins()  == 4:
                        pin_type_code = pin_type_codes_pn[pinInNodeIdx]
                    elif node.numPins() == 3:
                        pin_type_code = pin_type_codes_rm[pinInNodeIdx]
                    elif node.numPins() == 2:
                        pin_type_code = pin_type_codes_rm[pinInNodeIdx]
                    else:
                        print(cellName)
                        raise NotImplementedError("Not support tpye of pins.")

                    # jump over pin with bulk type to avoid handle IO connections
                    if pin_type_code == 'B':
                        continue

                    fn.write(f"{pin_type_code}    1\n")
                    fn.write(" M%s    ((%.3f %.3f)" % (str(layer), (shape.xLo - boundary.xLo) * 1.0e-3, (shape.yLo - boundary.yLo) * 1.0e-3))
                    fn.write(" (%.3f %.3f))\n" % ((shape.xHi - boundary.xLo) * 1.0e-3, (shape.yHi - boundary.yLo) * 1.0e-3))

    def writePlaceResultFile(self, fileName):
        with open(fileName, 'w') as fn:
            for nodeIdx in range(self.numCktNodes):
                cktNode = self.ckt.node(nodeIdx)
                subCkt = self.dDB.subCkt(cktNode.graphIdx)
                x_offset = self.placer.xCellLoc(nodeIdx) - self.origin[0]
                y_offset = self.placer.yCellLoc(nodeIdx) - self.origin[1]
                boundary = subCkt.layout().boundary()
                fn.write("%s %.3f %.3f %.3f %.3f\n" %  (cktNode.name.split("_")[-1], float(x_offset + boundary.xLo) * 1.0e-3, float(y_offset + boundary.yLo) * 1.0e-3,
                                                float(boundary.xHi - boundary.xLo) * 1.0e-3, float(boundary.yHi - boundary.yLo) * 1.0e-3))

    def writePlaceConnectionFile(self, fileName):
        pin_type_codes_pn = ['D', 'G', 'S', 'B']
        pin_type_codes_rm = ['PLUS', 'MINUS', 'B']
        pin_codes_map = {}

        with open(fileName, 'w') as fn:
            for netIdx in range(self.ckt.numNets()):
                net = self.ckt.net(netIdx)
                fn.write("%s " % (net.name))

                for pinInNetIdx in range(net.numPins()):
                    pinIdx = net.pinIdx(pinInNetIdx)
                    pin = self.ckt.pin(pinIdx)
                    nodeIdx = pin.nodeIdx
                    outCktNode = self.ckt.node(nodeIdx)
                    outNodeName = outCktNode.name

                    if outNodeName not in pin_codes_map:
                        pin_codes_map[outNodeName] = [outCktNode.pinIdx(pIdx) for pIdx in range(outCktNode.numPins())]

                    if outCktNode.numPins()  == 4:
                        pinTypeCode = pin_type_codes_pn[pin_codes_map[outNodeName].index(pinIdx)]
                    elif outCktNode.numPins() == 3:
                        pinTypeCode = pin_type_codes_rm[pin_codes_map[outNodeName].index(pinIdx)]
                    elif outCktNode.numPins() == 2:
                        pinTypeCode = pin_type_codes_rm[pin_codes_map[outNodeName].index(pinIdx)]
                    elif outCktNode.numPins() == 1:
                        # dummy node
                        continue
                    else:
                        raise NotImplementedError("Not support tpye of pins.")

                    # assert pin_count_map[outNodeName] is not empty
                    fn.write("%s %s " % (outNodeName.split("_")[-1], pinTypeCode))

                fn.write("\n")