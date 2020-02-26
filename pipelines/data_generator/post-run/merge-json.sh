#!/bin/bash
cat results/bsp_sim_output/*bsp_simulator*json > results/bsp_sim_output/concat.json; 
tr -d '\n' < results/bsp_sim_output/concat.json > tmp; 
cat tmp | sed 's/\]\[/,/g' > results/bsp_sim_output/concat.json; 
rm tmp;
