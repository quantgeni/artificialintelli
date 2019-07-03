from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup
import sys
import time
import re

url='https://www.instagram.com/randyolson'
options=Options()

#첫번째 페이지 해쉬태그는 script 태그 내 _sharedData에서, 두번째 페이지부터는 alt에서 추출
chrome = webdriver.Chrome(options=options)
chrome.get(url)
res = chrome.page_source
html = BeautifulSoup(res, 'lxml')
time.sleep(2)

body = html.find('body')
print(body)

#script = body.find('script')

#print(type(script))
#print(script)

#raw_json = script.text.strip().replace('window._sharedData', '').replace(';', '')


#tags = re.findall(r'#\w+', raw_json)  # re.findall은 리스트로 저장
#print(tags)

#for i in range(0, len(tags)):
#    print(tags[i])