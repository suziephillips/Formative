#!/bin/bash

FILEPATH='../data'

#copy accel files into derived folder before cleaning them

mkdir ${FILEPATH}/derived/accel
cp ${FILEPATH}/original/accel/accel*.txt ${FILEPATH}/derived/accel

#Remove the first line from each file
for file in ${FILEPATH}/derived/accel/*
do
sed -i '1d' "$file"
done

#count number of files where first line starts with PAXSTAT
head -n1 ${FILEPATH}/derived/accel/accel*.txt | grep -c '^PAXSTAT'

#delete the rows with NAs
sed -i '' '/NA\tNA\tNA/d' ${FILEPATH}/derived/accel/accel-*.txt

#output IDS into one long list
ls ${FILEPATH}/derived/accel | grep -Eo '[0-9]+' > ../data/derived/accel/accel_ids.txt
