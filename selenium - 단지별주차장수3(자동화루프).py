#공통주택관리정보시스템 k-apt.go.kr
#단지정보를 이용해서 단지별 주차장 수 추출
#2018.08, 서울, 강남구, 아이파크 삼성동

#메인페이지 팝업창 닫기
#단지정보 클릭
#2018.08, 서울, 강남구, 아이파크삼성동 클릭

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.select import Select
from selenium.webdriver.common.alert import Alert
from bs4 import BeautifulSoup
import sys
import time


url='http://k-apt.go.kr/kaptinfo/openkaptinfo.do'
options=Options()
#options.add_argument('--headless')
try:
    chrome=webdriver.Chrome(options=options)
    chrome.get(url)
    time.sleep(2)

    #2018년
    yy=Select(chrome.find_element_by_class_name('combo_YYYY'))
    yy.select_by_visible_text('2018')
    time.sleep(2)

    #8월
    mm=Select(chrome.find_element_by_class_name('combo_MM'))
    mm.select_by_visible_text('08')
    time.sleep(2)

    #서울
    sido=Select(chrome.find_element_by_class_name('combo_SIDO'))
    sido.select_by_visible_text('서울특별시')
    time.sleep(2)

    #강남구
    gugun=Select(chrome.find_element_by_class_name('combo_SGG'))
    gugun.select_by_visible_text('강남구')
    time.sleep(2)


    #삼성동
    dong=Select(chrome.find_element_by_class_name('combo_EMD'))
    dong.select_by_visible_text('삼성동')
    time.sleep(2)

    #삼성동센트럴아이파크
    # // *[ @ id = "1"] / td[2]
    # \31 > td:nth-child(2)
    # // *[ @ id = "1"] / td[2]
    # // *[ @ id = "2"] / td[2]
    # // *[ @ id = "15"] / td[2]

    #houses=chrome.find_elements_by_xpath('')

    # 아파트목록 마지막 id값 알아보기1
    trs=chrome.find_elements_by_css_selector('table[id="aptInfoList"] tr:last-child')
    for tr in trs:
        id=tr.get_attribute('id') #리스트가 되진 않음 ㅎㅎ
    #print(id) #마지막 id값만 프린트

    for i in range(1,int(id)+1):
        aptno='//tr[@id="%s"]' %(i) #<- 오, 유의!!!
        chrome.find_element_by_xpath(aptno).click()
    #    chrome.find_element_by_xpath('//*[@title="아이파크삼성동"]').click()
        time.sleep(1)

        #기본정보TAB클릭
        chrome.find_element_by_css_selector('img[alt="기본정보"]').click()
        #chrome.find_element_by_css_selector('ui-id-4 > img').click()
        #바로 위에껀 실행 안됨 -_-;;
        time.sleep(1)

        #아파트명
        aptn=chrome.find_element_by_id('kapt_name')
        print('아파트명 : ',aptn.text)
        time.sleep(1)

        #법정동주소
        aptaddr=chrome.find_element_by_id('kab_addr')
        print('법정동주소 : ', aptaddr.text)
        time.sleep(1)

        #관리시설정보TAB클릭
        chrome.find_element_by_css_selector('img[alt="관리시설정보"]').click()
        #chrome.find_element_by_css_selector('ui-id-4 > img').click()
        #바로 위에껀 실행 안됨 -_-;;
        time.sleep(1)

        #주차대수정보
        #parking_cnt
        parking=chrome.find_element_by_id('parking_cnt')
        print('주차정보 : ',parking.text)
        time.sleep(1)

        chrome.find_element_by_css_selector('img[alt="단지검색"]').click()

except Exception as ex:
    print(ex, sys.exc_info()[-1].tb_lineno)
finally:
    #chrome.quit()
    pass
