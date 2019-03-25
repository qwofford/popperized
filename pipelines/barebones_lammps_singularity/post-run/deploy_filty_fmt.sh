#!/bin/bash
for i in $(ls results/job_output/*perf*.out); do post-run/filthy_fmt.sh $i > $(echo $(echo $i | sed 's/\./_/g').csv);done;
