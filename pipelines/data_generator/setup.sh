#!/usr/bin/env bash
# [wf] Prepare remote singularity build
if [ ! -e run/bsp_simulator.sif ]; then
  singularity build --remote run/bsp_simulator.sif setup/bsp_simulator.def
fi
