import pandas as pd
##    if str(i[:index]) == 'R':
##      df1.drop(df.index[index], inplace=True)
##        df.drop(df.index(df['R'].index(i)),inplace=True)
##        df = df1[['Bowling','O','M','R','W','Econ','0s','4s','6s','WD','NB']]
##        df1.drop(columns=['Unnamed: 1', 'Unnamed: 12'],inplace=True)
##df1=pd.read_csv('C:/Users/user/Desktop/Match_data - Copy/2017/Match_1_batsmen_stats.csv')
##df2=pd.read_csv('C:/Users/user/Desktop/Match_data - Copy/2017/Match_2_batsmen_stats.csv')
##
##df=df1.append(df2,ignore_index=True)

df=pd.DataFrame()
count=1
for i in range(1,77):
    try:
    
        df1=pd.read_csv('C:/Users/user/Desktop/Match_data - Copy/2009/Match_{}_batsmen_stats.csv'.format(i))
        print(count)
        count+=1
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

print(df.head())
df.to_csv('batsmen_dump_2009.csv')

