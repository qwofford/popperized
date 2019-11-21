#!/bin/bash
#cat results/bsp_prototype.header > results/result.csv
echo '[' > results/result.json
TMPDIR=$(cat /wheeler/scratch/${USER}/TMPDIR)
cat ${TMPDIR}/* >> results/result.json
echo ']' >> results/result.json
