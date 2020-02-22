#!/bin/bash -l

# Kill ldmsd aggregator on headnode.
kill $(ps aux | grep ldmsd | grep -v grep | awk '{print $2}')
