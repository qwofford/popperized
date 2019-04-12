#!/usr/bin/env bash
# [wf] Prepare remote singularity build
if [ ! -e run/bsp_prototype.sif ]; then
  singularity build --remote run/bsp_prototype.sif setup/bsp_prototype.def
fi
