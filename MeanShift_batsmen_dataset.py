import numpy as np
from sklearn.cluster import MeanShift, KMeans
from sklearn import preprocessing, model_selection
import pandas as pd
import matplotlib.pyplot as plt

df1 = pd.read_csv('C:/Users/user/Desktop/classifier_set_batsmen_modified.csv')
#df2 = pd.read_csv('final_bowling_avg.csv')

original_df1 = pd.DataFrame.copy(df1)
#original_df2 = pd.DataFrame.copy(df2)

df1.drop(['sumpts_r','sumpts_4','sumpts_6','sumpts_50','sumpts_100','sumpts_sr'],1, inplace = True)
##df1.drop(['R','M','B','4s','6s','SR'],1, inplace = True)
#df2.drop(['PLAYER','POS'],1, inplace = True)
df1.fillna(0,inplace =True)
#df2.fillna(0,inplace =True)


X = np.array(df1.drop(['total'],1).astype(float))
X = preprocessing.scale(X)

y = np.array(df1['total'])

clf = MeanShift()
clf.fit(X)

labels = clf.labels_
cluster_centers = clf.cluster_centers_

original_df1['cluster_group'] = np.nan
for i in range(len(X)):
    original_df1['cluster_group'].iloc[i]=labels[i]


original_df1.to_csv('MeanShiftedBatsmen1.csv')

print(len(np.unique(labels)))

##n_clusters_=len(np.unique(labels))
##
##player_choice = {}
##for i in range(n_clusters_):
##    temp_df = original_df[(original_df['cluster_group']==float(i))]
    
   

##print(correct/len(X))
