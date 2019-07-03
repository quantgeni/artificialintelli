# 인스타그램을 이용한 scraping 예제
# SPA = Single Page Application 구조
# 보도사진 인스타그램에서 해쉬태그 수집
# instagram.com/randyolson
# @ 안가져오고 #만 가져오려면 정규표현식으로.. 또한 중복 # 안 가져오려면 set로??

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import sys
import time

url='https://www.instagram.com/randyolson'
options=Options()

try:
    chrome=webdriver.Chrome(options=options)
    chrome.get(url)
    time.sleep(2)

    cnt = chrome.find_element_by_css_selector('span.g47SY:first-child').text
    print(cnt)

    a=chrome.find_element_by_css_selector('div.v1Nh3:first-child a')
    a.click()
    time.sleep(2)


    hashtags=chrome.find_elements_by_css_selector('div.C4VMK span a')
    for tag in hashtags:
        print(tag.text)
    time.sleep(1)

    #다음껄로 넘기기
    rarrow=chrome.find_element_by_css_selector('div.EfHg9 > div > div > a:nth-child(1)')
    rarrow.click()
    time.sleep(2)

    hashtags=chrome.find_elements_by_css_selector('div.C4VMK span a')
    for tag in hashtags:
        print(tag.text)
    time.sleep(1)


    #다음껄로 넘기기

    for _ in range(1,int(cnt)+1):
        rarrow = chrome.find_element_by_css_selector('div.EfHg9 > div > div > a:nth-child(2)')
        rarrow.click()
        time.sleep(2)

        hashtags=chrome.find_elements_by_css_selector('div.C4VMK span a')
        for tag in hashtags:
            print(tag.text)
        time.sleep(1)


except Exception as ex:
    print(ex, sys.exc_info()[-1].tb_lineno)
finally:
    #chrome.quit()
    pass

