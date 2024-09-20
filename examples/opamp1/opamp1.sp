subckt opa_gbn AVDD AVSS VBN1 VBN2 VBP1 VBP2 VIN VIP VON VOP VREF VSUB

    PM13 (net106 VBP1 AVDD AVDD) pch_lvt w=20u l=200n nf=4 as=2e-12 \
        ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=6 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    PM12 (VOP VBP1 AVDD AVDD) pch_lvt w=20u l=200n nf=4 as=2e-12 \
        ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=2 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    PM11 (VON VBP1 AVDD AVDD) pch_lvt w=20u l=200n nf=4 as=2e-12 \
        ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=2 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    PM17 (net109 VIN net106 net106) pch_lvt w=20u l=200n nf=4 as=2e-12 \
        ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=6 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    PM16 (net117 VIP net106 net106) pch_lvt w=20u l=200n nf=4 as=2e-12 \
        ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=6 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    PM15 (AVSS VREF net106 net106) pch_lvt w=20u l=200n nf=4 as=2e-12 \
        ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=6 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    NM18 (net109 VBN1 AVSS VSUB) nch_lvt w=10u l=200n nf=2 as=1.2e-12 \
        ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.661295 scb=1.50584e-08 scc=1.25368e-16 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=4 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    NM13 (VON VBN2 net117 VSUB) nch_lvt w=10u l=100n nf=2 as=1.2e-12 \
        ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.701781 scb=2.17516e-08 scc=2.0867e-16 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=2 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    NM16 (VOP VBN2 net109 VSUB) nch_lvt w=10u l=100n nf=2 as=1.2e-12 \
        ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.701781 scb=2.17516e-08 scc=2.0867e-16 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=2 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    NM17 (net117 VBN1 AVSS VSUB) nch_lvt w=10u l=200n nf=2 as=1.2e-12 \
        ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.661295 scb=1.50584e-08 scc=1.25368e-16 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=4 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    NM9 (AVSS AVDD AVSS VSUB) nch_lvt w=10u l=2u nf=2 as=1.2e-12 \
        ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.378865 scb=2.8937e-09 scc=2.14556e-17 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=1 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
ends opa_gbn
// End of subcircuit definition.

// Library name: CRAS01A1_12B170M_IQADC
// Cell name: inv12
// View name: schematic
subckt inv12 A B VDD VSS VSUB

    M0 (B A VDD VDD) pch_lvt w=2u l=45n m=1 nf=1
    M1 (B A VSS VSUB) nch_lvt w=1u l=45n m=1 nf=1
ends inv12
// End of subcircuit definition.

// Library name: CRAS01A1_12B170M_IQADC
// Cell name: inv12
// View name: schematic
// subckt inv12 A B VDD VSS VSUB
//     parameters pw=2u pf=1 nw=1u nf=1
// 
//     M0 (B A VDD VDD) pch_lvt w=((pw) * (pf)) l=45n nf=pf as=(1 * 0.12 + (((pf / 2) - floor(pf / 2) == 0) ? max(0,(pf/2 - 1)) : max((pf-1)/2,0)) * 0.16 + (((pf / 2) - floor(pf / 2) == 0) ? 1 : 0) * 0.12) * ((pw) / 1e-06) * 1e-06 * 1e-06 \
//          ad=(0 * 0.12 + (((pf / 2) - floor(pf / 2) == 0) ? pf/2 : max((pf-1)/2,0)) * 0.16 + (1 - ((((pf / 2) - floor(pf / 2) == 0) ? 1 : 0))) * 0.12) * ((pw) / 1e-06) * 1e-06 * 1e-06 \
//          ps=(2 * ((1 * 0.12 + (((pf / 2) - floor(pf / 2) == 0) ? max(0,(pf/2 - 1)) : max((pf-1)/2,0)) * 0.16 + (((pf / 2) - floor(pf / 2) == 0) ? 1 : 0) * 0.12) + ((pw) / 1e-06) * 1 + (((pf / 2) - floor(pf / 2) == 0) ? max(0,(pf/2 - 1)) : max((pf-1)/2,0)) + (((pf / 2) - floor(pf / 2) == 0) ? 1 : 0))) * 1e-06  \
//          pd=(2 * ((0 * 0.12 + (((pf / 2) - floor(pf / 2) == 0) ? pf/2 : max((pf-1)/2,0)) * 0.16 + (1 - ((((pf / 2) - floor(pf / 2) == 0) ? 1 : 0))) * 0.12) + ((pw) / 1e-06) * 0 + (((pf / 2) - floor(pf / 2) == 0) ? pf/2 : max((pf-1)/2,0)) + (1 - ((((pf / 2) - floor(pf / 2) == 0) ? 1 : 0))))) * 1e-06  \
//          nrd=(0.05 + 0.06 / 2)/ ((pw) * (pf) / 1e-06) nrs=(0.05 + 0.06 / 2)/ ((pw) * (pf) / 1e-06) \
//          sa=120.0n sb=120.0n sd=160.0n sca=((0 + 0.30185 + 0.30185 + (((1e-06 * 1e-06) / ((pw) * 0.9)) * ((1 / 1.8e-06) - (1 / (1.8e-06 + ((pw) * 0.9))))) + (((1e-06 * 1e-06) / ((pw) * 0.9)) * ((1 / 1.8e-06) - (1 / (1.8e-06 + ((pw) * 0.9)))))) / 1) \
//          scb=((0 + 2.27785e-08 + 2.27785e-08 + ((1 / ((pw) * 0.9)) * ((((1.8e-06 / 10.0) + (1e-06 / 100.0)) * exp(((-10.0 * 1.8e-06) / 1e-06))) - ((((1.8e-06 + ((pw) * 0.9)) / 10.0) + (1e-06 / 100.0)) * exp(((-10.0 * (1.8e-06 + ((pw) * 0.9))) / 1e-06))))) +((1 / ((pw) * 0.9)) * ((((1.8e-06 / 10.0) + (1e-06 / 100.0)) * exp(((-10.0 * 1.8e-06) / 1e-06))) - ((((1.8e-06 + ((pw) * 0.9)) / 10.0) + (1e-06 / 100.0)) * exp(((-10.0 * (1.8e-06 + ((pw) * 0.9))) / 1e-06)))))) / 1) \
//          scc=((0 + 2.88937e-16 + 2.88937e-16 + ((1 / ((pw) * 0.9)) * ((((1.8e-06 / 20.0) + (1e-06 / 400.0)) * exp(((-20.0 * 1.8e-06) / 1e-06))) - ((((1.8e-06 + ((pw) * 0.9)) / 20.0) + (1e-06 / 400.0)) * exp(((-20.0 * (1.8e-06 + ((pw) * 0.9))) / 1e-06))))) + ((1 / ((pw) * 0.9)) * ((((1.8e-06 / 20.0) + (1e-06 / 400.0)) * exp(((-20.0 * 1.8e-06) / 1e-06))) - ((((1.8e-06 + ((pw) * 0.9)) / 20.0) + (1e-06 / 400.0)) * exp(((-20.0 * (1.8e-06 + ((pw) * 0.9))) / 1e-06)))))) / 1) \
//          DCN=(7) DPS=((1.5e-07 + 1.5e-07)/2 + (pf - 1) * 1.6e-07)/pf DPCS=50n \
//         DSTS=1u mr=1 mismod=1 globalmod=1 prelayout=1 LPEMOD=1
//     M1 (B A VSS VSUB) nch_lvt w=((nw) * (nf)) l=45n nf=nf as=(1 * 0.12 + (((nf / 2) - floor(nf / 2) == 0) ? max(0,(nf/2 - 1)) : max((nf-1)/2,0)) * 0.16 + (((nf / 2) - floor(nf / 2) == 0) ? 1 : 0) * 0.12) * ((nw) / 1e-06) * 1e-06 * 1e-06 \
//          ad=(0 * 0.12 + (((nf / 2) - floor(nf / 2) == 0) ? nf/2 : max((nf-1)/2,0)) * 0.16 + (1 - ((((nf / 2) - floor(nf / 2) == 0) ? 1 : 0))) * 0.12) * ((nw) / 1e-06) * 1e-06 * 1e-06 \
//          ps=(2 * ((1 * 0.12 + (((nf / 2) - floor(nf / 2) == 0) ? max(0,(nf/2 - 1)) : max((nf-1)/2,0)) * 0.16 + (((nf / 2) - floor(nf / 2) == 0) ? 1 : 0) * 0.12) + ((nw) / 1e-06) * 1 + (((nf / 2) - floor(nf / 2) == 0) ? max(0,(nf/2 - 1)) : max((nf-1)/2,0)) + (((nf / 2) - floor(nf / 2) == 0) ? 1 : 0))) * 1e-06  \
//          pd=(2 * ((0 * 0.12 + (((nf / 2) - floor(nf / 2) == 0) ? nf/2 : max((nf-1)/2,0)) * 0.16 + (1 - ((((nf / 2) - floor(nf / 2) == 0) ? 1 : 0))) * 0.12) + ((nw) / 1e-06) * 0 + (((nf / 2) - floor(nf / 2) == 0) ? nf/2 : max((nf-1)/2,0)) + (1 - ((((nf / 2) - floor(nf / 2) == 0) ? 1 : 0))))) * 1e-06  \
//          nrd=(0.05 + 0.06 / 2)/ ((nw) * (nf) / 1e-06) nrs=(0.05 + 0.06 / 2)/ ((nw) * (nf) / 1e-06) \
//          sa=120.0n sb=120.0n sd=160.0n sca=((0 + 0.30185 + 0.30185 + (((1e-06 * 1e-06) / ((nw) * 0.9)) * ((1 / 1.8e-06) - (1 / (1.8e-06 + ((nw) * 0.9))))) + (((1e-06 * 1e-06) / ((nw) * 0.9)) * ((1 / 1.8e-06) - (1 / (1.8e-06 + ((nw) * 0.9)))))) / 1) \
//          scb=((0 + 2.27785e-08 + 2.27785e-08 + ((1 / ((nw) * 0.9)) * ((((1.8e-06 / 10.0) + (1e-06 / 100.0)) * exp(((-10.0 * 1.8e-06) / 1e-06))) - ((((1.8e-06 + ((nw) * 0.9)) / 10.0) + (1e-06 / 100.0)) * exp(((-10.0 * (1.8e-06 + ((nw) * 0.9))) / 1e-06))))) +((1 / ((nw) * 0.9)) * ((((1.8e-06 / 10.0) + (1e-06 / 100.0)) * exp(((-10.0 * 1.8e-06) / 1e-06))) - ((((1.8e-06 + ((nw) * 0.9)) / 10.0) + (1e-06 / 100.0)) * exp(((-10.0 * (1.8e-06 + ((nw) * 0.9))) / 1e-06)))))) / 1) \
//          scc=((0 + 2.88937e-16 + 2.88937e-16 + ((1 / ((nw) * 0.9)) * ((((1.8e-06 / 20.0) + (1e-06 / 400.0)) * exp(((-20.0 * 1.8e-06) / 1e-06))) - ((((1.8e-06 + ((nw) * 0.9)) / 20.0) + (1e-06 / 400.0)) * exp(((-20.0 * (1.8e-06 + ((nw) * 0.9))) / 1e-06))))) + ((1 / ((nw) * 0.9)) * ((((1.8e-06 / 20.0) + (1e-06 / 400.0)) * exp(((-20.0 * 1.8e-06) / 1e-06))) - ((((1.8e-06 + ((nw) * 0.9)) / 20.0) + (1e-06 / 400.0)) * exp(((-20.0 * (1.8e-06 + ((nw) * 0.9))) / 1e-06)))))) / 1) \
//          DCN=(7) DPS=((1.5e-07 + 1.5e-07)/2 + (nf - 1) * 1.6e-07)/nf DPCS=50n \
//         DSTS=1u mr=1 mismod=1 globalmod=1 prelayout=1 LPEMOD=1
// ends inv12
// End of subcircuit definition.


// Library name: CRAS01A1_12B170M_IQADC
// Cell name: opa_gbp
// View name: schematic
subckt opa_gbp AVDD AVSS VBN1 VBN2 VBP1 VBP2 VIN VIP VON VOP VREF VSUB

    PM0 (net114 VBP1 AVDD AVDD) pch_lvt w=20u l=200n nf=4 as=2e-12 \
        ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=4 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    PM1 (VOP VBP2 net114 AVDD) pch_lvt w=20u l=100n nf=4 as=2e-12 \
        ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=2 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    PM13 (net86 VBP1 AVDD AVDD) pch_lvt w=20u l=200n nf=4 as=2e-12 \
        ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=4 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    PM14 (VON VBP2 net86 AVDD) pch_lvt w=20u l=100n nf=4 as=2e-12 \
        ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=2 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    PM6 (AVDD AVSS AVDD AVDD) pch_lvt w=10u l=1u nf=2 as=1.2e-12 \
        ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.476043 scb=4.50087e-09 scc=3.33754e-17 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=1 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    NM5 (net114 VIN net109 VSUB) nch_lvt w=10u l=200n nf=2 as=1.2e-12 \
        ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.661295 scb=1.50584e-08 scc=1.25368e-16 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=2 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    NM11 (net109 VBN1 AVSS VSUB) nch_lvt w=10u l=200n nf=2 as=1.2e-12 \
        ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.661295 scb=1.50584e-08 scc=1.25368e-16 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=6 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    NM4 (net86 VIP net109 VSUB) nch_lvt w=10u l=200n nf=2 as=1.2e-12 \
        ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.661295 scb=1.50584e-08 scc=1.25368e-16 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=2 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    NM15 (AVDD VREF net109 VSUB) nch_lvt w=10u l=200n nf=2 as=1.2e-12 \
        ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.661295 scb=1.50584e-08 scc=1.25368e-16 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=2 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    NM1 (VOP VBN1 AVSS VSUB) nch_lvt w=10u l=200n nf=2 as=1.2e-12 \
        ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.661295 scb=1.50584e-08 scc=1.25368e-16 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=2 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
    NM0 (VON VBN1 AVSS VSUB) nch_lvt w=10u l=200n nf=2 as=1.2e-12 \
        ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
        sb=120.0n sd=160.0n sca=0.661295 scb=1.50584e-08 scc=1.25368e-16 \
        DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=2 mismod=1 \
        globalmod=1 prelayout=1 LPEMOD=1
ends opa_gbp
// End of subcircuit definition.

// Library name: smic40ll
// Cell name: rppolywo_m
// View name: schematic
// parameters segL=8u segW=1.5u mismod=1 flag_cc=1
subckt rpposab_2t_ckt_pcell_0 MINUS PLUS

    R1 (PLUS MINUS) rppolywo_m lr=8u wr=1.5u multi=1 \
        flag_cc=1
    R0 (PLUS MINUS) rppolywo_m lr=8u wr=1.5u multi=1 \
        flag_cc=1
ends rpposab_2t_ckt_pcell_0
// End of subcircuit definition.

// Library name: CRAS01A1_12B170M_IQADC
// Cell name: opamp_sha
// View name: schematic
topckt opamp_sha AVDD12 AVSS12 CXN CXP IBIAS IBIASC PD VBP1 VBPS1 VCMFB1 \
        VCMFB2 VINN VINP VON1 VON2 VOP1 VOP2 VOUTN VOUTN1 VOUTP VOUTP1 \
        VSUB

    I23 (AVDD12 AVSS12 IBIAS IBIASC VBP1 VBP2 VFN2 VFN1 VON1 VON2 VCN1 VSUB) opa_gbn

    NM45 (net56 VOUTP1 net55 VSUB) nch_lvt w=10u l=100n nf=2 as=1.2e-12 \
            ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.701781 scb=2.17516e-08 scc=2.0867e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=1 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM42 (VOUTP VOUTN1 net72 VSUB) nch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=15 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM43 (VPS2 VOUTP1 net64 VSUB) nch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=3 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM44 (VPS1 VOUTN1 net64 VSUB) nch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=3 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM41 (VOUTN VOUTP1 net72 VSUB) nch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=15 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM46 (net56 VOUTN1 net55 VSUB) nch_lvt w=10u l=100n nf=2 as=1.2e-12 \
            ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.701781 scb=2.17516e-08 scc=2.0867e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=1 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1

    PM1 (VOUTP VCMFB2 AVDD12 AVDD12) pch_lvt w=15u l=100n nf=3 as=1.4e-12 \
            ad=1.4e-12 ps=20.56u pd=20.56u nrd=0.00533333 nrs=0.00533333 \
            sa=120.0n sb=120.0n sd=160.0n sca=0.651302 scb=1.5073e-08 \
            scc=1.42306e-16 DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=5 \
            mismod=1 globalmod=1 prelayout=1 LPEMOD=1
    PM0 (VBPS1 VBPS1 AVDD12 AVDD12) pch_lvt w=10u l=100n nf=2 as=1.2e-12 \
            ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.701781 scb=2.17516e-08 scc=2.0867e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=1 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    PM22 (AVDD12 VBPS1 AVDD12 AVDD12) pch_lvt w=80u l=2u nf=16 as=6.8e-12 \
            ad=6.4e-12 ps=92.72u pd=82.56u nrd=0.001 nrs=0.001 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.211154 scb=1.48704e-09 scc=1.10258e-17 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=1 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    PM5 (VFP2 VCMFB1 AVDD12 AVDD12) pch_lvt w=20u l=200n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=12 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    PM34 (AVDD12 VOP2 AVDD12 AVDD12) pch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=6 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    PM13 (AVDD12 VBP1 AVDD12 AVDD12) pch_lvt w=50u l=1u nf=10 as=4.4e-12 \
            ad=4e-12 ps=61.76u pd=51.6u nrd=0.0016 nrs=0.0016 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.270684 scb=1.92904e-09 scc=1.43037e-17 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=1 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    PM17 (VOUTN VCMFB2 AVDD12 AVDD12) pch_lvt w=15u l=100n nf=3 as=1.4e-12 \
            ad=1.4e-12 ps=20.56u pd=20.56u nrd=0.00533333 nrs=0.00533333 \
            sa=120.0n sb=120.0n sd=160.0n sca=0.651302 scb=1.5073e-08 \
            scc=1.42306e-16 DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=5 \
            mismod=1 globalmod=1 prelayout=1 LPEMOD=1
    PM18 (VOUTN VPS1 AVDD12 AVDD12) pch_lvt w=15u l=100n nf=3 as=1.4e-12 \
            ad=1.4e-12 ps=20.56u pd=20.56u nrd=0.00533333 nrs=0.00533333 \
            sa=120.0n sb=120.0n sd=160.0n sca=0.651302 scb=1.5073e-08 \
            scc=1.42306e-16 DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=5 \
            mismod=1 globalmod=1 prelayout=1 LPEMOD=1
    PM20 (VPS2 VPS2 AVDD12 AVDD12) pch_lvt w=15u l=100n nf=3 as=1.4e-12 \
            ad=1.4e-12 ps=20.56u pd=20.56u nrd=0.00533333 nrs=0.00533333 \
            sa=120.0n sb=120.0n sd=160.0n sca=0.651302 scb=1.5073e-08 \
            scc=1.42306e-16 DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=1 \
            mismod=1 globalmod=1 prelayout=1 LPEMOD=1
    PM8 (VFP1 VCMFB1 AVDD12 AVDD12) pch_lvt w=20u l=200n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=12 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    PM3 (VBP2 VBP2 net131 AVDD12) pch_lvt w=20u l=100n nf=4 as=2.5p \
            ad=1.9p ps=31u pd=20.76u nrd=0.08 nrs=0.08 sa=120n sb=120n sd=190n \
            sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=1 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    M91 (VCP1 VBP1 AVDD12 AVDD12) pch_lvt w=20u l=200n nf=4 as=2.5p \
            ad=1.9p ps=31u pd=20.76u nrd=0.08 nrs=0.08 sa=120n sb=120n sd=190n \
            sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=1 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    PM6 (VFP2 VBP1 AVDD12 AVDD12) pch_lvt w=20u l=200n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=20 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    PM29 (AVDD12 VOP1 AVDD12 AVDD12) pch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=6 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    PM10 (VOUTN1 VOP1 VFP1 AVDD12) pch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=16 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    PM19 (VOUTP VPS2 AVDD12 AVDD12) pch_lvt w=15u l=100n nf=3 as=1.4e-12 \
            ad=1.4e-12 ps=20.56u pd=20.56u nrd=0.00533333 nrs=0.00533333 \
            sa=120.0n sb=120.0n sd=160.0n sca=0.651302 scb=1.5073e-08 \
            scc=1.42306e-16 DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=5 \
            mismod=1 globalmod=1 prelayout=1 LPEMOD=1
    PM7 (VFP1 VBP1 AVDD12 AVDD12) pch_lvt w=20u l=200n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=20 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    PM9 (VOUTP1 VOP2 VFP2 AVDD12) pch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=16 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    PM4 (net131 VBP2 AVDD12 AVDD12) pch_lvt w=10u l=900n nf=2 as=1.2e-12 \
            ad=8e-13 ps=20.48u pd=10.32u nrd=0.008 nrs=0.008 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.491106 scb=4.85739e-09 scc=3.60242e-17 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=1 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    PM16 (net56 VBP2 net130 AVDD12) pch_lvt w=20u l=100n nf=4 as=2.5p \
            ad=1.9p ps=31u pd=20.76u nrd=0.08 nrs=0.08 sa=120n sb=120n sd=190n \
            sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=2 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    PM2 (VBP1 VBP2 VCP1 AVDD12) pch_lvt w=20u l=100n nf=4 as=2.5p ad=1.9p \
            ps=31u pd=20.76u nrd=0.08 nrs=0.08 sa=120n sb=120n sd=190n \
            sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=1 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    PM15 (net130 VBP1 AVDD12 AVDD12) pch_lvt w=20u l=200n nf=4 as=2.5p \
            ad=1.9p ps=31u pd=20.76u nrd=0.08 nrs=0.08 sa=120n sb=120n sd=190n \
            sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=2 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    PM21 (VPS1 VPS1 AVDD12 AVDD12) pch_lvt w=15u l=100n nf=3 as=1.4e-12 \
            ad=1.4e-12 ps=20.56u pd=20.56u nrd=0.00533333 nrs=0.00533333 \
            sa=120.0n sb=120.0n sd=160.0n sca=0.651302 scb=1.5073e-08 \
            scc=1.42306e-16 DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=1 \
            mismod=1 globalmod=1 prelayout=1 LPEMOD=1
    I29 (PDB PDI AVDD12 AVSS12 VSUB) inv12 pw=2u pf=1 nw=1u nf=1
    I30 (PD PDB AVDD12 AVSS12 VSUB) inv12 pw=2u pf=1 nw=1u nf=1
    I22 (AVDD12 AVSS12 IBIAS IBIASC VBP1 VBP2 VFP2 VFP1 VOP1 VOP2 VCP1 VSUB) opa_gbp
    NM21 (VFP1 VINP net38 VSUB) nch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=8 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM19 (VOUTN1 VON1 VFN1 VSUB) nch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=8 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM1 (AVSS12 VON1 AVSS12 VSUB) nch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=4 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM0 (AVSS12 VON2 AVSS12 VSUB) nch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=4 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM8 (AVSS12 AVDD12 AVSS12 VSUB) nch_lvt w=270u l=2u nf=54 as=2.2e-11 \
            ad=2.16e-11 ps=288.8u pd=278.64u nrd=0.000296296 nrs=0.000296296 \
            sa=120.0n sb=120.0n sd=160.0n sca=0.187076 scb=1.34563e-09 \
            scc=9.97729e-18 DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=1 \
            mismod=1 globalmod=1 prelayout=1 LPEMOD=1
    NM20 (VOUTP1 VON2 VFN2 VSUB) nch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=8 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM60 (VBPS1 IBIASC net132 VSUB) nch_lvt w=10u l=100n nf=2 as=1.55p \
            ad=950f ps=20.62u pd=10.38u nrd=0.08 nrs=0.08 sa=120n sb=120n \
            sd=190n sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=2 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    NM27 (VFN1 IBIAS AVSS12 VSUB) nch_lvt w=20u l=200n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=8 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    M44 (IBIASC IBIASC net134 VSUB) nch_lvt w=10u l=100n nf=2 as=1.55p \
            ad=950f ps=20.62u pd=10.38u nrd=0.08 nrs=0.08 sa=120n sb=120n \
            sd=190n sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=1 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    M43 (net134 IBIASC AVSS12 VSUB) nch_lvt w=5u l=1.2u nf=1 as=6e-13 \
            ad=6e-13 ps=10.24u pd=10.24u nrd=0.016 nrs=0.016 sa=120.0n \
            sb=120.0n sd=0 sca=0.562169 scb=6.64461e-09 scc=4.92684e-17 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=1 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM37 (net55 net56 AVSS12 VSUB) nch_lvt w=20u l=200n nf=4 as=2.5p \
            ad=1.9p ps=31u pd=20.76u nrd=0.08 nrs=0.08 sa=120n sb=120n sd=190n \
            sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=1 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    NM10 (VBP2 IBIAS AVSS12 VSUB) nch_lvt w=10u l=200n nf=2 as=1.55p \
            ad=950f ps=20.62u pd=10.38u nrd=0.08 nrs=0.08 sa=120n sb=120n \
            sd=190n sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=1 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    NM15 (net38 IBIAS AVSS12 VSUB) nch_lvt w=20u l=200n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=16 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    M69 (IBIAS IBIASC VCN1 VSUB) nch_lvt w=10u l=100n nf=2 as=1.55p \
            ad=950f ps=20.62u pd=10.38u nrd=0.08 nrs=0.08 sa=120n sb=120n \
            sd=190n sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=1 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    M57 (VCN1 IBIAS AVSS12 VSUB) nch_lvt w=10u l=200n nf=2 as=1.55p \
            ad=950f ps=20.62u pd=10.38u nrd=0.08 nrs=0.08 sa=120n sb=120n \
            sd=190n sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=1 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    NM13 (VBP1 IBIASC net133 VSUB) nch_lvt w=10u l=100n nf=2 as=1.55p \
            ad=950f ps=20.62u pd=10.38u nrd=0.08 nrs=0.08 sa=120n sb=120n \
            sd=190n sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=1 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    NM2 (IBIAS PDI AVSS12 VSUB) nch_lvt w=1u l=100n nf=1 as=1.2e-13 \
            ad=1.2e-13 ps=2.24u pd=2.24u nrd=0.08 nrs=0.08 sa=120.0n sb=120.0n \
            sd=0 sca=0.999412 scb=4.3351e-08 scc=4.41823e-16 DCN=7 \
            DPS=140.00n DPCS=50n DSTS=1u mr=1 mismod=1 globalmod=1 \
            prelayout=1 LPEMOD=1
    NM38 (net64 net56 AVSS12 VSUB) nch_lvt w=20u l=200n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=3 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM61 (net132 IBIAS AVSS12 VSUB) nch_lvt w=10u l=200n nf=2 as=1.55p \
            ad=950f ps=20.62u pd=10.38u nrd=0.08 nrs=0.08 sa=120n sb=120n \
            sd=190n sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=2 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    NM28 (VFN2 IBIAS AVSS12 VSUB) nch_lvt w=20u l=200n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=8 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM11 (net133 IBIAS AVSS12 VSUB) nch_lvt w=10u l=200n nf=2 as=1.55p \
            ad=950f ps=20.62u pd=10.38u nrd=0.08 nrs=0.08 sa=120n sb=120n \
            sd=190n sca=1.0167 scb=5.2906e-08 scc=6.48168e-16 DCN=7 DPS=150n \
            DPCS=50n DSTS=1u mr=1 mismod=1 globalmod=1 prelayout=1 \
            LPEMOD=1
    NM39 (net72 net56 AVSS12 VSUB) nch_lvt w=20u l=200n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.557654 scb=8.18643e-09 scc=6.74522e-17 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=30 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    NM23 (VFP2 VINN net38 VSUB) nch_lvt w=20u l=100n nf=4 as=2e-12 \
            ad=1.6e-12 ps=30.8u pd=20.64u nrd=0.004 nrs=0.004 sa=120.0n \
            sb=120.0n sd=160.0n sca=0.609667 scb=1.16377e-08 scc=1.09114e-16 \
            DCN=36 DPS=140.00n DPCS=50n DSTS=1u mr=8 mismod=1 \
            globalmod=1 prelayout=1 LPEMOD=1
    C0 (CXP VOUTN) cfmom nr=246 lr=14.58u w=70n s=70n stm=1 spm=6 multi=1\
            ftip=140.0n
    C1 (CXN VOUTP) cfmom nr=246 lr=14.58u w=70n s=70n stm=1 spm=6 multi=1\
            ftip=140.0n
    R0 (CXP VOUTP1) rpposab_2t_ckt_pcell_0 m=1 segL=2u segW=8u mismod=1 \
            flag_cc=1
    R1 (CXN VOUTN1) rpposab_2t_ckt_pcell_0 m=1 segL=2u segW=8u mismod=1 \
           flag_cc=1
ends opamp_sha

// simulatorOptions options psfversion="1.4.0" reltol=1e-3 vabstol=1e-6 \
//     iabstol=1e-12 temp=27 tnom=27 scalem=1.0 scale=0.9 gmin=1e-12 rforce=1 \
//     maxnotes=5 maxwarns=5 digits=5 cols=80 pivrel=1e-3 \
//     sensfile="../psf/sens.output" checklimitdest=psf 
// modelParameter info what=models where=rawfile
// element info what=inst where=rawfile
// outputParameter info what=output where=rawfile
// designParamVals info what=parameters where=rawfile
// primitives info what=primitives where=rawfile
// subckts info what=subckts where=rawfile
// saveOptions options save=allpub
