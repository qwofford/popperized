#!/bin/bash
TMPDIR=$(cat /wheeler/scratch/${USER}/TMPDIR)
mv ${TMPDIR}/* results/job_output
