##
# @file Flow.py
# @author Keren Zhu
# @date 07/07/2019
# @brief The flow
#

import magicalFlow
import Device_generator
import Constraint
import PnR
import StdCell
import subprocess
import time


class Flow(object):
    def __init__(self, db):
        self.mDB = db # MagicalDB
        self.dDB = db.designDB.db
        self.constraint = Constraint.Constraint(self.mDB)
        self.params = self.mDB.params
        self.pnrs = []
        self.runtime = 0
        self.no = -1
        self.pa_guide = []
        self.nw_params = []
        self.gn_guide = None
        self.place_runtime = 0
        self.route_runtime = 0

    def run(self):
        """
        @brief the main function to run the flow
        @return if successful
        """
        self.resultName = self.mDB.params.resultDir
        self.no = self.mDB.params.no
        # self.obj_param = [self.mDB.params.param_0,self.mDB.params.param_1,self.mDB.params.param_2]
        self.nw_params = getattr(self.mDB.params, 'nw_params', None)
        self.pa_guide = getattr(self.mDB.params, 'pa_guide', None)
        self.gn_guide = getattr(self.mDB.params, 'gn_guide', None)

        topCktIdx = self.mDB.topCktIdx() # The index of the topckt
        start = time.time()
        self.implCktLayout(topCktIdx)
        end = time.time()
        print("placement runtime ", end - start)
        self.place_runtime += end - start

        start = time.time()
        for pnr in self.pnrs:
            pnr.routeOnly(self.no, self.pa_guide, self.gn_guide)
        end = time.time()
        self.route_runtime += end - start

        print("placement runtime ", self.place_runtime)
        print("routing runtime ", self.route_runtime)

        return True

    def generateConstraints(self):
        for cktIdx in range(self.dDB.numCkts()):
            ckt = self.dDB.subCkt(cktIdx) #magicalFlow.CktGraph
            if magicalFlow.isImplTypeDevice(ckt.implType):
                continue
            if self.isCktStdCells(cktIdx):
                continue
            self.symDict = self.constraint.genConstraint(cktIdx, self.resultName)


    def isCktStdCells(self, cktIdx):
        if self.dDB.subCkt(cktIdx).name in self.params.stdCells:
            return True
        else:
            return False


    def setup(self, cktIdx):
        ckt = self.dDB.subCkt(cktIdx) 
        print("circuit name ",ckt.name)
        for nodeIdx in range(ckt.numNodes()):
            flipCell = False
            cktNode = ckt.node(nodeIdx)
            # print("cktNOde ",cktNode)
            # Flip cell if is in the "right" half device of symmetry
            if cktNode.name in self.symDict.values():
                flipCell = True
            if cktNode.isLeaf():
                continue
            subCktIdx = self.dDB.subCkt(cktIdx).node(nodeIdx).graphIdx
            devGen = Device_generator.Device_generator(self.mDB)
            if magicalFlow.isImplTypeDevice(self.dDB.subCkt(subCktIdx).implType):
                if flipCell:
                    devGen.generateDevice(subCktIdx, self.resultName+'/gds/', True) #FIXME: directly add to the database
                else:
                    devGen.generateDevice(subCktIdx, self.resultName+'/gds/', False)
                devGen.readGDS(subCktIdx, self.resultName+'/gds/')
            else:
                if flipCell:
                    cktNode.flipVertFlag = True

    def implCktLayout(self, cktIdx):
        """
        @brief implement the circuit layout
        """
        dDB = self.mDB.designDB.db #c++ database
        ckt = dDB.subCkt(cktIdx) #magicalFlow.CktGraph

        # If the ckt is a
        # device, generation will be added in setup()
        if magicalFlow.isImplTypeDevice(ckt.implType):
            print("generation of device", ckt.implType,ckt.name)
            Device_generator.Device_generator(self.mDB).generateDevice(cktIdx, self.resultName+'/gds/') #FIXME: directly add to the database
            return
        # If the ckt is a standard cell
        # This version only support DFCNQD2BWP and NR2D8BWP, hard-encoded
        # TODO: This should be parsed from the json file
        if self.isCktStdCells(cktIdx):
            print("standard cell ",ckt.name)
            StdCell.StdCell(self.mDB).setup(cktIdx, self.resultName)
            return
        # If the ckt is actually a circuit instead of a device
        print("subcuirt ",ckt.name, "num of nodes",ckt.numNodes())
        for nodeIdx in range(ckt.numNodes()):
            cktNode = ckt.node(nodeIdx) # magicalFlow.CktNode
            # print("node name",cktNode.name)
            if cktNode.isLeaf(): # Do not go deeper for leaf node
                print("leaf ",cktNode.name)
                continue
            subCkt = dDB.subCkt(cktNode.graphIdx)
            if (subCkt.isImpl): # Do not duplicately implement the layout
                continue
            self.implCktLayout(cktNode.graphIdx) # Recursively implement all the children
            ckt = dDB.subCkt(cktIdx) # just to make sure the reference is not messed up
        # After all the children being implemented. P&R at this circuit
        ckt = dDB.subCkt(cktIdx) #magicalFlow.CktGraph
        self.symDict = self.constraint.genConstraint(cktIdx, self.resultName)
        self.setup(cktIdx)
        pnr = PnR.PnR(self.mDB)
        pnr.placeOnly(cktIdx, self.resultName, self.no, self.nw_params)
        self.runtime += pnr.runtime
        self.pnrs.append(pnr)
        #PnR.PnR(self.mDB).implLayout(cktIdx, self.resultName)
