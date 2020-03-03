#!/usr/bin/env bash


# [wf] Load workflow environment root
source env.sh
# [wf] Validate workflow environment root
source env_validate.sh


# [wf] Prepare remote singularity build
#if [ ! -e run/bsp_prototype-latest.sif ]; then
module load openmpi-3.1.4-gcc-4.8.5-4rs6enq
module load openssl-1.1.1b-gcc-4.8.5-obdqvnl
module load singularity-3.2.1-gcc-4.8.5-ulix7vo

# [wf] Reset container image if necessary
if [ "$RESET" -eq "1" ]; then
  rm -f run/bsp_prototype*sif
  rm -rf ${CONTAINER_IMAGE_DIR}/bsp_prototype/
fi

# [wf] Pull container if sif file not downloaded
if [ -z $(ls run/bsp_prototype_carc-wheeler.sif ) ]; then 
  pushd run
  singularity pull docker://qwofford/bsp_prototype:carc-wheeler
  popd
fi
# [wf] Build container sandbox if not already done
if [ -z $(ls ${CONTAINER_IMAGE_DIR} | grep -E '^bsp_prototype$') ]; then
  singularity build --sandbox ${CONTAINER_IMAGE_DIR}/bsp_prototype run/bsp_prototype_carc-wheeler.sif
fi

# [wf] Communicate host+container environment to container image
cp env.sh ${CONTAINER_IMAGE_DIR}/bsp_prototype/home/docker/env.sh
