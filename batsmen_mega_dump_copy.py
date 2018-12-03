import pandas as pd


df=pd.DataFrame()
count=0
for i in range(1,60):
    try:
        
        count+=1
        df1=pd.read_csv('C:/Users/user/AppData/Local/Programs/Python/Python36/Fantasy IPL/Match_data/2018/Batsmen/Match_{}_batsmen_stats.csv'.format(i), encoding='latin-1')
        print(count)
        
        print(df1)
        df=df.append(df1,ignore_index=True)
##        df=pd.concat([df, df1])
        
    except FileNotFoundError:
        continue

##print(df)


index1=0
for i in df['R']:
 
    if str(i)=="R":
        print('entered here')
        df.drop([index1],axis=0,inplace=True)


    index1+=1

##print(df.head())
df.to_csv('batsmen_mega_dump_2018.csv')

