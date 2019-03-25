#!/bin/bash

# Enter paper directory
pushd validate/paper

# Remove old paper files
rm -f lammps-barebones-singularity*.aux lammps-barebones-singularity*.log lammps-barebones-singularity*.synctex.gz texput*.log lammps-barebones-singularity*.pdf

# Generate the paper itself
# Halt on error prevents pipeline hanging forever
pdflatex -halt-on-error lammps-barebones-singularity_$(date +%D |sed 's/\//_/g').tex

# Exit directory
popd
