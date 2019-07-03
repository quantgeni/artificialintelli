#한겨레 파이낸스 JTBC 뉴스 RSS 이용, 제목/간략뉴스 추출
#www.hani.co.kr
#www.fnnews.com
#news.jtbc.joins.com

from bs4 import BeautifulSoup
import requests

headers={}
url='http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1168052100'
url1='http://www.hani.co.kr/rss/'
url2='http://www.fnnews.com/rss/new/fn_realnews_all.xml'
url3='http://www.hani.co.kr/rss/'

#------------------------------------------------------------- 한겨레
res=requests.get(url1,headers=headers)
html=BeautifulSoup(res.text,'lxml')

#for weather in html.findAll('data'):
#    print(weather.day.string)
#    print(weather.wfkor.string)
#    print(weather.temp.string)

i=0
for hani in html.find_all('item'):
    i+=1
    print(i)
    print(hani.title.text)
    print(hani.description.text)
    print()



#------------------------------------------------------------- FNNNEWS
res=requests.get(url2,headers=headers)
#html=BeautifulSoup(res.text,'lxml')
html=BeautifulSoup(res.text,'html.parser')
#특수문자 포함 텍스트 데이터를 정의하기 위해 CDATA 블럭을 사용한 경우 bs4의 parser를 lxml이 아닌
# html.parser로 변경!!!!!
# e.g. <bold> <![CDATA[10>100]]></bold>
#    = <bold> 10 &gt; 100 </bold>
#.... gt = greater than

#for weather in html.findAll('data'):
#    print(weather.day.string)
#    print(weather.wfkor.string)
#    print(weather.temp.string)

for fnnews in html.find_all('item'):
    print(fnnews.title.text)
    print(fnnews.description.text)

#------------------------------------------------------------- JTBC
res=requests.get(url3,headers=headers)
#print(res.encoding) 하면 => ISO-8859-1
res.encoding='utf-8' # <- 이걸 억지로 바꿔주고 res.text 프린트 찍어보면 한글 안 깨짐
#html=BeautifulSoup(res.text,'lxml')

html=BeautifulSoup(res.text,'lxml')
#------------------------------------ RSS의 인코딩이 영어인 경우 한글 다 깨짐. RSS 인코딩을
#적절히 지정하면 정상적으로 출력!!

#특수문자 포함 텍스트 데이터를 정의하기 위해 CDATA 블럭을 사용한 경우 bs4의 parser를 lxml이 아닌
# html.parser로 변경!!!!!
# e.g. <bold> <![CDATA[10>100]]></bold>
#    = <bold> 10 &gt; 100 </bold>
#.... gt = greater than

#for weather in html.findAll('data'):
#    print(weather.day.string)
#    print(weather.wfkor.string)
#    print(weather.temp.string)

i=0
for jtbc in html.find_all('item'):
    i+=1
    print(i)
    print('Title: ',jtbc.title.text)
    print('Contents: ',jtbc.description.text)
    print()