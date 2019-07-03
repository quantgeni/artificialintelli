#한빛 전체 도서목록 추출하여 json 형식으로 저장.
#대상: 브랜드 도서명 저자 발행일 정가
#파일명:hanbit_fulllist.json

from bs4 import BeautifulSoup
import requests
import datetime
import json
from collections import OrderedDict

url='http://www.hanbit.co.kr/store/books/full_book_list.html'
headers={}
res=requests.get(url,headers=headers)
html=BeautifulSoup(res.text,'lxml')

#추출한 도서정보를 저장하기 위해 변수 선언
brand=[]
bkname=[]
writer=[]
pdate=[]
price=[]

#각 도서정보를 각 리스트에 넣어줌
for book in html.select('table tbody tr'):
    for td in book.select('td:nth-child(1)'):
        brand.append(td.text)
for book in html.select('table tbody tr'):
    for td in book.select('td:nth-child(2)'):
        bkname.append(td.text)
for book in html.select('table tbody tr'):
    for td in book.select('td:nth-child(3)'):
        writer.append(td.text)
for book in html.select('table tbody tr'):
    for td in book.select('td:nth-child(4)'):
        pdate.append(td.text)
for book in html.select('table tbody tr'):
    for td in book.select('td:nth-child(5)'):
        price.append(td.text)

#json 파일 생성
books=[]

cnt=len(html.select('table tbody tr'))

for i in range(0,cnt):
    book=OrderedDict()
    book['brand']=brand[i]
    book['bkname']=bkname[i]
    book['writer']=writer[i]
    book['pdate']=pdate[i]
    book['price']=price[i]
    books.append(book)

allbook=OrderedDict()
allbook['books']=books
#=> [{},{},{},...]

#생성된 json 객체를 파일에 저장
with open('data/hanbit_fullist.json','w',encoding='utf-8') as j:
    json.dump(allbook,j,ensure_ascii=False,indent=2)