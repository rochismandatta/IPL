import pandas as pd

'''
#read_in_batsmen():
    pd.read_csv() #loop name will change file


#read_in_bowler():
    pd.read_csv()

# using exception handling we can ignore the sEcond instance of R M SR etc
'''
def points_bowler(df):
    sumpts_w=0
    sumpts_econ=0
    sumpts_maid=0
    sumpts_4w =0
    sumpts_5w =0
    
    df['sumpts_w'] = [i*10 for i in df['W']]


    df['sumpts_4w'] = [0 for i in df['W']]
    df['sumpts_5w'] = [0 for i in df['W']]
    count1 = 0

    for i in df['W']:
        if i >= 4:
            df['sumpts_4w'].iloc[count1]=4

        if i >=5: #assumptsing a five wicket haul = 9 pts (4+5)
            df['sumpts_5w'].iloc[count1] = 5
        
    df['sumpts_econ'] = [0 for i in df['W']]
    count = 0
    for i in df['Econ']:
            
        if i < 4:
            df['sumpts_econ'].iloc[count] = 3
        elif i >=4 and i <5:
            df['sumpts_econ'].iloc[count] =2
        elif i >=5 and i <6:
            df['sumpts_econ'].iloc[count] =1
        elif i >=9 and i <10:
            df['sumpts_econ'].iloc[count] =-1
        elif i >=10 and i <11:
            df['sumpts_econ'].iloc[count] =-2
        elif i >=11:
            df['sumpts_econ'].iloc[count] =-3

        count+=1

    df['sumpts_maid'] = [i*4 for i in df['M']]

    df['totalpoints'] = df['sumpts_w'] + df['sumpts_econ'] + df['sumpts_maid'] + df['sumpts_4w'] + df['sumpts_5w']
    return(df)


def points_batsmen(df):

    

    
    sumpts_r=0
    sumpts_4=0
    sumpts_6=0
    sumpts_sr=0
    sumpts_50=0
    sumpts_100=0

    df['sumpts_r'] = [0 for i in df['R']]
    df['sumpts_4'] = [0 for i in df['4s']]
    count2=0
    count3=0

    df['sumpts_r']= [(float(i)*0.5) for i in df['R']]
    df['sumpts_4']= [(float(i)*0.5) for i in df['4s']]
    
##    for i in df['4s']:
##        df['sumpts_4'].iloc[count2] = float(i)*0.5
##    count2+=1
##
##    for i in df['R']:
##        df['sumpts_r'].iloc[count3] = float(i)*0.5
##    count3+=1


    df['sumpts_6'] = [i*1 for i in df['6s']]
    
    df['sumpts_50'] = [0 for i in df['R']]
    df['sumpts_100'] = [0 for i in df['R']]
    count=0
    count1=0
    for i in df['R']:
        if (int(i)>=100):
            df['sumpts_100'].iloc[count]=8
        if (int(i)>=50): #again assumptsing 100 runs = 12 pts
            df['sumpts_50'].iloc[count]=4
        count+=1

        
    count4=0
    df['sumpts_sr'] = [0 for i in df['SR']]  
    for i in df['SR']:
        if float(i) >=60 and float(i)<70:
            df['sumpts_sr'].iloc[count4] = -1
        elif float(i) >=50 and float(i)<60:
            df['sumpts_sr'].iloc[count4] = -2
        elif float(i) < 50:
            df['sumpts_sr'].iloc[count4] = -3

        count4+=1

##    df['totalpoints'] = float(df['sumpts_r']) + float(df['sumpts_4']) + float(df['sumpts_6']) + float(df['sumpts_50']) + float(df['sumpts_100']) + float(df['sumpts_sr'])
        
    return df




###Bowler works
##df = pd.read_csv('C:/Users/user/AppData/Local/Programs/Python/Python36/Fantasy IPL/DUMP/bowler_dump_2017.csv')
##df1 = points_bowler(df)     
####print(df1)



df = pd.read_csv('C:/Users/user/AppData/Local/Programs/Python/Python36/Fantasy IPL/batsmen_mega_dump_2018.csv')
df.dropna(axis=0, how='any',inplace=True)
##index = 0
##
##for i in df['R']:
##    if str(i) == 'R':
##        df.drop(index, axis=0, inplace=True)
##        print('entered if')
###    print(i[:index]), dunno why this works though but it does
##    index+=1
##    
df1 = points_batsmen(df)
print(df1.head())
##print(df)
df1.to_csv('C:/Users/user/Desktop/Batsmen_final_dump_wpts.csv')

    
    


