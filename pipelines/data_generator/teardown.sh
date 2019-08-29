#!/usr/bin/env bash
TMPDIR=$(cat /wheeler/scratch/${USER}/TMPDIR)
if [ -e ${TMPDIR} ]; then
    rm -r ${TMPDIR}
fi
rm /wheeler/scratch/${USER}/TMPDIR
