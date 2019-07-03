
from bs4 import BeautifulSoup
import requests
import cx_Oracle
import os

headers={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36'}
#브라우저가 아니지만 브라우저인 것처럼 하기 위해 인위적으로 가짜 브라우저 정보 만든 것 (스크레이핑/크롤링 사실 숨기기 위해)
url='http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109'


res=requests.get(url,headers=headers)
rss=BeautifulSoup(res.text,'lxml')

wts=[]
for w in rss.find_all('data'):
    wts.append(w.tmef.text)
    wts.append(w.wf.text)
    wts.append(w.tmn.text)
    wts.append(w.tmx.text)

#print(wts)
#weathers 테이블에 날씨정보를 저장하는 sql
#insert into weathers values ('','','','','')

#mysql에 날씨 정보 저장하기
sql = 'insert into weathers2 values (:tmef,:wf,:tmn,:tmx)'
os.putenv('NLS_LANG','.UTF8')

conn=cx_Oracle.connect('bigdata','bigdata','52.79.135.218/xe')
curs=conn.cursor()

cnt=int(len(wts)/4)
for i in range(0,cnt):
    i*=4
    curs.execute(sql,tmef=wts[i],wf=wts[i+1],tmn=wts[i+2],tmx=wts[i+3])

conn.commit()
conn.close()

