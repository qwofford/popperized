#!/bin/bash
cat results/bsp_prototype.csh >> results/result.csv
TMPDIR=$(cat /wheeler/scratch/${USER}/TMPDIR)
cat results/job_output/* >> results/result.csv
