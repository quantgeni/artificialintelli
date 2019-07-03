from bs4 import BeautifulSoup
import requests
#url1='https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=html5'
url1='https://media.daum.net/cp/310'

params={'page':'3'}
headers={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36'}

res=requests.get(url1,headers=headers,params=params)
html=BeautifulSoup(res.text,'lxml')

#mArticle > div.box_etc > ul > li:nth-child(1) > div > div > span

for part_html in html.select('strong.tit_thumb a.link_txt'):
    print(part_html.text.strip())
print()
for part_html in html.select('div.desc_thumb span.link_txt'):
    print(part_html.text.strip())
print()
for part_html in html.select('a.num_page:last-child'):
    print(part_html.text.strip())
print()
for part_html in html.select('em.num_page'):
    print(part_html.text.strip())