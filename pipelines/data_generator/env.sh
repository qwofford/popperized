##########################
#  Experiment params     #
##########################
export PROBLEM_SIZE=3 # nodes (1 rank per node)

# distribution (flat ,gaussian, pareto, 
#               exponential, constant, dgemm)
export d=dgemm

# workload (dgemm, sleep)
# Note: dgemm ignores "d" param
export w=dgemm
              

# Description of a,b parameters per "d" param:
# dgemm:
#       a: a*a matrix multiplies
#       b: num matmult before barrier
# gaussian:
#       a: interarrival mean
#       b: interarrival stddev
# exponential:
#       a: interarrival mean
#       b: unused
# flat:
#       a: start number
#       b: end number
# constant:
#       a: interarrival constant duration
#       b: unused
# pareto:
#       a: exponent (ie- shape)
#       b: scale (shift to the right ~ largest value in tail)
export a=128 # A param of distribution/workload
export b=64 # B param of distribution/workload
export ii=1000 # barrier iterations


##########################
#  User environment      #
##########################

export USER_SPECIFIED_WALLTIME='00:10:00'
export WORKFLOW_DIR=/users/qwofford/Projects/popperized/pipelines/data_generator
export OUTPUT_DIR=/wheeler/scratch/qwofford
# Grab communication port for LDMS that is hopefully unique to you
export LDMS_PORT=$(( 10000+$(id -u)%137 ))
export MONITORING_OUTPUT_DIR=${OUTPUT_DIR}/ldms_output
export APPLICATION_OUTPUT_DIR=${OUTPUT_DIR}/bsp_prototype_output
export CONTAINER_IMAGE_DIR=${OUTPUT_DIR}
export LOG_OUTPUT_DIR=${OUTPUT_DIR}/workflow_logs
export RESET=0
