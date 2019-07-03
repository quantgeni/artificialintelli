from bs4 import BeautifulSoup
import requests
import datetime
import csv

headers={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36'}
url='http://media.daum.net/cp/310'
res=requests.get(url,headers=headers)
html=BeautifulSoup(res.text,'lxml')

daum_data=[]
tit=[]
desc=[]

for econtent in html.select("div.cont_thumb"):
    tit=econtent.select("strong.tit_thumb a.link_txt")
    for etit in tit:
        daum_data.append(etit.text.strip())
    desc=econtent.select("div.desc_thumb span.link_txt")
    for edesc in desc:
        daum_data.append(edesc.text.strip())

with open('data/jtbc20180427.csv','w',encoding='utf-8') as f:
    writer=csv.writer(f)
    writer.writerows(daum_data)
