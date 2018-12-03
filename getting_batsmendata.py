import bs4 as bs
import urllib.request
import pandas as pd
from getting_urls2017 import get_urls_year
##from bowler_data_gathering import get_bowler_data


Match_num =0
listofurls= get_urls_year()
##listofurls=["http://www.espncricinfo.com/series/8048/game/11365"+str(i)+"/" for i in range(61,84)]
##listofurls=['http://www.espncricinfo.com/series/8048/scorecard/1136561/mumbai-indians-vs-chennai-super-kings-1st-match/',
##            'http://www.espncricinfo.com/series/8048/scorecard/1136561/mumbai-indians-vs-chennai-super-kings-1st-match/',
print(listofurls)

for url in listofurls:
    sauce = urllib.request.urlopen(url)

    try:
            
        soup = bs.BeautifulSoup(sauce,'lxml')
        print(soup)
        Match_num+=1
        name ="Match_"+str(Match_num)+"_batsmen_stats"


               

        twod = [[]]
        runs = soup.find_all('div',class_='cell runs')
        print(runs)
        rows=[]
        i = 0
        count =0
        for run in runs:
            rows.append(run.get_text())
            i+=1

        start = 0
        num_iter = int(len(rows)/6)
        twod = [[] for _ in range(num_iter)]

        for i in range(0,num_iter):
            print(i)
            twod[i].append(rows[start:start+6])
            #print(twod)
            start+=6


        df =pd.DataFrame(twod)
##        print(df[0][0])
        
        df.to_csv('C:/Users/user/AppData/Local/Programs/Python/Python36/Fantasy IPL/Match_data/2018/{}.csv'.format(name))
        print(name)
        
        
    except ValueError:
        print("Its cool we handle exceptions now")
        continue

##get_bowler_data()
