# 기상청 날씨 데이터 수집
# www.weather.go.kr
# 기상청 날씨누리 -> 특보예보 -> 동네예보
# 기상청 날씨누리 -> 생활과산업 -> 서비스 -> 인터넷 -> RSS (Rich Site Summary)
# RSS? 사이트 구독 사용자에게 업데이트 콘텐츠를 간편 배포하고자 만든 데이터 형식
# => 사이트 방문하지 않고도 해당 사이트 콘텐츠 이용 장점 존재
# 한겨레 신문
# hani.co.kr

#중기예보: http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109
#동네예보:

from bs4 import BeautifulSoup
import requests
import datetime
import csv

headers={}

url='http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109'
res=requests.get(url,headers=headers)
html=BeautifulSoup(res.text,'lxml')
#print(text)

csv_datas=[]

for weather in html.find_all('data'):
    # .findall => 리스트로 변환. 실제로 내역 보면 text 안보임
    # find메서드로 요소를 지정하고 text 속성으로 해당 데이터를 추출함
    #tmef = weather.find('tmef').text  # 시간
    #wf = weather.find('wf').text  # 날씨정보
    #tmn = weather.find('tmn').text  # 최소온도
    #tmx = weather.find('tmx').text  # 최고온도

    tmef = weather.tmef.text  # 시간
    wf = weather.wf.text  # 날씨정보
    tmn = weather.tmn.text  # 최소온도
    tmx = weather.tmx.text  # 최고온도

    csv_datas.append([tmef,wf,tmn,tmx])
    #print(csv_datas)

i=0
with open('data/weather.csv','w',encoding='utf-8') as f:
    writer=csv.writer(f)
    writer.writerows(csv_datas) #.writerow는 한줄에 길게 때려박음. 반면, .writerows는 줄바꿈 하며