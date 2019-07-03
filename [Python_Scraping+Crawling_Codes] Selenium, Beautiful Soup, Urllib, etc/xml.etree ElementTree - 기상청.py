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

from urllib.request import urlopen
from html import unescape
import csv
import datetime

#파이썬에서 xml문서를 처리하기 위한 모듈 (lxml)
from xml.etree import ElementTree

url='http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109'
f = urlopen(url)
text=f.read().decode('utf-8')
#print(text)


# 하면에 출력한 내용은 파일(data/weather.xml)에 저장
with open('data/weather.xml', 'w', encoding='utf-8') as f:
    f.write(text)

# xml parser를 이용해서 파일을 읽어오고 메모리에 xml계층구조를 만들기 위해 ElementTree 객체 생성
tree = ElementTree.parse('data/weather.xml')

# getroot 메서드로 XML 상위요소 추출
root = tree.getroot()

# findall 메서드로 추출할 데이터가 있는 요소element 지정

for weather in root.findall('channel/item/description/body/location/data'):  # .findall => 리스트로 변환. 실제로 내역 보면 text 안보임
    # find메서드로 요소를 지정하고 text 속성으로 해당 데이터를 추출함
    tm_ef = weather.find('tmEf').text  # 시간
    wf = weather.find('wf').text  # 날씨정보
    tmn = weather.find('tmn').text  # 최소온도
    tmx = weather.find('tmx').text  # 최고온도
    # print(tm_ef,wf,tmn,tmx)

# 동네예보 출력
# 파일로 저장 : data/town.xml
# 날짜 시각 날씨 강수확률 기온 습도

url1 = 'http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1168052100'
f = urlopen(url1)
text = f.read().decode('utf-8')

with open('data/town.xml', 'w', encoding='utf-8') as f:
    f.write(text)

tree = ElementTree.parse('data/town.xml')
root = tree.getroot()

for wtop in root.findall('channel/item/description'):
    day = wtop.find('header/tm').text[0:8]  # 날짜정보
    today = datetime.datetime.strptime(day, '%Y%m%d')  # 문자열을 날짜형으로 생성. 즉, string을 진짜 datetime으로

    for weather in wtop.findall('body/data'):
        day = int(weather.find('day').text)
        myday = str(today + datetime.timedelta(days=day))[0:10]
        hour = weather.find('hour').text  # 시각
        wf = weather.find('wfKor').text  # 날씨
        pop = weather.find('pop').text  # 강수
        temp = weather.find('temp').text  # 기후
        reh = weather.find('reh').text  # 습도

        print(day, myday, hour, wf, pop, temp, reh)
