#!/usr/bin/env bash
# [wf] Run dummy simulation
qsub -I -x -l nodes=8:ppn=8 -l walltime=2:00:00 -S /bin/bash -j oe -N cdse_datagen ${PWD}/run/datagen.sh
