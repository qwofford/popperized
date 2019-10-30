#!/bin/bash
#cat results/bsp_prototype.header > results/result.csv
TMPDIR=$(cat /wheeler/scratch/${USER}/TMPDIR)
paste -d'\n' results/job_output/* >> results/result.json
rm results/job_output/*
