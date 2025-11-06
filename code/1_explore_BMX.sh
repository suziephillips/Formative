#!/bin/bash

FILEPATH='../data/original'

echo "show top 15 lines of the data"
head -n15 ${FILEPATH}/BMX_D.csv

echo "print number of lines in the file"
wc -l ${FILEPATH}/BMX_D.csv

echo "print number of variables in the dataset"
awk -F, 'NR==1 {print NF}' ${FILEPATH}/BMX_D.csv

echo "print any instances where a line does not have 28 complete fields"
awk -F, '{print NR, NF}' ${FILEPATH}/BMX_D.csv | grep -v '28$'
