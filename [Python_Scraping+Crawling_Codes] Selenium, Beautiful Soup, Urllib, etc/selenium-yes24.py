#centos에 설치한 selenium과 chrome driver를 이용한 scraping 실습
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup

#headless를 위한 option 설정
options=Options()
options.add_argument('--headless')

url1='http://www.yes24.com/24/Category/NewProduct'
#executables=r'C:\Program Files (x86)\Google\Chrome\Application\chromedriver.exe'

#chrome webdriver 실행
chrome = webdriver.Chrome(options=options)


# 지정한 url로 접속
chrome.get(url1)

# 응답으로 받은 페이지소스를 변수에 저장
res=chrome.page_source
chrome.close()

from bs4 import BeautifulSoup
html=BeautifulSoup(res,'lxml')

for title in html.select('ul#topBooksUl_001 p.goods_name a'):
    print(title.text)

for auth in html.select('ul#topBooksUl_001 span.goods_auth'):
    print(auth.text)

for price in html.select('ul#topBooksUl_001 p.goods_price'):
    print(price.text)


