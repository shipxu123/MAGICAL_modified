import os
import random
import json
import subprocess

import numpy as np
import itertools

import pdb

# get nw parameter space
num_samples = 2
# num_params  = 5
num_params_s  = 4
num_params_e  = 6
total_nw_lenth = 18

def get_nw_params(num_samples, num_params_s, num_params_e, total_nw_lenth):
    params = []
    count = 1

    for i in range(total_nw_lenth):
        if count >= num_params_s and count <= num_params_e and i not in [5, 7]:
            param = [1, 2]
        else:
            param = [1]

        params.append(param)

        count += 1
    return params

nw_params_space = get_nw_params(num_samples, num_params_s, num_params_e, total_nw_lenth)

print(f'*********************Print Out NW Search Sapce*********************')
for i, param in enumerate(nw_params_space):
    print(f"{i}-th parameter")
    print(param)

import pdb; pdb.set_trace()

if not os.path.exists("./gds/"):
    os.mkdir("./gds/")

if not os.path.exists("./dataset/"):
    os.mkdir("./dataset/")

if not os.path.exists("./configs/"):
    os.mkdir("./configs/")

all_commomd_lines = []

pa_guides = [
# add one compared version
[[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]]
count = 0

for i, nw_params in enumerate(itertools.product(*nw_params_space)):
    for j, pa_guide in enumerate(pa_guides):
        print(f'*********************{count}-the iteration*********************')
        print(nw_params)
        print(pa_guide)

        design_conf_json = {
        "spectre_netlist" : "ota2.sp",
        "resultDir" : "./",
        "techfile"  : "../mockPDK/mock.techfile",
        "simple_tech_file" :  "../mockPDK/techfile.simple",
        "lef" : "../mockPDK/mock.lef",
        "no": count,
        "nw_params": nw_params,
        "pa_guide": pa_guide,
        "gn_guide": f'/MAGICAL_modified/PAR_Dataset/par_gn_guides/o2_{count+1}/guide_cfg.txt'
        }
        json_obj = json.dumps(design_conf_json)

        with open("./configs/ota2_{}.json".format(count),"w") as f:
            f.write(json_obj)

        all_commomd_lines.append("mkdir ./dataset/rundir_{}\n".format(count))
        all_commomd_lines.append("python3 ../../par_flow/python/Magical.py ./configs/ota2_{}.json | tee log.txt\n".format(count, count))
        all_commomd_lines.append("mv log.txt ./dataset/rundir_{}/\n".format(count))

        count += 1


with open("run_all.sh","w") as f:
    f.writelines(all_commomd_lines)
