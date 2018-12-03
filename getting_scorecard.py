import pandas as pd
import bs4 as bs
import urllib.request

sauce = urllib.request.urlopen('http://www.espncricinfo.com/series/8048/scorecard/1082591/sunrisers-hyderabad-vs-royal-challengers-bangalore-1st-match/')

soup = bs.BeautifulSoup(sauce,'lxml')

table = soup.find('table')

table_rows = table.find_all('tr')

for tr in table_rows:
    td = tr.find_all('td')
    row = [i.text for i in td]
    print(row)


##df = pd.read_html('http://www.espncricinfo.com/series/8048/scorecard/1082591/sunrisers-hyderabad-vs-royal-challengers-bangalore-1st-match/')
##
##for i in range(len(df)):
##    print(df[i])
##    print('\n')
##    print('\n')
##    print('\n')
##    print('\n')

