# `data_generator`

The pipeline consists of the following stages:

  * [`setup`](./setup.sh). Uses Singularity remote builder to generate Singularity container, downloads to run stage.
  * [`run`](./run.sh). Runs the bulk synchronous parallel simulator from Singularity container, outputs data in *results* directory.

  * [`post-run`](./post-run.sh). Collects results of the run step, formats, and places them in a csv file

  * [`validate`](./validate.sh). Generates a histogram of bsp_prototype samples and compiles a LaTeX document with the results. No assertions built in yet.

  * [`teardown`](./teardown.sh). Does nothing


# Preparing your host environment
In order to run the pipeline, you need to edit the `env.sh` file in the project root with relevant paths. When making choices, note that the default `run.sh` script submits to the Wheeler queue. If you don't change that the choices you make in `env.sh` must be consistent with debug queue restrictions.

# Running the pipeline

```bash
cd cdse/experiments/popperized
popper run data_generator
```

# Validating the pipeline
The first thing to do is check the outputs in `results/ldms_ouptut` and `results/bsp_sim_output`. The BSP simulator outputs JSON data. JSON output will be present for each node that participated in the run. A post-run script merges these results into a file called `results/bsp_sim_output/concat.json`. Threads will be designated by rank in the JSON data, if used. LDMS data is written in CSV format.

A post-run python script synchronizes LDMS data with BSP simulator outputs, and writes the merged data as a Pandas dataframe at `results/bsp.df`. This is the research artifact for this pipeline. Further analysis can happen offline, with tools of your choice. If merge critera needs to be altered, or if additional LDMS data is collected, you should edit `post-run/merge_df.py`.


# Dependencies

  * /bin/bash
  * Singularity 3+
  * Popper version 1.1.2
  * Remote Singularity build requires that a sylabs.io authentication token is used. You can generate a a sylabs token by creating an account and making a token here: https://cloud.sylabs.io/auth
