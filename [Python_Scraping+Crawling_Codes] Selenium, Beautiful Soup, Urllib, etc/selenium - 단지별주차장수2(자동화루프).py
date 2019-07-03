#공통주택관리정보시스템 k-apt.go.kr
#단지정보를 이용해서 단지별 주차장 수 추출
#2018.08, 서울, 강남구, 아이파크 삼성동

#메인페이지 팝업창 닫기
#단지정보 클릭
#2018.08, 서울, 강남구, 아이파크삼성동 클릭

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
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

# 팝업창닫기1---------------------------------------------------------------------------------------------------
    #chrome.find_element_by_css_selector('#popup_20190416 > div.layerPopupTitle > div > a > img').click()
    #time.sleep(1)
    #chrome.find_element_by_css_selector('#popup_20181031 > div.layerPopupTitle > div > a > img').click()
    #time.sleep(1)
    #chrome.find_element_by_css_selector('#popup_20170303 > div.layerPopupTitle > div > a > img').click()
    #time.sleep(1)
    #chrome.find_element_by_css_selector('#popup_20171208 > div.layerPopupTitle > div > a > img').click()
    #time.sleep(1)

#팝업창닫기2---------------------------------------------------------------------------------------------------
    #pops=chrome.find_elements_by_css_selector('div.layerPopupTitle > div > a > img') #elements <- s복수임에 유의!

    #for pop in pops:
     #   pop.click()
     #   time.sleep(1)
#try-catch-finally로 만드는 것 권장

# 팝업창닫기3---------------------------------------------------------------------------------------------------
#    chrome.execute_script('closeLyserPopup("popup_20170303")')
#    time.sleep(1)
#    chrome.execute_script('closeLyserPopup("popup_20171208")')
#    time.sleep(1)
#    chrome.execute_script('closeLyserPopup("popup_20181031")')
#    time.sleep(1)
#    chrome.execute_script('closeLyserPopup("popup_20190416")')
#    time.sleep(1)

# 팝업창닫기4---------------------------------------------------------------------------------------------------
# (팝업창닫기3의 자동화)

#    pops=chrome.find_elements_by_css_selector('div.layerPopup')
#    for pop in pops:
#        id=pop.get_attribute('id')
#        js='closeLyserPopup("%s")' %(id)
#        chrome.execute_script(js)
#        time.sleep(2)

    #단지정보클릭방법1
    #chrome.find_element_by_css_selector('a.navi2').click()
    #time.sleep(3)

    #단지정보클릭방법2
    #loginlink = chrome.find_element_by_id('ui-id-8')
    #mouse=webdriver.ActionChains(chrome)
    #mouse.move_to_element(loginlink).click().perform()
    #time.sleep(2)

    #단지정보클릭방법3
    #loginlink = chrome.find_element_by_xpath('// *[ @ id = "ui-id-8"]')
    #mouse=webdriver.ActionChains(chrome)
    #mouse.move_to_element(loginlink).click().perform()
    #time.sleep(2)

    #단지정보클릭방법3
    #loginlink = chrome.find_element_by_xpath('// *[ @ id = "ui-id-8"]').click()
    #time.sleep(2)

    #bgnst.clear();bgnst.send_keys('서울')
    #time.sleep(1)

    #select 요소를 선택하려면 by_xpath함수를 사용해야 함

    #2018년
    chrome.find_element_by_xpath('//*[@id="group_date"]/select[1]/option[8]').click() #//는 최상위 루트. *는 그 밑 하위요소.
    time.sleep(1)
    #chrome.find_element_by_css_selector('select > option:nth-child(3)').click()

    #8월
    chrome.find_element_by_xpath('//*[@id="group_date"]/select[2]/option[9]').click()
    time.sleep(1)

    #서울
    chrome.find_element_by_xpath('// *[ @ id = "group_bjd"] / select[1] / option[10]').click()
    time.sleep(1)

    #강남구
    chrome.find_element_by_xpath('//*[@id="group_bjd"]/select[2]/option[2]').click()
    time.sleep(1)


    #삼성동
    chrome.find_element_by_xpath('//*[@title="읍면동 선택"]/option[text()="삼성동"]').click()
    time.sleep(1) #위처럼 xpath 설정할 수 있다는 것도 눈여겨 볼 것!!

    #삼성동센트럴아이파크
    # // *[ @ id = "1"] / td[2]
    # \31 > td:nth-child(2)
    # // *[ @ id = "1"] / td[2]
    # // *[ @ id = "2"] / td[2]
    # // *[ @ id = "15"] / td[2]

    #houses=chrome.find_elements_by_xpath('')

    for i in range(1,15+1):
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