import os
import random
import json
import subprocess

import numpy as np
import itertools

import pdb

import pdb; pdb.set_trace()

if not os.path.exists("./dataset/"):
    os.mkdir("./dataset/")

if not os.path.exists("./configs/"):
    os.mkdir("./configs/")

all_commomd_lines = []

all_commomd_lines = []

# 12 34 35 36 37 39
nw_guides = [
    [1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 2, 1, 1, 2, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
]

pa_guides = [
# add one compared version
[[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]]
count = 0

for i, nw_params in enumerate(nw_guides):
    for j, pa_guide in enumerate(pa_guides):
        print(f'*********************{count}-the iteration*********************')
        print(nw_params)
        print(pa_guide)

        design_conf_json = {
        "spectre_netlist" : "ota4.sp",
        "resultDir" : "./",
        "techfile"  : "../mockPDK/mock.techfile",
        "simple_tech_file" :  "../mockPDK/techfile.simple",
        "lef" : "../mockPDK/mock.lef",
        "no": count,
        "nw_params": nw_params,
        "pa_guide": pa_guide,
        "gn_guide": f'/MAGICAL_modified/PAR_Dataset/par_gn_guides/o4_{count+1}/guide_cfg.txt'
        }
        json_obj = json.dumps(design_conf_json)

        with open("./configs/ota4_{}.json".format(count),"w") as f:
            f.write(json_obj)

        all_commomd_lines.append("mkdir ./dataset/rundir_{}\n".format(count))
        all_commomd_lines.append("python3 ../../par_flow/python/Magical.py ./configs/ota4_{}.json | tee log.txt\n".format(count, count))
        all_commomd_lines.append("mv log.txt ./dataset/rundir_{}/\n".format(count))

        count += 1


with open("run_all.sh","w") as f:
    f.writelines(all_commomd_lines)
