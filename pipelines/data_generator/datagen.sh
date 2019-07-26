#!/bin/bash

##        Introductory Example for running VASP
## Copyright (c) 2013 The Center for Advanced Research Computing
##                    at The University of New Mexico

# PBS Directives: These are actually just flags for qsub
# that we can either pass to qsub on the command line: 
# bash$ qsub -N Name -lwalltime=2:00:00,nodes=2:ppn=8 fenics.pbs
# 
# or by placing them here, prefaced by "#PBS". The man page for
# qsub has more information, including many additional flags. 
# If a flag is provided both on command line and in pbs file, 
# the command line value is taken. This makes it easy to script
# submission, or quickly override a variable. 

# A very useful flag is -I, which will make the job interactive. 
# This is a very useful way to debug a script, since the flags
# are read from pbs script, but pbs script is not run. To do 
# this, run "qsub -I fenics.pbs". Then, when the jobs starts and
# the prompt is returned, cd to the directory and run the script:
#
# bash$ cd $PBS_O_WORKDIR
# bash$ bash ./fenics.pbs
#
# Interactive pbs sessions are useful for debugging, but are not 
# the preferred way to run production jobs. Once problem is 
# identified, do submit as normal. 

# Processors per node (ppn), today is synonymous with cores:
# xena has 16 and wheeler has 8
#PBS -l nodes=1:ppn=4
#PBS -l walltime=0:10:00
#PBS -S /bin/bash
#PBS -j oe
#PBS -N cdse-datagen
#PBS -q debug

# Load the environment modules system
## TODO add to .profile along with umask

module load openmpi-3.0.0-gcc-4.8.5-i4kxtih
module load singularity-3.2.1-gcc-4.8.5-ulix7vo

# The variable $PBS_NP is always equal to nodes x ppn as set via -l flag
# and the following information will be found in the .o file 
echo -e "\nLaunching $PBS_NP mpi tasks across $PBS_NUM_NODES node(s)." 
echo -e "The nodes are: $(cat $PBS_NODEFILE | uniq | tr '\n' ' ')\n\n" 

# Change to the directory that this job was submitted from
# The variable is set to whatever directory you were in when qsub was called
cd $PBS_O_WORKDIR

echo -e "Starting job $(echo $PBS_JOBID | cut -d"." -f1) on $(date)\n"

TMPFILE=`mktemp -d /wheeler/scratch/${USER}/appgenresults.XXXXXX`
# I have redirected output to out.log, which you will be able to check while running. 
# Otherwise, STDOUT is stored in RAM both consuming RAM and hiding output until the end
# when the .o file is produced. Feel free to change the name of output to anything you like. 
mpirun -n $PBS_NP -machinefile $PBS_NODEFILE $SINGULARITY_BIN/singularity run -B ${TMPFILE}:/results bsp_prototype_latest.sif 50000 100 gaussian 1000

echo Output data in ${TMPFILE}.
echo -e "Finished job $(echo $PBS_JOBID | cut -d"." -f1) on $(date)" 
