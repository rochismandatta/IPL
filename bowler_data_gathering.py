from __future__ import unicode_literals
import bs4 as bs
import urllib.request
import pandas as pd
import os
from getting_urls2017 import get_urls_year

def get_bowler_data():
    count =0
    listofurls= get_urls_year()
##    listofurls=["http://www.espncricinfo.com/series/8048/game/11365"+str(i)+"/" for i in range(61,84)]
    for url in listofurls:
        count+=1
        dfs = pd.read_html(url)

        dffinal = pd.DataFrame()
        
        for df in dfs[0:2]:
            dffinal= pd.concat([dffinal,df])
        name = "Match_"+str(count)+"_bowler_stats"
        print(name)
        dffinal.to_csv('C:/Users/user/AppData/Local/Programs/Python/Python36/Fantasy IPL/Match_data/2018/{}.csv'.format(name))
    ##            print(dffinal.head())

      
        print('loop passed')

get_bowler_data()

