#!/bin/bash

#making directories and copying data from downloads

mkdir -p data/original
mkdir data/derived

mkdir code

mkdir results


cp "/mnt/c/Users/phil0068/Downloads/accel.zip" "$HOME/HDS/formative/data/original"
cp "/mnt/c/Users/phil0068/Downloads/BMX_D.csv" "$HOME/HDS/formative/data/original"

unzip -d data/original data/original/accel.zip

#create a README txt file in the code folder

cd code

nano README.txt
