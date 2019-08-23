#!/usr/bin/env bash
TMPDIR=$(cat /wheeler/qwofford/TMPDIR)
rm /wheeler/scratch/qwofford/TMPDIR
rmdir /wheeler/scratch/qwofford/$TMPDIR
