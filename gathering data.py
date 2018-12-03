import pandas as pd
import bs4 as bs
import urllib.request

##strs = ['stats/2018','stats/2017','stats/2016','stats/2015','stats/2014',
##       'stats/2013','stats/2012','stats/2011',
##sauce = urllib.request.urlopen('https://www.iplt20.com/stats/2018')
##soup = bs.BeautifulSoup(sauce,'lxml')
##
##table = soup.find('table')
##
##table_rows = table.find_all('tr')
##
##for tr in table_rows:
##    td= tr.find_all('td')
##    row = [i.text for i in td]
##    print(row)

##       ]

##sauce = urllib.request.urlopen('https://www.iplt20.com/stats')
##soup = bs.BeautifulSoup(sauce, 'lxml')
##
##for url in soup.find_all('a'):
##    print(url.get('href'))
##years = [i for i in range (2008,2018)]


df1 = pd.read_excel('links - Copy.xlsx')


for i in range(0, len(df1)):
    row = str(df1.iloc[i][0])
    try:
        df = pd.read_html('https://www.iplt20.com'+row)
    except ValueError:
        print("Value error")
        continue
    df[0].to_csv('data/{}.csv'.format(row))
    print('https://www.iplt20.com'+row)



