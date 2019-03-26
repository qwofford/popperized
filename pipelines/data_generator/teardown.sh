#!/usr/bin/env bash
# [wf] Complain about running on the headnode one more time
teardown/complain_headnode.sh

# [wf] Check if ran on headnode
if [[ $(hostname) == "wheeler-sn" ]]; then 
  # [wf] Complain about running on the headnode one more time
else 
  # [wf] Congratulate user for not running on headnode
fi;
