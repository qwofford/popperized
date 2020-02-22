#!/usr/bin/env bash
source env.sh

# [wf] Delete previous output
rm -f results/ldms_output/*
rm -f results/bsp_sim_output/*

# [wf] Move local outputs to experiment output directory
mv ${APPLICATION_OUTPUT_DIR}/* results/bsp_sim_output
mv ${MONITORING_OUTPUT_DIR}/* results/ldms_output
