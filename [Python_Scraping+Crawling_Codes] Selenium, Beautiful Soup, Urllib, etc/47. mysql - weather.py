#기상청 날씨 데이터 수집하기
#수집한 데이터를 mysql 데이터베이스의 tmef(시간), wf(날씨), tmn(최소온도), tmx(최대온도)
#weathers 테이블에 저장함

# create table weathers (
#   tmef    varchar(20),
#   wf      varchar(20),
#   tmn     decimal(5),
#   tmx     varchar(5)
# )

from bs4 import BeautifulSoup
import requests
import pymysql

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

#weathers 테이블에 날씨정보를 저장하는 sql
#insert into weathers values ('','','','','')

#mysql에 날씨 정보 저장하기
sql = 'insert into weathers values (%s,%s,%s,%s)'
conn=pymysql.connect(host='52.79.135.218',user='bigdata',password='bigdata0220',db='bigdata',charset='utf8')
curs=conn.cursor()

cnt=int(len(wts)/4)
for i in range(0,cnt):
    i*=4
    curs.execute(sql,(wts[i],wts[i+1],wts[i+2],wts[i+3]))

conn.commit()
conn.close()

