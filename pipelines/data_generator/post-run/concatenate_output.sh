#!/bin/bash
cat results/bsp_prototype.header > results/result.csv
TMPDIR=$(cat /wheeler/scratch/${USER}/TMPDIR)
paste -d'\n' results/job_output/* >> results/result.csv

# Grab ldms output
mv /wheeler/scratch/$(whoami)/ldms_output/* results/ldms_output/

rm results/job_output/*
