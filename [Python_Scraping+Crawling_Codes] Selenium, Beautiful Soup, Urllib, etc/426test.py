from bs4 import BeautifulSoup
import requests
import re
from collections import OrderedDict
import json

headers={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36'}
url='http://www.kyobobook.co.kr/bestSellerNew/bestseller.laf?orderClick=d79'

res=requests.get(url,headers=headers)
html=BeautifulSoup(res.text,'lxml')

booklst=[]
for datum in html.find_all("div",{"class":"detail"}):
    bookOne=OrderedDict()
    title = datum.find("div",{"class":"title"}).text.strip()
    title = re.sub(r'\s{2,}', '', title)
    title = re.sub(r'\n','',title)
    bookOne['title']=title
    author = datum.find("div",{"class":"author"}).text.strip().split('|')[0] #<- 저 [0] 인덱스 지정으로 인해 결국 .split()으로 리스트화된 자료구조에서 다시 string값이 반환되는 것!
    author = re.sub(r'\s{2,}', '', author)
    author = re.sub(r'\t{1,5}','',author)
    author = re.sub(r'\n{1,}','',author)
    author = re.sub(r'\r\n','',author)
    author = re.sub(r'저자 더보기',' ',author)
    bookOne['author']=author
    price = datum.find("strong",{"class":"book_price"}).text.strip()
    price = re.sub(r'\s{2,}', '', price)
    price = re.sub(r'\n','',price)
    bookOne['price']=price
    booklst.append(bookOne)

allBooks=OrderedDict()
allBooks['kyobobooks']=booklst

with open('data/kyobobest.json','w',encoding='utf-8') as f:
    json.dump(allBooks,f,ensure_ascii=False,indent=2)
