#!/usr/bin/env bash
# [wf] Run dummy simulation
qsub -I -x -q debug -l nodes=1:ppn=8 -l walltime=0:10:00 -S /bin/bash -j oe -N cdse_datagen ${PWD}/run/datagen.sh
