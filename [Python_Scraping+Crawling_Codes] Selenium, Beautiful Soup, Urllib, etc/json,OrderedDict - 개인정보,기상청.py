

from bs4 import BeautifulSoup
import requests
import datetime
import json
from collections import OrderedDict

#json 형식을 단순하게 정의
userid='abc123'
passwd='987xyz'
name='홍길동'

#userinfo = {'userid':userid,
#            'passwd':passwd,
#            'name':name}
#print(userinfo)

#json 객체 생성 : dumps
#json_obj = json.dumps(userinfo) #<- 이거는 한글깨짐
#json_obj = json.dumps(userinfo,ensure_ascii=False)
#print(json_obj)

#json 형식을 OrderedDict을 이용해서 정의
userinfo=OrderedDict()
#print(type(userinfo))
#print()
userinfo['userid']=userid
userinfo['passwd']=passwd
userinfo['name']=name

#print(type(userinfo))
#print(userinfo)
#print(json.dumps(userinfo,ensure_ascii=False))

#좀 더 복잡한 json 형식 정의
#개인정보(이름 이메일 전번 친구) + 학력사항(고교 대학 대학원)
persons=OrderedDict()
persons.name = ''

{ 'namer:''' }

persons['name']='홍길동'
persons['email']='abc123@xyz987.com'
persons['phone']='123-1234-9876'
persons['friends']=['수지','혜교','지원',]
#print(persons)

schools=OrderedDict()
#print(schools)
#print(type(schools))
#print()
schools['high']='메롱고'
schools['univ']='메롱대학교'
schools['grad']='메롱대학원'

print(schools)

#print(schools.__dict__) #출력 콘텐츠가 있어도 self.변수는 아니라는 것을 알 수 있음
persons['schools']=schools #schools는 결국, 아래 프린트 찍은 출력결과물과 별개로, 객체이긴 하나 dict 형태로 들어가는 것을 알 수 있다



#print()
print(json.dumps(schools,ensure_ascii=False))
#print(json.dumps(persons,ensure_ascii=False))

#생성한 데이터를 파일로 저장
with open('data/persons.json','w',encoding='utf-8') as j:
    json.dump(persons,j,ensure_ascii=False,indent=2)



#---------------------------------------------------------------기상청
from bs4 import BeautifulSoup
import requests
import json
from collections import OrderedDict

headers={}

url='http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109'
res=requests.get(url,headers=headers)
html=BeautifulSoup(res.text,'lxml')
import json
from collections import OrderedDict


weathers=[]

for weather in html.find_all('data'):
    # .findall => 리스트로 변환. 실제로 내역 보면 text 안보임
    # find메서드로 요소를 지정하고 text 속성으로 해당 데이터를 추출함
    tmef = weather.find('tmef').text  # 시간
    wf = weather.find('wf').text  # 날씨정보
    tmn = weather.find('tmn').text  # 최소온도
    tmx = weather.find('tmx').text  # 최고온도

    weather=OrderedDict()
    weather['tmEf']=tmef
    weather['wf'] =wf
    weather['tmn'] =tmn
    weather['tmx'] =tmx
    weathers.append(weather)
    #print(weathers)


allweathers=OrderedDict()
allweathers['weathers']=weathers

with open('data/allweathers.json','w',encoding='utf-8') as j:
    json.dump(allweathers,j,ensure_ascii=False,indent=2)

with open('data/justweather.json','w',encoding='utf-8') as j:
    json.dump(weathers,j,ensure_ascii=False,indent=2)

with open('data/allweatherscsv.csv','w',encoding='utf-8') as j:
    json.dump(allweathers,j,ensure_ascii=False,indent=2)