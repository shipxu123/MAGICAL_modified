// Library name: ota_xt
// Cell name: New_OTA_XT_MAGICAL
// View name: schematic
topckt OTA_XT_MAGICAL GND NCAS VCM VDD VIM VIP VOM VOP VCMON VCMON2

M29 (VS VCMON2 GND GND) nch_hvt_mac l=120.0n w=27.0u multi=1 nf=15 \
sd=140.0n ad=2.943e-12 as=2.943e-12 pd=45.38u ps=45.38u \
nrd=0.000864 nrs=0.000864 sa=896.687n sb=896.687n sa1=284.504n \
sa2=666.903n sa3=924.092n sa4=767.046n sb1=284.504n sb2=666.903n \
sb3=924.092n spa=168.717n spa1=156.261n spa2=143.536n \
spa3=146.988n sap=304.808n spba=203.593n sapb=427.516n \
spba1=208.238n
M5 (PCAS VCM BIAS2 GND) nch_lvt_mac l=120.0n w=4.8u multi=1 nf=5 \
sd=140.0n ad=3.744e-13 as=3.744e-13 pd=6.54u ps=6.54u nrd=0.006718 \
nrs=0.006718 sa=373.415n sb=373.415n sa1=193.705n sa2=337.407n \
sa3=554.736n sa4=326.327n sb1=193.705n sb2=337.407n sb3=554.736n \
spa=238.049n spa1=194.541n spa2=151.735n spa3=163.487n \
sap=251.082n spba=216.456n sapb=392.862n spba1=221.394n
M30 (TAIL1 NBIAS_TAIL GND GND) nch_lvt_mac l=120.0n w=20u multi=1 \
nf=25 sd=140.0n ad=1.432e-12 as=1.432e-12 pd=24.38u ps=24.38u \
nrd=0.002224 nrs=0.002224 sa=1.35822u sb=1.35822u sa1=339.528n \
sa2=892.856n sa3=1.1257u sa4=1.16173u sb1=339.528n sb2=892.856n \
sb3=1.1257u spa=156.822n spa1=149.558n spa2=142.082n spa3=144.106n \
sap=341.323n spba=201.577n sapb=459.703n spba1=206.177n
M53 (VCMOP net0108 VS2 GND) nch_lvt_mac l=120.0n w=7.2u multi=1 nf=8 \
sd=140.0n ad=5.04e-13 as=5.76e-13 pd=8.32u ps=10.28u nrd=0.005391 \
nrs=0.005391 sa=541.635n sb=541.635n sa1=228.497n sa2=456.311n \
sa3=705.096n sa4=466.864n sb1=228.497n sb2=456.311n sb3=705.096n \
spa=196.864n spa1=171.954n spa2=146.917n spa3=153.744n sap=269.76n \
spba=208.557n sapb=400.029n spba1=213.315n
M12 (VCMON VCM VS2 GND) nch_lvt_mac l=120.0n w=7.2u multi=1 nf=8 \
sd=140.0n ad=5.04e-13 as=5.76e-13 pd=8.32u ps=10.28u nrd=0.005391 \
nrs=0.005391 sa=541.635n sb=541.635n sa1=228.497n sa2=456.311n \
sa3=705.096n sa4=466.864n sb1=228.497n sb2=456.311n sb3=705.096n \
spa=196.864n spa1=171.954n spa2=146.917n spa3=153.744n sap=269.76n \
spba=208.557n sapb=400.029n spba1=213.315n
M50 (VO1P NCAS CASN GND) nch_lvt_mac l=120.0n w=4u multi=1 nf=10 \
sd=140.0n ad=6.3e-13 as=7.02e-13 pd=10.4u ps=12.36u nrd=0.004321 \
nrs=0.004321 sa=647.216n sb=647.216n sa1=247.044n sa2=523.665n \
sa3=779.928n sa4=555.703n sb1=247.044n sb2=523.665n sb3=779.928n \
spa=184.424n spa1=165.046n spa2=145.432n spa3=150.768n \
sap=280.949n spba=206.326n sapb=407.976n spba1=211.034n
M49 (VO1M NCAS CASP GND) nch_lvt_mac l=120.0n w=4u multi=1 nf=10 \
sd=140.0n ad=6.3e-13 as=7.02e-13 pd=10.4u ps=12.36u nrd=0.004321 \
nrs=0.004321 sa=647.216n sb=647.216n sa1=247.044n sa2=523.665n \
sa3=779.928n sa4=555.703n sb1=247.044n sb2=523.665n sb3=779.928n \
spa=184.424n spa1=165.046n spa2=145.432n spa3=150.768n \
sap=280.949n spba=206.326n sapb=407.976n spba1=211.034n
M51 (NCAS NCAS NBIAS_TAIL GND) nch_lvt_mac l=120.0n w=4u multi=1 nf=5 \
sd=140.0n ad=3.12e-13 as=3.12e-13 pd=5.58u ps=5.58u nrd=0.010973 \
nrs=0.010973 sa=373.415n sb=373.415n sa1=193.705n sa2=337.407n \
sa3=554.736n sa4=326.327n sb1=193.705n sb2=337.407n sb3=554.736n \
spa=238.049n spa1=194.541n spa2=151.735n spa3=163.487n \
sap=251.082n spba=216.456n sapb=392.862n spba1=221.394n
M47 (NBIAS_TAIL VCM BIAS1 GND) nch_lvt_mac l=120.0n w=4.8u multi=1 \
nf=5 sd=140.0n ad=3.744e-13 as=3.744e-13 pd=6.54u ps=6.54u \
nrd=0.006718 nrs=0.006718 sa=373.415n sb=373.415n sa1=193.705n \
sa2=337.407n sa3=554.736n sa4=326.327n sb1=193.705n sb2=337.407n \
sb3=554.736n spa=238.049n spa1=194.541n spa2=151.735n \
spa3=163.487n sap=251.082n spba=216.456n sapb=392.862n \
spba1=221.394n
M38 (BIAS1 NBIAS_TAIL GND GND) nch_lvt_mac l=120.0n w=4u multi=1 nf=5 \
sd=140.0n ad=3.12e-13 as=3.12e-13 pd=5.58u ps=5.58u nrd=0.010973 \
nrs=0.010973 sa=373.415n sb=373.415n sa1=193.705n sa2=337.407n \
sa3=554.736n sa4=326.327n sb1=193.705n sb2=337.407n sb3=554.736n \
spa=238.049n spa1=194.541n spa2=151.735n spa3=163.487n \
sap=251.082n spba=216.456n sapb=392.862n spba1=221.394n
M7 (VOP VIM VS GND) nch_lvt_mac l=120.0n w=24.0u multi=1 nf=15 \
sd=160.0n ad=2.952e-12 as=2.952e-12 pd=40.86u ps=40.86u \
nrd=0.000824 nrs=0.000824 sa=932.85n sb=932.85n sa1=285.145n \
sa2=681.55n sa3=946.195n sa4=793.443n sb1=285.145n sb2=681.55n \
sb3=946.195n spa=189.709n spa1=176.916n spa2=164.001n spa3=167.68n \
sap=340.02n spba=224.749n sapb=458.761n spba1=229.514n
M43 (CASN VIM TAIL1 GND) nch_lvt_mac l=120.0n w=6u multi=1 nf=5 \
sd=140.0n ad=1.053e-12 as=1.053e-12 pd=16.98u ps=16.98u \
nrd=0.002565 nrs=0.002565 sa=373.415n sb=373.415n sa1=193.705n \
sa2=337.407n sa3=554.736n sa4=326.327n sb1=193.705n sb2=337.407n \
sb3=554.736n spa=238.049n spa1=194.541n spa2=151.735n \
spa3=163.487n sap=251.082n spba=216.456n sapb=392.862n \
spba1=221.394n
M10 (VOM VIP VS GND) nch_lvt_mac l=120.0n w=24.0u multi=1 nf=15 \
sd=160.0n ad=2.952e-12 as=2.952e-12 pd=40.86u ps=40.86u \
nrd=0.000824 nrs=0.000824 sa=932.85n sb=932.85n sa1=285.145n \
sa2=681.55n sa3=946.195n sa4=793.443n sb1=285.145n sb2=681.55n \
sb3=946.195n spa=189.709n spa1=176.916n spa2=164.001n spa3=167.68n \
sap=340.02n spba=224.749n sapb=458.761n spba1=229.514n
M40 (CASP VIP TAIL1 GND) nch_lvt_mac l=120.0n w=6u multi=1 nf=5 \
sd=140.0n ad=1.053e-12 as=1.053e-12 pd=16.98u ps=16.98u \
nrd=0.002565 nrs=0.002565 sa=373.415n sb=373.415n sa1=193.705n \
sa2=337.407n sa3=554.736n sa4=326.327n sb1=193.705n sb2=337.407n \
sb3=554.736n spa=238.049n spa1=194.541n spa2=151.735n \
spa3=163.487n sap=251.082n spba=216.456n sapb=392.862n \
spba1=221.394n
M41 (VS2 NBIAS_TAIL GND GND) nch_lvt_mac l=120.0n w=14.4u multi=1 \
nf=10 sd=140.0n ad=1.008e-12 as=1.1232e-12 pd=15.8u ps=18.84u \
nrd=0.002489 nrs=0.002489 sa=647.216n sb=647.216n sa1=247.044n \
sa2=523.665n sa3=779.928n sa4=555.703n sb1=247.044n sb2=523.665n \
sb3=779.928n spa=184.424n spa1=165.046n spa2=145.432n \
spa3=150.768n sap=280.949n spba=206.326n sapb=407.976n \
spba1=211.034n
M31 (BIAS2 NBIAS_TAIL GND GND) nch_lvt_mac l=120.0n w=4u multi=1 nf=5 \
sd=140.0n ad=3.12e-13 as=3.12e-13 pd=5.58u ps=5.58u nrd=0.010973 \
nrs=0.010973 sa=373.415n sb=373.415n sa1=193.705n sa2=337.407n \
sa3=554.736n sa4=326.327n sb1=193.705n sb2=337.407n sb3=554.736n \
spa=238.049n spa1=194.541n spa2=151.735n spa3=163.487n \
sap=251.082n spba=216.456n sapb=392.862n spba1=221.394n
C0 (VO1P net096) cfmom_2t nr=26 lr=1.9u w=70n s=70n stm=3 spm=6 \
multi=1 ftip=140.0n
C1 (VO1M net096) cfmom_2t nr=26 lr=1.9u w=70n s=70n stm=3 spm=6 \
multi=1 ftip=140.0n
C4 (VCMON2 VOP) cfmom_2t nr=36 lr=4.17u w=70n s=70n stm=3 spm=6 \
multi=1 ftip=140.0n
C7 (net0108 VOP) cfmom_2t nr=18 lr=1.91u w=70n s=70n stm=4 spm=6 \
multi=1 ftip=140.0n
C3 (VCMON2 VOM) cfmom_2t nr=36 lr=4.17u w=70n s=70n stm=3 spm=6 \
multi=1 ftip=140.0n
C6 (net0108 VOM) cfmom_2t nr=18 lr=1.91u w=70n s=70n stm=4 spm=6 \
multi=1 ftip=140.0n

//Series configuration of R10
R10 (net0108 VOM GND ) rppolywo_m lr=3.6u wr=400n multi=(1) m=1 series=6 segspace=250n
//End of R10

//Series configuration of R1
R1 (VOP net0108 GND ) rppolywo_m lr=3.6u wr=400n multi=(1) m=1 series=6 segspace=250n
//End of R1

//Series configuration of R8
R8 (VO1M net096 GND ) rppolywo_m lr=7.86u wr=400n multi=(1) m=1 series=10 segspace=250n
//End of R8

//Series configuration of R2
R2 (net096 VO1P GND ) rppolywo_m lr=7.86u wr=400n multi=(1) m=1 series=10 segspace=250n
//End of R2

M57 (VO1P PCAS CAS2N VDD) pch_lvt_mac l=120.0n w=9.0u multi=1 nf=10 \
sd=140.0n ad=1.26e-12 as=1.404e-12 pd=19.4u ps=23.16u nrd=0.002681 \
nrs=0.002681 sa=647.216n sb=647.216n sa1=247.044n sa2=523.665n \
sa3=779.928n sa4=555.703n sb1=247.044n sb2=523.665n sb3=779.928n \
spa=184.424n spa1=165.046n spa2=145.432n spa3=150.768n \
sap=280.949n spba=206.326n sapb=407.976n spba1=211.034n
M64 (VCMON VCMOP VDD VDD) pch_lvt_mac l=120.0n w=9.6u multi=1 nf=10 \
sd=140.0n ad=6.72e-13 as=7.488e-13 pd=11.0u ps=13.08u nrd=0.004202 \
nrs=0.004202 sa=647.216n sb=647.216n sa1=247.044n sa2=523.665n \
sa3=779.928n sa4=555.703n sb1=247.044n sb2=523.665n sb3=779.928n \
spa=184.424n spa1=165.046n spa2=145.432n spa3=150.768n \
sap=280.949n spba=206.326n sapb=407.976n spba1=211.034n
M67 (VOM VO1P VDD VDD) pch_lvt_mac l=120.0n w=12.8u multi=1 nf=20 \
sd=160.0n ad=2.304e-12 as=2.3904e-12 pd=32.0u ps=35.0u \
nrd=0.001275 nrs=0.001275 sa=1.18001u sb=1.18001u sa1=315.042n \
sa2=804.355n sa3=1.05822u sa4=1.00332u sb1=315.042n sb2=804.355n \
sb3=1.05822u spa=181.951n spa1=172.524n spa2=162.966n \
spa3=165.685n sap=362.063n spba=223.34n sapb=477.361n \
spba1=228.075n
M66 (VCMOP VCMOP VDD VDD) pch_lvt_mac l=120.0n w=9.6u multi=1 nf=10 \
sd=140.0n ad=6.72e-13 as=7.488e-13 pd=11.0u ps=13.08u nrd=0.004202 \
nrs=0.004202 sa=647.216n sb=647.216n sa1=247.044n sa2=523.665n \
sa3=779.928n sa4=555.703n sb1=247.044n sb2=523.665n sb3=779.928n \
spa=184.424n spa1=165.046n spa2=145.432n spa3=150.768n \
sap=280.949n spba=206.326n sapb=407.976n spba1=211.034n
M8 (CAS2N net096 VDD VDD) pch_lvt_mac l=120.0n w=6u multi=1 nf=10 \
sd=160.0n ad=9.6e-13 as=1.032e-12 pd=13.6u ps=16.12u nrd=0.003362 \
nrs=0.003362 sa=671.348n sb=671.348n sa1=247.6n sa2=535.251n \
sa3=800.142n sa4=572.979n sb1=247.6n sb2=535.251n sb3=800.142n \
spa=205.947n spa1=186.054n spa2=166.147n spa3=171.834n \
sap=313.247n spba=227.766n sapb=437.505n spba1=232.595n
M61 (CAS2P net096 VDD VDD) pch_lvt_mac l=120.0n w=6u multi=1 nf=10 \
sd=160.0n ad=9.6e-13 as=1.032e-12 pd=13.6u ps=16.12u nrd=0.003362 \
nrs=0.003362 sa=671.348n sb=671.348n sa1=247.6n sa2=535.251n \
sa3=800.142n sa4=572.979n sb1=247.6n sb2=535.251n sb3=800.142n \
spa=205.947n spa1=186.054n spa2=166.147n spa3=171.834n \
sap=313.247n spba=227.766n sapb=437.505n spba1=232.595n
M56 (VO1M PCAS CAS2P VDD) pch_lvt_mac l=120.0n w=9u multi=1 nf=10 \
sd=140.0n ad=1.26e-12 as=1.404e-12 pd=19.4u ps=23.16u nrd=0.002681 \
nrs=0.002681 sa=647.216n sb=647.216n sa1=247.044n sa2=523.665n \
sa3=779.928n sa4=555.703n sb1=247.044n sb2=523.665n sb3=779.928n \
spa=184.424n spa1=165.046n spa2=145.432n spa3=150.768n \
sap=280.949n spba=206.326n sapb=407.976n spba1=211.034n
M9 (VOP VO1M VDD VDD) pch_lvt_mac l=120.0n w=12.8u multi=1 nf=20 \
sd=160.0n ad=2.304e-12 as=2.3904e-12 pd=32.0u ps=35.0u \
nrd=0.001275 nrs=0.001275 sa=1.18001u sb=1.18001u sa1=315.042n \
sa2=804.355n sa3=1.05822u sa4=1.00332u sb1=315.042n sb2=804.355n \
sb3=1.05822u spa=181.951n spa1=172.524n spa2=162.966n \
spa3=165.685n sap=362.063n spba=223.34n sapb=477.361n \
spba1=228.075n
M58 (PCAS PCAS net088 VDD) pch_lvt_mac l=120.0n w=6.4u multi=1 nf=4 \
sd=140.0n ad=4.48e-13 as=5.76e-13 pd=6.96u ps=10.32u nrd=0.007190 \
nrs=0.007190 sa=313.488n sb=313.488n sa1=179.031n sa2=290.688n \
sa3=485.728n sa4=276.641n sb1=179.031n sb2=290.688n sb3=485.728n \
spa=269.255n spa1=211.397n spa2=155.295n spa3=170.776n \
sap=244.923n spba=223.131n sapb=396.954n spba1=228.22n
M63 (net088 PCAS VDD VDD) pch_hvt_mac l=120.0n w=1.07u multi=1 nf=1 \
sd=140.0n ad=1.177e-13 as=1.177e-13 pd=2.36u ps=2.36u nrd=0.051060 \
nrs=0.051060 sa=110.0n sb=110.0n sa1=110.0n sa2=110.0n sa3=110.0n \
sa4=110.0n sb1=110.0n sb2=110.0n sb3=110.0n spa=3u spa1=3u spa2=3u \
spa3=3u sap=1.00025u spba=1.73551u sapb=577.831n spba1=1.74589u
ends OTA_XT_MAGICAL
// End of subcircuit definition.