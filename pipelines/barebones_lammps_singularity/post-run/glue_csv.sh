#!/bin/bash 
head -1 $(ls results/job_output/*csv | head -1) > results/perf.csh; cat results/perf.csh > results/aggregated_perf_stats.csv; for i in $(ls results/job_output/*csv); do tail -n1 $i >> results/aggregated_perf_stats.csv;done;
