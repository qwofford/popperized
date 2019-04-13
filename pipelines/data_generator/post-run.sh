#!/usr/bin/env bash
# [wf] Delete previous output concatenations
post-run/delete_previous_output_concatenations.sh
# [wf] Move local outputs to experiment output directory
post-run/mv_tmp_to_job_output.sh
# [wf] Concatenate outputs into one file
post-run/concatenate_output.sh
