if [ -z "${PROBLEM_SIZE}" ]; then
  echo PROBLEM_SIZE isn\'t set. Revise env.sh 
  exit 1
fi
if [ -z "${USER_SPECIFIED_WALLTIME}" ]; then
  echo USER_SPECIFIED_WALLTIME isn\'t set. Revise env.sh 
  exit 1
fi
if [ -z "${OUTPUT_DIR}" ]; then
  echo OUTPUT_DIR isn\'t set. Revise env.sh 
  exit 1
fi
if [ -z "${MONITORING_OUTPUT_DIR}" ]; then
  echo MONITORING_OUTPUT_DIR isn\'t set. Revise env.sh 
  exit 1
fi
if [ -z "${APPLICATION_OUTPUT_DIR}" ]; then
  echo APPLICATION_OUTPUT_DIR isn\'t set. Revise env.sh 
  exit 1
fi
if [ -z "${CONTAINER_IMAGE_DIR}" ]; then
  echo CONTAINER_IMAGE_DIR isn\'t set. Revise env.sh 
  exit 1
fi
if [ -z "${LOG_OUTPUT_DIR}" ]; then
  echo LOG_OUTPUT_DIR isn\'t set. Revise env.sh 
  exit 1
fi
if [ -z "${WORKFLOW_DIR}" ]; then
  echo WORKFLOW_DIR isn\'t set. Revise env.sh 
  exit 1
fi
if [ -z "${LDMS_PORT}" ]; then
  echo LDMS_PORT isn\'t set. Revise env.sh 
  exit 1
fi

if [[ "${CONTAINER_IMAGE_DIR}" != "/wheeler/scratch/$(whoami)" ]]; then
  echo 'CONTAINER_IMAGE_DIR must be set to /wheeler/scratch/$(whoami) at this time.'
  exit 1
fi

if [ -d ${OUTPUT_DIR} ]; then
  echo mkdir -p ${MONITORING_OUTPUT_DIR}
  mkdir -p ${MONITORING_OUTPUT_DIR}
  echo mkdir -p ${APPLICATION_OUTPUT_DIR}
  mkdir -p ${APPLICATION_OUTPUT_DIR}
  echo mkdir -p ${LOG_OUTPUT_DIR}
  mkdir -p ${LOG_OUTPUT_DIR}
fi

