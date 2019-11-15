#!/bin/bash

# PBS Directives: These are actually just flags for qsub
# that we can either pass to qsub on the command line: 
# bash$ qsub -N Name -lwalltime=2:00:00,nodes=2:ppn=8 fenics.pbs
# 
# or by placing them here, prefaced by "#PBS". The man page for
# qsub has more information, including many additional flags. 
# If a flag is provided both on command line and in pbs file, 
# the command line value is taken. This makes it easy to script
# submission, or quickly override a variable. 

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

TMPDIR=`mktemp -d /wheeler/scratch/${USER}/${PBS_JOBNAME}-${PBS_JOBID}.XXXXXX`
echo $TMPDIR > /wheeler/scratch/${USER}/TMPDIR

# Arguments here just in case to force mpi to use the proper UCX infiniband device.
#mpirun -n $PBS_NP -machinefile $PBS_NODEFILE -mca pml ucx --mca btl ^vader,tcp,openib,uct -x UCX_NET_DEVICES=mlx4_0:1 $SINGULARITY_BIN/singularity run -B ${TMPDIR}:/results run/bsp_prototype_latest.sif 100000 10000 gaussian 1000

# Unpack the sif file so we can get 700 permissions on /opt/ldms_wheeler/ldmsauth.conf inside the container (req. by ldms)
$SINGULARITY_BIN/singularity build --sandbox /wheeler/scratch/${USER}/bsp_prototype run/bsp_prototype_carc-wheeler.sif

#for NP in 8 16 32 64 128 
for NP in 8
do
	mpirun -np ${NP} -machinefile $PBS_NODEFILE -mca pml ucx --mca btl ^vader,tcp,openib,uct -x UCX_NET_DEVICES=mlx4_0:1 $SINGULARITY_BIN/singularity run -B ${TMPDIR}:/results -B /tmp -B $PBS_NODEFILE -B /etc/hostname -B /wheeler/scratch/$(whoami)/ /wheeler/scratch/${USER}/bsp_prototype -a 100000 -b 10000 -d gaussian -i 1000 -t 1000
#	mpirun -np ${NP} -machinefile $PBS_NODEFILE -mca pml ucx --mca btl ^vader,tcp,openib,uct -x UCX_NET_DEVICES=mlx4_0:1 $SINGULARITY_BIN/singularity run -B ${TMPDIR}:/results run/bsp_prototype_latest.sif -a 100000 -d exponential -i 1000
#	mpirun -np ${NP} -machinefile $PBS_NODEFILE -mca pml ucx --mca btl ^vader,tcp,openib,uct -x UCX_NET_DEVICES=mlx4_0:1 $SINGULARITY_BIN/singularity run -B ${TMPDIR}:/results run/bsp_prototype_latest.sif -a 2 -b 50000 -d pareto -i 1000
done

echo "Output data in ${TMPDIR}"
echo -e "Finished job $(echo $PBS_JOBID | cut -d"." -f1) on $(date)" 
