#!/usr/bin/env bash
# [wf] Delete previous output concatenations
post-run/delete_previous_output_concatenations.sh
# [wf] Move local outputs to experiment output directory
post-run/concatenate_output.sh
