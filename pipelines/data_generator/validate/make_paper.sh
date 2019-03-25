#!/bin/bash

# Enter paper directory
pushd validate/paper

# Remove old paper files
rm -f sample_dist.aux sample_dist.log sample_dist.synctex.gz texput.log sample_dist.pdf

# Generate the paper itself
pdflatex -halt-on-error sample_dist.tex

# Exit directory
popd
