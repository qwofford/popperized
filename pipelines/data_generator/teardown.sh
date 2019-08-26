#!/usr/bin/env bash
TMPDIR=$(cat /wheeler/scratch/qwofford/TMPDIR)
rm /wheeler/scratch/qwofford/TMPDIR
rmdir $TMPDIR
