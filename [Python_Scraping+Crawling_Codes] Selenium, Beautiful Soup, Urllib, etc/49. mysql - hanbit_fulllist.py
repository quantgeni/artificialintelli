#한빛미디어 전체도서목록 mysql DB에 저장하기
#대상: 브랜드 도서명 저자 발행일 정가
#테이블명 hanbit_book

from bs4 import BeautifulSoup
import requests
import pymysql

headers={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36'}
#브라우저가 아니지만 브라우저인 것처럼 하기 위해 인위적으로 가짜 브라우저 정보 만든 것 (스크레이핑/크롤링 사실 숨기기 위해)
url='http://www.hanbit.co.kr/store/books/full_book_list.html'
headers={}
res=requests.get(url,headers=headers)
rss=BeautifulSoup(res.text,'lxml')

bookinf=[]
for einfo in rss.select('table tbody tr td'):
    bookinf.append(einfo.text)
    curs.execute(sql,(bookinf[i],bookinf[i+1],bookinf[i+2],bookinf[i+3],bookinf[i+4]))

print(bookinf)
sql = 'insert into hanbit_book values (%s,%s,%s,%s,%s)'
conn=pymysql.connect(host='52.79.135.218',user='bigdata',password='bigdata0220',db='bigdata',charset='utf8')
curs=conn.cursor()

cnt=int(len(bookinf)/5)
for i in range(0,cnt):
    i*=5
    curs.execute(sql,(bookinf[i],bookinf[i+1],bookinf[i+2],bookinf[i+3],bookinf[i+4]))

conn.commit()
conn.close()

