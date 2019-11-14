#!/usr/bin/env bash
# [wf] Start LDMS aggregator
export MODULEFILES=/opt/spack/share/spack/modules/linux-centos7-x86_64:/opt/local/modules/all:/opt/ohpc/pub/modulefiles:/wheeler/scratch/qwofford/modulefiles
module load ovis/4.2.3
source /wheeler/scratch/qwofford/opt/ovis/4.2.3/configs/start_agg_csv.sh

# [wf] Run dummy simulation
qsub -I -x -q debug -l nodes=1:ppn=8 -l walltime=0:10:00 -S /bin/bash -j oe -N cdse_datagen ${PWD}/run/datagen.sh
