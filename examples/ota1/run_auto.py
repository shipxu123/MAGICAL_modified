import random
import json
import subprocess
all_commomd_lines = []
for i in range(20):
    params = [random.uniform(0, 1),random.uniform(0, 1),random.uniform(0, 1)]
    print(params)
    design_conf_json = {
    "spectre_netlist" : "ota1.sp",
    "resultDir" : "./",
    "techfile"  : "../mockPDK/mock.techfile",
    "simple_tech_file" :  "../mockPDK/techfile.simple",
    "lef" : "../mockPDK/mock.lef",
    "no": i,
    "param_0": round(params[0],2),
    "param_1": round(params[1],2),
    "param_2": round(params[2],2)
    }
    json_obj = json.dumps(design_conf_json)
    with open("ota1_{}.json".format(i),"w") as f:
        f.write(json_obj) 
    all_commomd_lines.append("python ../../flow/python/Magical.py ota1_{}.json | tee log.txt\n".format(i,i))
    all_commomd_lines.append("mv log.txt ./dataset/rundir_{}/\n".format(i))
with open("run_all.sh","w") as f:
    f.writelines(all_commomd_lines)