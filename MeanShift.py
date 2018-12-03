import numpy as np
from sklearn.cluster import MeanShift, KMeans
from sklearn import preprocessing, model_selection
import pandas as pd
import matplotlib.pyplot as plt

df1 = pd.read_csv('final_batting_avg.csv')
df2 = pd.read_csv('final_bowling_avg.csv')

original_df1 = pd.DataFrame.copy(df1)
original_df2 = pd.DataFrame.copy(df2)

df1.drop(['PLAYER','POS'],1, inplace = True)
df2.drop(['PLAYER','POS'],1, inplace = True)
df1.fillna(0,inplace =True)
df2.fillna(0,inplace =True)


X = np.array(df1.drop(['NEWPOS'],1).astype(float))
X = preprocessing.scale(X)

y = np.array(df1['NEWPOS'])

clf = KMeans(n_clusters = 2)
clf.fit(X)

correct = 0
for i in range(len(X)):
    predict_me = np.array(X[i].astype(float))
    predict_me = predict_me.reshape(-1, len(predict_me))
    prediction = clf.predict(predict_me)
    if prediction[0] == y[i]:
        correct+=1

print(correct/len(X))
