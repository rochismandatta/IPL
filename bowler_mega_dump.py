import pandas as pd


df=pd.DataFrame()
count=1
for i in range(1,39):
    try:
        df1=pd.read_csv('C:/Users/user/AppData/Local/Programs/Python/Python36/Fantasy IPL/Match_data/2018/Match_{}_bowler_stats.csv'.format(i))
##        df = df1[['Bowling','O','M','R','W','Econ','0s','4s','6s','WD','NB']]
        df1.drop(columns=['Unnamed: 1', 'Unnamed: 12'],inplace=True)
        print(count)
        count+=1
        df=df.append(df1,ignore_index=True)
    except:
        continue

##df1=pd.read_csv('C:/Users/user/Desktop/Match_data - Copy/2017/Match_29_bowler_stats.csv')
print(df.head())
print(df.tail())
##print(df.tail())
df.to_csv('bowler_dump_2018.csv')
##df2=df1[['Bowling','O','M','R','W','Econ','0s','4s','6s','WD','NB']]
##print(df2)
