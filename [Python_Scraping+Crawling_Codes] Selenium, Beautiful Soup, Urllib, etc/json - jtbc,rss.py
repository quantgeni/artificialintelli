#JTBC RSS json 형식 파일 저장
#대상: 제목 링크 뉴스본문 배포일
#파일명: jtbc_rss_flash.json

#한빛 전체 도서목록 추출하여 json 형식으로 저장.
#대상: 브랜드 도서명 저자 발행일 정가


from bs4 import BeautifulSoup
import requests
import datetime
import json
from collections import OrderedDict

url='http://fs.jtbc.joins.com//RSS/newsflash.xml'
headers={}
res=requests.get(url,headers=headers)
res.encoding='utf-8'
rss=BeautifulSoup(res.text,'lxml-xml')
#lxml은 xml에서 제공하는 'html'을 위한 파서이기 때문에, xml 전용 파서인 lxml-xml로 변경.
#변경 안하면 <link></link>를 못 읽어냄.....

newslst=[]

for news in rss.find_all('item'):
    newOne = OrderedDict()
    newOne['title']=news.title.text
    newOne['link']=news.link.text
    newOne['desc']=news.description.text
    newOne['pdate']=news.pubDate.text #파서가 xml 전용으로 바뀌었기 때문에 정확히 맞춰 써줘야 (즉 기존 pubdate에서 pubDate으로)
    newslst.append(newOne)

allnews=OrderedDict()
allnews['news']=newslst

#생성된 json 객체를 파일에 저장
with open('data/jtbc_rss_flash.json','w',encoding='utf-8') as f:
    json.dump(allnews,f,ensure_ascii=False,indent=2)