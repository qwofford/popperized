#!/usr/bin/env bash
# [wf] Prepare local singularity build
# Note: teardown stage cleans up after these images, so if they exist
# the pipeline failed previously. Just use them to same time.
if [ ! -e run/local_build.sif ]; then
  sudo singularity build run/local_build.sif setup/lammps-centos7.def
  # [wf] Harvest input deck for indentation simulation
  singularity exec run/local_build.sif cat /opt/lammps/examples/indent/in.indent > ./results/local_input_deck.input
fi
# [wf] Prepare remote singularity build
# Note: teardown stage cleans up after these images, so if they exist
# the pipeline failed previously. Just use them to same time.
if [ ! -e run/remote_build.sif ]; then
  singularity build --remote run/remote_build.sif setup/lammps-centos7.def
  # [wf] Harvest input deck for indentation simulation
  singularity exec run/remote_build.sif cat /opt/lammps/examples/indent/in.indent > ./results/remote_input_deck.input
fi

