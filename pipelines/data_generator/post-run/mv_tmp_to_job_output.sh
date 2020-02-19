#!/bin/bash

source env.sh

mv ${APPLICATION_OUTPUT_DIR}/*.csv results/job_output
mv ${MONITORING_OUTPUT_DIR}/* results/ldms_output
