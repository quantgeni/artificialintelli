
from bs4 import BeautifulSoup
import requests
import pymysql

url='http://fs.jtbc.joins.com//RSS/newsflash.xml'
headers={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36'}

res=requests.get(url,headers=headers)
res.encoding='utf-8'
rss=BeautifulSoup(res.text,'lxml-xml')

#브라우저가 아니지만 브라우저인 것처럼 하기 위해 인위적으로 가짜 브라우저 정보 만든 것 (스크레이핑/크롤링 사실 숨기기 위해)

print(rss.select('item'))
#print(rss.find_all('item'))


#jtbclst=[]
#for einfo in rss.select('item'):
#    jtbclst.append(einfo.text)
#    jtbclst.append(einfo.text)
#    jtbclst.append(einfo.text)
#    jtbclst.append(einfo.text)
    #jtbclst.append(einfo.title.text)
    #jtbclst.append(einfo.link.text)
    #jtbclst.append(einfo.description.text)
    #jtbclst.append(einfo.pubDate.text)
#print(jtbclst)