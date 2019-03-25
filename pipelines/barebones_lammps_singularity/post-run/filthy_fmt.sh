#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Syntax: ./filthy_fmt.sh perf_stat.out"
    exit 1;
fi

# Grab top-level stats from perf assuming output is reliably formatted
output_str=$(echo "$(echo "$(tail +4 $1 | head -7 |sed 's/,//g'| sed 's/CPUs\ utilized/CPUs_utilized/g' | sed 's/insn\ per\ cycle/insn_per_cycle/g' | sed 's/u (msec)/u_(msec)/g'| awk '{print $1","$2","$4","$5","$6}')" | sed 's/\ //g'; echo "$(tail -2 $1 | head -1 | sed 's/seconds time elapsed/seconds_time_elapsed/g' | awk '{print $1","$2}')")" | sed 's/ //g' | tr -d '\n');

# Harvest build type from filename
output_str=$(echo $1 | awk -F'[_/]' '{print $4}'),build_type,$output_str;

# rotate for csv formatting
echo "$(IFS=',';cnt=0; for i in $(echo "$output_str"); do if [[ $(( ${cnt}%2 )) == "1" ]]; then printf $i,;fi;cnt=$(($cnt+1)); done; echo; cnt=0; for i in $(echo "$output_str"); do if [[ $(( ${cnt}%2 )) == "0" ]]; then printf $i,; fi; cnt=$(($cnt+1)); done; echo;)" | sed 's/,$//';


