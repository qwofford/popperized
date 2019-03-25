import pandas as pd
import matplotlib.pyplot as plt
# This line is required to allow savefig in headless
# display mode
plt.switch_backend('agg')

try:
    df = pd.read_csv('results/result.csv')
except ValueError:
    print("I didn't find the file you're looking for. ",sep='')
    print("Did ./run.sh work ok?");

ax = (df['barrier_start']-df['sleep_start']).plot(kind='hist',bins=15)
fig = ax.get_figure()
fig.savefig('validate/all_sample_hist.png')
