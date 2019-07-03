# 인스타그램을 이용한 scraping 예제
# SPA = Single Page Application 구조
# 보도사진 인스타그램에서 해쉬태그 수집
# instagram.com/randyolson
# @ 안가져오고 #만 가져오려면 정규표현식으로.. 또한 중복 # 안 가져오려면 set로??

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup
import sys
import time
import re

url='https://www.instagram.com/randyolson'
options=Options()

#첫번째 페이지 해쉬태그는 script 태그 내 _sharedData에서, 두번째 페이지부터는 alt에서 추출

#try:
    chrome = webdriver.Chrome(options=options)
    chrome.get(url)
    res = chrome.page_source
    html = BeautifulSoup(res, 'lxml')
    time.sleep(2)

    body = html.find('body')
    script = body.find('script')

    raw_json = script.text.strip().replace('window._sharedData', '').replace(';', '')
    tags = re.findall(r'#\w+', raw_json) #re.findall은 리스트로 저장
    for i in range(0, len(tags)):
        print(tags[i])

    sscroll=0 #처음스크롤위치
    time.sleep(1)

    while True:
        moves='scrollTo(0,document.body.scrollHeight);' #총 스크롤된 Height (누적개념)
        chrome.execute_script(moves)
        time.sleep(2)

        html = BeautifulSoup(chrome.page_source, 'lxml')
        time.sleep(2)

        #bs 객체로부터 img 태그의 alt 속성에서 해쉬태그 추출
        for img in html.select('img[alt]'):
            alt=img.get('alt')
            tags = re.findall(r'#\w+', alt)
            for i in range(len(tags)):
                print(tags[i])

        time.sleep(1)

        #총 스크롤 거리 파악
        oscroll=chrome.execute_script('return window.pageYOffset;') #화면 이동한 순거리만큼 반환
        #print(sscroll,oscroll)

        #이동한 거리와 이동가능한 거리를 비교
        if sscroll==oscroll:
            print('스크롤불가')
            break
        elif sscroll < oscroll:
            sscroll=oscroll

        time.sleep(1)

except Exception as ex:
    print(ex, sys.exc_info()[-1].tb_lineno)
finally:
    #chrome.quit()
    pass
