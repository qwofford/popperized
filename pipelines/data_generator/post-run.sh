#!/usr/bin/env bash
source env.sh

# [wf] Delete previous output
rm -f results/ldms_output/*
rm -f results/bsp_sim_output/*
rm -f results/bsp.df

# [wf] Move local outputs to experiment output directory
mv ${APPLICATION_OUTPUT_DIR}/* results/bsp_sim_output
mv ${MONITORING_OUTPUT_DIR}/* results/ldms_output

# [wf] Merge json outputs into single file
./post-run/merge-json.sh

# [wf] Generate dataframe with container libs. Assume user can deal with Pandas dataframes
module load singularity-3.2.1-gcc-4.8.5-ulix7vo
singularity run ${CONTAINER_IMAGE_DIR}/bsp_prototype generate_dataframe

