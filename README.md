# Simulation output specification v0.0.2

At the coarsest granularity, our experiment should produce results which are output in some way. This version of the cdse repo includes a make file which runs an experiment on a single node/laptop. It generates random numbers and demonstrates an output structure which may be well-suited to runs on Wheeler.


## Format notes
This version dumps all simulation outputs into a container directory with useful identifying information contained in the filename (see: ```./results```). Inside each file in ```./results/``` is csv output, but without a header. A header.csv file can be found in the directory above this folder, and any files inside results must be compliant with the currently checked in header file. That is to say, always ensure header.csv has exactly as many commas per line as the result files.

### *See below for content Popper added to the README*

# cdse

This repository contains [Popper](https://github.com/systemslab/popper)
pipelines. To show a list of available pipelines using the
[`popper` CLI tool](https://github.com/systemslab/popper):

```bash
cd cdse
popper ls
```

to execute one of the pipelines:

```bash
popper run <pipeline-name>
```

where `<pipeline-name>` is one of the pipelines in the repository.
For more on what other information from this repository is available,
you can run:

```bash
popper --help
```
