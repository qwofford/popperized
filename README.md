# Popper experiment pipelines at first glance.

At the coarsest granularity, our experiment should utilize a specific infrastructure to produce results which are output in a way that inspires confidence in the related publication's conclusion. Popper is a tool used to encapsulate, formalize and automate experiment workflows from infrastructure definition, to experiment execution, to research publication. Popper is a tool produced by the Center for Research in Open Source Software (CROSS) at the University of California - Santa Barbara. Popper aims to create *easily* reproducible experiment pipelines (workflows) by enforcing some structure. Structure is generally specified in BASH scripts and managed using a the popper command line tool (```pip install popper==1.1.2```). The popper command line tool interacts with a dedicated git repository which tracks changes to experiment pipelines over time. This is the reason why this "popperized" repository is a sub-module of the **@UNM-CARC/cdse** repo rather than a subdirectory in the cdse parent repo.

Each popper repository can contain arbitrarily many experiment pipelines. Each experiment pipeline contains a set of **stages**, which are defined in the *popperized/.popper.yml* file. These **stages** are easily modified, but we find them useful in their default state. We add some additional conventions which make the organization as encapsulated and simple as possible.


## Popper stages for CDSE
Stages are defined in the YAML file mentioned above. Each stage executes when running a particular popper experiment pipeline, for example ```popper run data_generator```, will run BASH scripts located in the *./pipelines/data_generator/* directory titled **setup.sh** -> **run.sh** -> **post-run.sh** -> **validation.sh** -> **teardown.sh**. If any of these scripts do not exist, the *data_generator* pipeline will fail. If any of these bash scripts exit with a non-zero exit status, the pipeline will fail. All error and output logs are stored in the *popper* subdirectory of the *./pipelines/data_generator/* directory. All logs will be deleted at the beginning of each attempt to run the popper pipeline. Each popper pipeline has its own *popper* logging directory.

We extend the popper convention by politely requiring that each stage script point to a subscript within a matching subdirectory. We use as little code as possible in the top level stage script itself. We do this for organization and clarity. The top level staging scripts are useful for pipeline decision making, and they are particularly interesting because popper uses a special comment syntax to generate a 'dot' graph of the experiment workflow. The syntax for a properly commented stage script is:
````
>>> cat setup.sh
# [wf] Check if 1 is equal to 2
if (1==2) {
     # [wf] Call the Pope
    ./setup/proclaim_miracle.sh
} else{
    # [wf] Don't call the Pope
    ./setup/life_as_usual.sh
}
````

Adhering to this comment convention *at the top level stage script* is what generates graphs like the one shown below:

<img src='https://github.com/UNM-CARC/popperized/blob/master/pipelines/data_generator/wf.png?raw=true'></img>
## Popper stage breakdown, CDSE style
### setup.sh
We use setup.sh to encapsulate all actions related to deploying an environment, container, or virtual machine which will enable the execution of an experiment on a particular infrastructure. This stage includes requesting infrastructure (Chameleon/XSEDE), pulling Docker/Singularity/Vagrant definition files, and building/importing these environments on the target system. The setup stage is complete when an environment is sufficiently encapsulated and ready to run an experiment. *Reminder: By convention, CDSE puts all setup helper scripts in the ./setup/ subdirectory*

### run.sh
We use run.sh to run the experiment, and dump ***raw*** output into a subdirectory called "*results*", it's up to the operator whether to create subdirectories in the results folder. In general, all output should be saved in a raw format. We don't want to leak information that may be important later. *Reminder: By convention, CDSE puts all run helper scripts in the ./run/ subdirectory*

### post-run.sh
Post run is a place to call parsing and formatting scripts (```cat ... | awk ...| sed ...```). The purpose of the post-run stage is to take raw outputs and prepare them for the analysis tool of your choice. Our favorite simple formats are CSV and JSON. The post-run stage is complete when you can comfortably pull data from the analysis tool of your choice. *Reminder: By convention, CDSE puts all post-run helper scripts in the ./post-run/ subdirectory*

### ./pipeline/\<experiment pipeline\>/analysis
While this directory is not a stage of the pipeline, it's a useful place to store intermediate analysis and data products. So far, we have used Jupyter notebooks to perform exploratory analysis on the formatted data from the post-run stage. Once exploratory analysis is complete, plots are drafted in Jupyter notebooks. These plotting scripts are formalized into traditional .py scripts, and placed in the *validation* stage directory.

### validate.sh
Ultimately, the validate stage either produces a compiled LaTeX document or errors when the claims made in that paper are not validated. Initially, the validate stage tests any and all assertions made in the paper. If all assertions hold, plots are generated using python scripts built during the exploratory analysis phase. Next, the LaTex source code is compiled, and references the figures generated by the preceding Python scripts. A complete, publish-ready, PDF document is generated.

### teardown.sh
Some infrastructure workflows benefit from cleanup scripts. Virtual machines need to be shut down, infrastructure requests need to to be closed when the task is done. Teardown is a place to un-do changes made during the setup stage, if needed.

### Continuous integration
While this concept is not a defined stage or directory in any of our pipelines, it is a fundamental tenet of the popper convention, and a goal for the CDSE project. Once an experiment pipeline is working, we can use deploy it using continuous integration services. This has several advantages:
     1. Any time we "push" a change to the experiment codebase, we learn immediately if our change breaks the result.
     2. Any time someone wants to build on our work, they can fork the project, mirror our pipeline and move in related research directions.

# Usage

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
