import pandas as pd
import numpy as np

df = pd.read_csv('final_batting_avg.csv')
df['NEWPOS'] = np.nan
for i in range(len(df)):
    if df['POS'].iloc[i] < 34:
        df['NEWPOS'].iloc[i]=1
    elif df['POS'].iloc[i] < 67:
        df['NEWPOS'].iloc[i]=2
    elif df['POS'].iloc[i] < 101:
        df['NEWPOS'].iloc[i]=3

df.to_csv('final_batting_avg.csv')
