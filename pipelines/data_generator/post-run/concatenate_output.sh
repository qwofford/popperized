#!/bin/bash
cat results/bsp_prototype.csh >> results/result.csv
TMPDIR=$(cat /wheeler/scratch/${USER}/TMPDIR)
mv $TMPDIR/* >> results/result.csv
