#!/bin/bash

# 列表定义
names=(
  'INM'
  'INP'
  'OUTM'
  'OUTP'
  'VBIAS_P'
  'VDD'
  'VREF'
  'VSS'
  'net020'
  'net028'
  'vbias_n'
  'intm'
  'intp'
  'net037'
  'net047'
  'net7'
  'vcmfb'
  'net025'
)

# 遍历文件
for ((index=0; index<${#names[@]}; index++)); do
  filename="pin${index}.png"
  newname="${names[$index]}.png"
  if [ -e "$filename" ]; then
    mv "$filename" "$newname"
    echo "Renamed $filename to $newname"
  else
    echo "File $filename does not exist"
  fi
done
