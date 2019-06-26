# `lammps-barebones-singularity`


This experiment builds a singularity image from library files locally and remotely. It then runs the "indent" lammps simulation code, compares the results, and makes an assertion about whether the results differ in a compiled LaTeX document.

The pipeline consists of the following stages:

  * [`setup`](./setup.sh). Builds singularity containers: locally and remotely

  * [`run`](./run.sh). Runs lammps indent simulation on both containers

  * [`post-run`](./post-run.sh). Inserts results into paper with conditional conclusion based on results

  * [`validate`](./validate.sh). Generates the LaTeX paper

  * [`teardown`](./teardown.sh). Currently does nothing.

# Obtaining the pipeline

To add this pipeline, clone the popperized repository, or clone the cdse repository recursively.

# Running the pipeline

```bash
cd cdse/experiments/popperized
popper run lammps-barebones-singularity
```

The pipeline is executed on the following environment(s): `OSX, linux`. Beware! This experiment requires root! If you don't want to use root, take a look at the line in the setup stage which requires SUDO access, and remove it.


# Dependencies


  * /bin/bash
  * Singularity v3.0.2 or greater
  * Edit sudoers file so running user has NOPASSWD option. For example: ```qwofford	ALL=(ALL:ALL) NOPASSWD:ALL```
  * perf-tools is required to collect hardware counter statistics per process. A paranoia level of 2 is sufficient to do these tests
  * Remote Singularity build requires that a sylabs.io authentication token is used. You can generate a a sylabs token by creating an account and making a token here: [https://cloud.sylabs.io/auth](https://cloud.sylabs.io/auth)
