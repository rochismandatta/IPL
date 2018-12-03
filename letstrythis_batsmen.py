import bs4 as bs
import urllib.request
import pandas as pd
from getting_urls2017 import get_urls_year
from bowler_data_gathering import get_bowler_data


Match_num =0
listofurls= get_urls_year()


for url in listofurls:
    sauce = urllib.request.urlopen(url)

    try:
            
        soup = bs.BeautifulSoup(sauce,'lxml')
        Match_num+=1
        name ="Match_"+str(Match_num)+"_batsmen_stats"


        twod = [[]]
        runs = soup.find_all('div',class_='cell runs')
        batsmen = soup.find_all('div', class_='cell batsmen')
        rows=[]
        i = 0
        count =0
        for run in runs:
            rows.append(run.get_text())
            i+=1
        print(rows)
        batsmen_row=[]
        for batsman in batsmen:
            batsmen_row.append(batsman.get_text())
        print(batsmen_row)
                

        start = 0
        num_iter = int(len(rows)/5)
        twod = [[] for _ in range(num_iter)]

        for i in range(0,num_iter):
            print(i)
            twod[i].append(rows[start:start+5])
            start+=5
        print(twod)
            

        df =pd.DataFrame(twod)
        df1 = pd.DataFrame(batsmen_row)
        df2 = pd.concat([df1,df], axis=1)
        print(df2)

        df2.to_csv('C:/Users/user/AppData/Local/Programs/Python/Python36/Fantasy IPL/Match_data/2018/{}.csv'.format(name))
        print(name)
          
        
    except:
        print("Its cool we handle exceptions now")
        continue



##get_bowler_data()

