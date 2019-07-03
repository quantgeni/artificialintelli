from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup
import sys

url = 'http://finance.daum.net'

options = Options()
options.add_argument('--headless')

chrome = webdriver.Chrome(options=options)

try:
    chrome = webdriver.Chrome(options=options)
    chrome.get(url)
    chrome.implicitly_wait(2)  # 시간지연

    res = chrome.page_source
except Exception as ex:
    print(ex, sys.exc_info()[-1].tb_lineno)
finally:
    chrome.quit()

html = BeautifulSoup(res, 'lxml')

for title in html.select('div.stock h5 a'):
    print(title.text.strip())
for indexes in html.select('div.DOMESTIC span strong'):
    print(indexes.text.strip())
