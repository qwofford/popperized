#!/usr/bin/env bash

# Load workflow environment
source env.sh

# [wf] Load host singularity module
module load openssl-1.1.1b-gcc-4.8.5-obdqvnl
module load singularity-3.2.1-gcc-4.8.5-ulix7vo


# [wf] Start the LDMS aggregator on the head node
$SINGULARITY_BIN/singularity exec -B /etc/hostname -B /wheeler/scratch/$(whoami)/ ${CONTAINER_IMAGE_DIR}/bsp_prototype  /opt/ldms_wheeler/start_agg_csv_template.sh 

# [wf] Run bsp simulation
qsub -I -q debug -x -d ${PWD} -l nodes=${PROBLEM_SIZE}:ppn=8 -l walltime=${USER_SPECIFIED_WALLTIME} -S /bin/bash -j oe -N cdse_datagen ${PWD}/run/datagen.sh
