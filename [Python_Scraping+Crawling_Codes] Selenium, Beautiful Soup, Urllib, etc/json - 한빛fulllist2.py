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
bookinfo=[]

for book in html.select('table tbody tr td'):
    bookinfo.append(book.text)

print(bookinfo)

books=[]
cnt=len(html.select('table tbody tr td'))


for i in range(0,cnt):
    i*=5
    book=OrderedDict()
    book['brand']=bookinfo[i]
    book['bkname']=bookinfo[i+1]
    book['writer']=bookinfo[i+2]
    book['pdate']=bookinfo[i+3]
    book['price']=bookinfo[i+4]
    books.append(book)

allbook=OrderedDict()
allbook['books']=books

#생성된 json 객체를 파일에 저장
with open('data/hanbit_fullist2.json','w',encoding='utf-8') as j:
    json.dump(allbook,j,ensure_ascii=False,indent=2)