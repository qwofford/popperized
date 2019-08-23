#!/usr/bin/env bash
# [wf] Prepare remote singularity build
#if [ ! -e run/bsp_prototype-latest.sif ]; then
module load openmpi-3.0.0-gcc-4.8.5-i4kxtih
module load openssl-1.1.1b-gcc-4.8.5-obdqvnl
module load singularity-3.2.1-gcc-4.8.5-ulix7vo
rm -f run/bsp_prototype_latest.sif
pushd run
singularity pull docker://unmcarc/bsp_prototype:latest
popd
#fi
