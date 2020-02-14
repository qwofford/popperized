#!/bin/bash

source env.sh

cat results/bsp_prototype.header > results/result.csv
paste -d'\n' results/job_output/* >> results/result.csv

# Delete old LDMS data
rm -rf ${MONITORING_OUTPUT_DIR}/*
rm -rf results/ldms_output/*

# Grab LDMS output
mv ${MONITORING_OUTPUT_DIR}/* results/ldms_output/

rm results/job_output/*
