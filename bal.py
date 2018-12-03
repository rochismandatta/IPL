import bs4 as bs
import urllib.request
import pandas as pd

def get_urls_year():
    #class_='potMatchMenuLink'
    site=["http://www.espncricinfo.com/series/8048/game//11365"+str(i) for i in range(60,84)]
    print(site)
##    sauce = urllib.request.urlopen(site)
##
##
##    soup = bs.BeautifulSoup(sauce,'lxml')
##
##    ##urls = soup.find_all(class_='potMatchMenuLink')
##    listofurls=[]
##    ##i = 0
##    ##count =0
##    ##for url in urls:
##    ##    if url.get_text == 'Scorecard':
##    ##        listofurls.append(url.get('href'))
##    ##
##    ##print(listofurls)
##
##    for url in soup.find_all('a'):
##           if (url.text)=='Scorecard':
##               listofurls.append(url.get('href'))
##
##        
##    print(listofurls)
####    return (listofurls)
##
get_urls_year()


