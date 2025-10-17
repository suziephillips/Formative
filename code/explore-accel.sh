#!/bin/bash

FILEPATH='../data/original'

##
## checking the accelerometer data

# number of accelerometer files
Filefreq=`ls ${FILEPATH}/accel | wc -l`
echo "Number of files= $Filefreq"

echo "print first 15 lines of first file"
awk -F'\t' '{print NF}' ${FILEPATH}/accel/accel-31128.txt | head -n15

#can see that there is a top line which we don't want, then there is 8 variables


echo "check all files have this first line which we don't want"
awk 'FNR==1 && $0 !~ /^</ {print FILENAME}' ${FILEPATH}/accel/*.txt


echo "check that all rows in all the accel files (except first row) have 8 vars"
awk -F'\t' 'FNR == 1 { bad = 0 }; FNR > 1 && NF!=8 { bad = 1 }; ENDFILE { if (bad) print FILENAME }' ${FILEPATH}/accel/*.txt

