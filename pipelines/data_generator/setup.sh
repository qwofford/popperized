#!/usr/bin/env bash


# [wf] Load workflow environment root
source env.sh
# [wf] Validate workflow environment root
source env_validate.sh


## [wf] Prepare remote singularity build
##if [ ! -e run/bsp_prototype-latest.sif ]; then
#module load openmpi-3.1.4-gcc-4.8.5-4rs6enq
#module load openssl-1.1.1b-gcc-4.8.5-obdqvnl
#module load singularity-3.2.1-gcc-4.8.5-ulix7vo
#rm -f run/bsp_prototype_carc-wheeler.sif
#rm -rf /wheeler/scratch/qwofford/bsp_prototype
#pushd run
#singularity pull docker://qwofford/bsp_prototype:carc-wheeler
# Unpack the sif file so we can get 700 permissions on /opt/ldms_wheeler
#/ldmsauth.conf inside the container (req. by ldms)
#$SINGULARITY_BIN/singularity build --sandbox /wheeler/scratch/${USER}/bsp_prototype run/bsp_prototype_carc-wheeler.sif
#popd
##fi
