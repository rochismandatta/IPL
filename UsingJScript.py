##import sys
##from PyQt4.QtGui import QApplication
##from PyQt4.QtCore import QUrl
##from PyQt4.QtWebKit import QWebPage
##
##for i in rows:
##    for j in range(0,6):
##        twod[count][j] = i
##    count+=1
##        
##        
##
##
##df = pd.DataFrame(twod)
##print(df.head())
##class Client(QWebPage):
##
##    def __init__self(self, url):
##        self.app = QApplication(sys.argv)
##        QWebPage.__init__(self)
##        self.loadFinished.connect(self.on_page_load)
##        self.mainFrame().load(QUrl(url))
##        self.app.exec()
##
##    def on_page_load(self):
##        self.app.quit()

##
##url= 'http://www.espncricinfo.com/series/8048/scorecard/1082591/sunrisers-hyderabad-vs-royal-challengers-bangalore-1st-match/'
##client_response = Client(url)
##source = client_response.mainFrame().toHtml()
##
##soup = bs.BeautifulSoup(source, 'lxml')
##js_test = soup.find('p', class_='cell runs')
##print(js_test.text)
        
import bs4 as bs
import urllib.request
import pandas as pd



sauce = urllib.request.urlopen('http://www.espncricinfo.com/series/8048/scorecard/1082591/sunrisers-hyderabad-vs-royal-challengers-bangalore-1st-match/')

soup = bs.BeautifulSoup(sauce,'lxml')

twod = [[]]
runs = soup.find_all('div',class_='cell runs')
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
df.to_csv('test1.csv')



    




