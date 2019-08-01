#!/usr/bin/env bash
# [wf] Prepare remote singularity build
#if [ ! -e bsp_prototype-latest.sif ]; then
rm -f bsp_prototype_latest.sif
singularity pull docker://unmcarc/bsp_prototype:latest
#fi
