# `data_generator`

The pipeline consists of the following stages:

  * [`setup`](./setup.sh). Uses Singularity remote builder to generate Singularity container, downloads to run stage.
  * [`run`](./run.sh). Runs the bulk synchronous parallel simulator from Singularity container, outputs data in *results* directory.

  * [`post-run`](./post-run.sh). Collects results of the run step, formats, and places them in a csv file

  * [`validate`](./validate.sh). Generates a histogram of bsp_prototype samples and compiles a LaTeX document with the results. No assertions built in yet.

  * [`teardown`](./teardown.sh). Does nothing


# Running the pipeline

```bash
cd cdse/experiments/popperized
popper run data_generator
```

The pipeline is executed on the following environment(s): `OSX, linux`.

# Dependencies

  * /bin/bash
  * Singularity 3+
  * Remote Singularity build requires that a sylabs.io authentication token is used. You can generate a a sylabs token by creating an account and making a token here: https://cloud.sylabs.io/auth
