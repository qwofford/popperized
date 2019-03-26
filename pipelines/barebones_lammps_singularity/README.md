# `lammps-barebones-singularity`


This experiment builds a singularity image from library files locally and remotely. It then runs the "indent" lammps simulation code, compares the results, and makes an assertion about whether the results differ in a compiled LaTeX document.

The pipeline consists of the following stages:

  * [`setup`](./setup.sh). Builds singularity containers: locally and remotely

  * [`run`](./run.sh). Runs lammps indent simulation on both containers

  * [`post-run`](./post-run.sh). Inserts results into paper with conditional conclusion based on results

  * [`validate`](./validate.sh). Generates the LaTeX paper

  * [`teardown`](./teardown.sh). Currently does nothing.

# Obtaining the pipeline

To add this pipeline to your project using the
[`popper` CLI tool](https://github.com/systemslab/popper):

```bash
cd your-repo
popper add wofford/cdse/lammps-barebones-singularity
```

# Running the pipeline

To run the pipeline using the
[`popper` CLI tool](https://github.com/systemslab/popper):

```bash
cd cdse
popper run lammps-barebones-singularity
```

The pipeline is executed on the following environment(s): `OSX, linux`. In addition,
the following environment variables are expected:

  * `<ENV_VAR1>`. Env description would go here
  * `<ENV_VAR2>`. Another description.


For example, the following is an execution with all expected
variables:

```bash
export <ENV_VAR1>=value-for-<ENV_VAR_1>
export <ENV_VAR2>=value-for-<ENV_VAR_2>

popper run lammps-barebones-singularity
```

# Dependencies


  * /bin/bash
  * Singularity v3.0.2 or greater
  * Edit sudoers file so running user has NOPASSWD option. For example: ```qwofford	ALL=(ALL:ALL) NOPASSWD:ALL```
  * perf-tools is required to collect hardware counter statistics per process. A paranoia level of 2 is sufficient to do these tests