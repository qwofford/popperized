#!/usr/bin/env bash
# [wf] Run dummy simulation
qsub -I -x -l nodes=16:ppn=8 -l walltime=4:00:00 -S /bin/bash -j oe -N cdse_datagen ${PWD}/run/datagen.sh
