import pandas as pd
from pandasql import sqldf
import sys

workflow_dir=sys.argv[1]

def construct_dataframe(file):
    iterdata = pd.read_json(file, orient='records')
    iterdata = iterdata.sort_values(['uniq_id', 'iteration', 'rank']).reset_index(drop=True)

    return iterdata

def adjust_timedelta(df):
    # Get rank start times in terms of time since epoch
    df['barrier_end_since_epoch'] = df['barrier_end']/1e6+df['rank_start']
    df['barrier_start_since_epoch'] = df['barrier_start']/1e6+df['rank_start']
    return(df)

def merge_ldms(df, sampler, matching_threshold):
    ldms_df = pd.read_csv('{}/results/ldms_output/{}'.format(workflow_dir,sampler))
    ldms_df = ldms_df.rename(columns={'#Time':'time'})
    df=df
    sqlstr = """
    select *
    from df
        join ldms_df
            on df.hostname = ldms_df.ProducerName
            and ldms_df.time between df.barrier_start_since_epoch-{0} and df.barrier_end_since_epoch+{0}
               """.format(matching_threshold)
    merged_df = sqldf(sqlstr,locals())
    return(merged_df)

def iter_ldms(df, samplers=['meminfo','shm_sampler','vmstat','procstat','procinterrupts'],
              matching_threshold=1):
    merged_df = merge_ldms(df,samplers[0],matching_threshold)
    for sampler in samplers[1:]:
        print("{} columns so far\nMerging {}...".format(len(merged_df.columns),sampler))
        merged_df = merge_ldms(merged_df,sampler,matching_threshold)
    print("Final column count: {}".format(len(merged_df.columns)))
    return(merged_df)

# Read merged JSON file
iterdata = construct_dataframe("{}/results/bsp_sim_output/concat.json".format(workflow_dir))
# Adust timedeltas by rank start time
df = adjust_timedelta(iterdata)
# Pair all LDMS data and report progress because this can take a while
df = iter_ldms(iterdata)
# Save the file somewhere
df.to_pickle('{}/results/bsp.df'.format(workflow_dir))
