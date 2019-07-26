#!/usr/bin/env bash
# [wf] Run dummy simulation
qsub -I -x -l nodes=2:ppn=8 -l walltime=0:10:00 -S /bin/bash -j oe -N cdse_datagen -q debug ${PWD}/datagen.sh
