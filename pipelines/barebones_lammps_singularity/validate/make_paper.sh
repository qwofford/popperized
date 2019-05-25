#!/bin/bash

# Enter paper directory
pushd validate/paper

# Remove old paper files
rm -f lammps-barebones-singularity*.aux lammps-barebones-singularity*.log lammps-barebones-singularity*.synctex.gz texput*.log lammps-barebones-singularity*.pdf


out1=$(cat ../../results/job_output/lammps_local*dump)
out2=$(cat ../../results/job_output/lammps_remote*dump)
out3=$(cat ../../results/job_output/local_perf*)
out4=$(cat ../../results/job_output/remote_perf*)

# Insert results
awk -v out1="$out1" -v out2="$out2" -v out3="$out3" -v out4="$out4" '{
    sub(/insertlocalresult/, out1);
    sub(/insertremoteresult/, out2);
    sub(/insertlocalperfresult/, out3);
    sub(/insertremoteperfresult/, out4);
    print;
}' lammps-barebones-singularity.tex > lammps-barebones-singularity_$(date +%D |sed 's/\//_/g').tex


#cat lammps-barebones-singularity.tex | sed "sXinsertlocalresultX`cat ../../results/job_output/lammps_local*dump`X" > /tmp/tmp;
#cat ../../results/job_output/lammps_remote*dump
#mydate=$(date +%D |sed 's/\//_/g')

#cat /tmp/tmp >lammps-barebones-singularity_$mydate.tex
# Generate the paper itself
# Halt on error prevents pipeline hanging forever
pdflatex -halt-on-error lammps-barebones-singularity_$(date +%D |sed 's/\//_/g').tex

# Exit directory
popd
