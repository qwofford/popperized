#!/usr/bin/env bash
# [wf] Run local build indent simulation
for i in `seq 1 1`; do
  uniq_id=$(uuidgen);
  perf stat singularity run run/local_build.sif 1> results/job_output/lammps_local_${uniq_id}.dump 2> results/job_output/local_perf_${uniq_id}.out
done;
# [wf] Run remote build indent simulation
for i in `seq 1 1`; do
  uniq_id=$(uuidgen);
  perf stat singularity run run/remote_build.sif 1> results/job_output/lammps_remote_${uniq_id}.dump 2> results/job_output/remote_perf_${uniq_id}.out
done;

