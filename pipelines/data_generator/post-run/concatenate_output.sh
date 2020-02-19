#!/bin/bash

source env.sh

cat results/bsp_prototype.header > results/result.csv
paste -d'\n' results/job_output/* >> results/result.csv


rm results/job_output/*
