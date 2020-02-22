#!/bin/bash

########################################
#
# Verify workflow environment in logs
#
########################################

source env.sh
echo "Output root is: ${OUTPUT_DIR}"
echo "Monitoring output directory is: ${MONITORING_OUTPUT_DIR}"
echo "Application output directory is: ${APPLICATION_OUTPUT_DIR}"
echo "Container is expected in: ${CONTAINER_IMAGE_DIR}"

########################################
#
# Communicate workflow environment to the container
#
########################################

cp env.sh ${CONTAINER_IMAGE_DIR}/bsp_prototype/home/docker/



# Load the environment modules system
module load openmpi-3.1.4-gcc-4.8.5-4rs6enq
module load openssl-1.1.1b-gcc-4.8.5-obdqvnl
module load singularity-3.2.1-gcc-4.8.5-ulix7vo

# The variable $PBS_NP is always equal to nodes x ppn as set via -l flag
# and the following information will be found in the .o file 
echo -e "\nLaunching $PBS_NP mpi tasks across $PBS_NUM_NODES node(s)." 
echo -e "The nodes are: $(cat $PBS_NODEFILE | uniq | tr '\n' ' ')\n\n" 

# Change to the directory that this job was submitted from
# The variable is set to whatever directory you were in when qsub was called
cd $PBS_O_WORKDIR

echo -e "Starting job $(echo $PBS_JOBID | cut -d"." -f1) on $(date)\n"

########################################
#
# Layer 1 Container launch
#
########################################


$SINGULARITY_BIN/singularity run -B ${TMPDIR}:/results -B /tmp -B $PBS_NODEFILE -B /etc/hostname -B ${OUTPUT_DIR} ${CONTAINER_IMAGE_DIR}/bsp_prototype -v -a 100000 -b 10000 -d gaussian -i 1000 -t 1000
