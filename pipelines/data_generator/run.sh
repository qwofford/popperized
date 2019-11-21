#!/usr/bin/env bash
# [wf] Run dummy simulation
qsub -q debug -I -x -l nodes=4:ppn=8 -l walltime=0:10:00 -S /bin/bash -j oe -N cdse_datagen ${PWD}/run/datagen.sh
