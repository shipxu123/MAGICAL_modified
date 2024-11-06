# mkdir ./dataset/rundir_0
# python3 ../../par_flow/python/Magical.py ./configs/ota2_0.json | tee log.txt
# mv log.txt ./dataset/rundir_0/
# mkdir ./dataset/rundir_1
# python3 ../../par_flow/python/Magical.py ./configs/ota2_1.json | tee log.txt
# mv log.txt ./dataset/rundir_1/
# mkdir ./dataset/rundir_2
# python3 ../../par_flow/python/Magical.py ./configs/ota2_2.json | tee log.txt
# mv log.txt ./dataset/rundir_2/
mkdir ./dataset/rundir_3
python3 ../../par_flow/python/Magical.py ./configs/ota2_3.json | tee log.txt
mv log.txt ./dataset/rundir_3/
