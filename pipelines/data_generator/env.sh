export PROBLEM_SIZE=3 # nodes (8 ranks per node)
export USER_SPECIFIED_WALLTIME='00:10:00'
export WORKFLOW_DIR=/home/qwofford/Projects/popperized/pipelines/data_generator
export OUTPUT_DIR=/wheeler/scratch/qwofford
export MONITORING_OUTPUT_DIR=${OUTPUT_DIR}/ldms_output
export APPLICATION_OUTPUT_DIR=${OUTPUT_DIR}/bsp_prototype_output
export CONTAINER_IMAGE_DIR=${OUTPUT_DIR}
export LOG_OUTPUT_DIR=${OUTPUT_DIR}/workflow_logs
