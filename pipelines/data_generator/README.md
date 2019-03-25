# `data_generator`

<!--
NOTE TO AUTHORS: replace all the **TODO** marks with your own content.
-->

**TODO**: insert high-level description of the pipeline.

The pipeline consists of the following stages:

  * [`setup`](./setup.sh). Complains if you're running on the Wheeler headnode

  * [`run`](./run.sh). Runs a simple random sample of a distribution (/dev/urandom)

  * [`post-run`](./post-run.sh). Collects results of the run step in a csv file

  * [`validate`](./validate.sh). Generates a histogram of a single column of the samples stored in the aggregate csv file generated during post-run. This figure is then inserted into a paper that is output to the results/paper/sample_dist.pdf.

  * [`teardown`](./teardown.sh). Shames the user if they ran on the Wheeler head node.

# Obtaining the pipeline

To add this pipeline to your project using the
[`popper` CLI tool](https://github.com/systemslab/popper):

```bash
cd your-repo
popper add wofford/cdse/data_generator
```

# Running the pipeline

To run the pipeline using the
[`popper` CLI tool](https://github.com/systemslab/popper):

```bash
cd cdse
popper run data_generator
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

popper run data_generator
```

# Dependencies


  * Python
  * /bin/bash
  * /dev/urandom
  * glibc
  * dot (to generate png's from figure diagrams)
