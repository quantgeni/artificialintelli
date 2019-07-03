# 인스타그램을 이용한 scraping 예제
# SPA = Single Page Application 구조
# 보도사진 인스타그램에서 해쉬태그 수집
# instagram.com/randyolson
# SPA인 것을 감안, selenium이 아닌 request와 beautifulsoup으로 추출해보기

# SPA 특징 : 단일 페이지만으로 구성. AJAX와 JSON, 적절한 이벤트 활용, 세련된 UX 제공
# 주로 SNS 등이 이런 패턴으로 제작. 일반적으로 웹 어플에 필요한
# 일부/전체 정적 데이터를 최초에 모두 다운로드 하고 새로운 데이터 요청 시 새로고침이 발생되지 않는
# AJAX를 이용함
# SPA 특성 상 서버로부터 데이터를 읽어오면 script 태그를 이용해서 _sharedData 변수에 그것을 저장함
# 이미지 클릭 시 자바스크립트를 이용해서 UI를 생성하고 브라우저에 표시함

from bs4 import BeautifulSoup
import requests
import json
import pprint #json 넘어오는 데이터 이쁘게 찍기 위해 (pretty print)
import re


from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import sys
import time

url='https://www.instagram.com/randyolson'
options=Options()
headers={}
res=requests.get(url,headers=headers)
html=BeautifulSoup(res.text,'lxml')

#본문에서 script 태그에 정의된 _sharedData 변수를 찾아냄

body=html.find('body')
script=body.find('script')
print(body)

raw_json=script.text.strip()
#print(raw_json)
raw_json=raw_json.replace('window._sharedData = ','').replace(';','')
#pprint.pprint(raw_json,indent=2)

#웹블우저에서는 크롬의 개발자 도구의 network 도구에서 맨 마지막 ?query_hash= 가 요청받은
#데이터가 json형태임을 확인

#json 형식으로 데이터를 메모리에 불러온 후 데이터 추출
jason_data=json.loads(raw_json)

#해쉬태그 추출방법1
post_data=jason_data['entry_data']['ProfilePage'][0]
post_data=post_data['graphql']['user']
post_data=post_data['edge_owner_to_timeline_media']
post_data=post_data['edges'][1]['node']
post_data=post_data['edge_media_to_caption']['edges']
tag_data=post_data[0]['node']['text']
#pprint.pprint(tag_data,indent=2)

#'#'가 붙은 단어 찾기
tags=re.findall(r'#\w+',tag_data)
for i in range(0,len(tags)):
    print(tags[i])

#해쉬태그 추출방법2
tags=re.findall(r'#\w+',raw_json)
for i in range(0,len(tags)):
    print(tags[i])