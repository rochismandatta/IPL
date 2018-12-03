import numpy as np
from sklearn.cluster import MeanShift, KMeans
from sklearn import preprocessing, model_selection,svm
import pandas as pd
import matplotlib.pyplot as plt

df1 = pd.read_csv('C:/Users/user/Desktop/classifier_set_batsmen.csv')
#df2 = pd.read_csv('final_bowling_avg.csv')

original_df1 = pd.DataFrame.copy(df1)
#original_df2 = pd.DataFrame.copy(df2)

df1.drop(['R','M','B','4s','6s','SR'],1, inplace = True)

df1.fillna(0,inplace =True)

X = np.array(df1.drop(['total'],1).astype(float))
X = preprocessing.scale(X)

y = np.array(df1['total'])

X_train, X_test, y_train, y_test = model_selection.train_test_split(X, y, test_size=0.2)

clf = svm.SVC()
clf.fit(X_train, y_train)

accuracy = clf.score(X_test,y_test)

print(accuracy)
