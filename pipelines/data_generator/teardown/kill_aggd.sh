#!/bin/bash -l
kill $(ps aux | grep ldmsd | grep -v grep | awk '{print $2}')
