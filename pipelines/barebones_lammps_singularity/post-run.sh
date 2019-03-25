#!/usr/bin/env bash
# [wf] Dump results into paper text.
#local=$(cat results/job_output/lammps_local.dump)
#remote=$(cat results/job_output/lammps_remote.dump)


# [wf] Format perf stat outputinto csv, aggregate the csv
post-run/deploy_filty_fmt.sh         
post-run/glue_csv.sh 
# Output goes to: results/aggregated_perf_stats.csv
# Do not attempt to understand these scripts.


#run_date=$(date +%D | sed 's/\//_/g')
#cat validate/paper/lammps-barebones-singularity.tex > validate/paper/lammps-barebones-singularity_${run_date}.tex
#awk -v local="${local}" -v remote="${remote}" '{sub(/<insert local result>/,local); sub(/<insert remote result>/,remote); print;}' validate/paper/lammps-barebones-singularity_${run_date}.tex >> validate/paper/tmp;
#mv validate/paper/tmp  validate/paper/lammps-barebones-singularity_${run_date}.tex;
## [wf] Test hypothesis, insert conclusion.
#if [[ $(diff results/job_output/lammps_local.dump results/job_output/lammps_remote.dump) = "" ]]; then
#    
#    cat validate/paper/lammps-barebones-singularity_${run_date}.tex | sed "s/<insert conclusion>/Results are the same. Assumption valid./g" >> validate/paper/tmp;
#    mv validate/paper/tmp validate/paper/lammps-barebones-singularity_${run_date}.tex;
#else
#    cat validate/paper/lammps-barebones-singularity_${run_date}.tex | sed "s/<insert conclusion>/Results differ. Assumption is not valid./g" >> validate/paper/tmp;
#    mv validate/paper/tmp validate/paper/lammps-barebones-singularity_${run_date}.tex;
#fi 
