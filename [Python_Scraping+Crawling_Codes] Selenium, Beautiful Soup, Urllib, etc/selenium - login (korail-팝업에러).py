from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.alert import Alert
from bs4 import BeautifulSoup
import sys
import time
#from selenium.webdriver import DesiredCapabilities
#from selenium.webdriver.common.alert import Alert
#from selenium.webdriver.common.by import By
#from selenium.webdriver.common.action_chains import ActionChains

url='http://www.letskorail.com'
options=Options()
#options.add_argument('--headless')
try:
    chrome=webdriver.Chrome(options=options)
    chrome.get(url)
    time.sleep(2)

    # header > div.h_cont > div > ul.gnb_list > li:nth-child(2) > a
    loginlink = chrome.find_element_by_css_selector('ul.gnb_list > li:nth-child(2) > a')
    #css selector로 대략 가져와도 아래 click perform 시 링크 클릭 굿
    mouse=webdriver.ActionChains(chrome)
    mouse.move_to_element(loginlink).click().perform()
    time.sleep(2)

    #로그인 정보 입력하고 로그인
    userid = '0260385806'
    passwd = 'Korail!!1122'
    # 로그인 페이지의 id, pwd 입력창, 로그인버튼 찾음
    uid = chrome.find_element_by_id('txtMember')
    #daum의 경우 iframe에 id 넣어둬서 바로 못 들어감. 따라서, 위에서 먼저 frame 스위치 해줘야 함
    upw = chrome.find_element_by_id('txtPwd')

    #loginbtn = chrome.find_element_by_class_name('btn_login')
    loginbtn = chrome.find_element_by_css_selector('img[alt="확인"]') #위 아래 둘다 됨!! (확인 버튼 클릭)

    # id,pwd 입력창에 값 입력
    uid.send_keys(userid)
    time.sleep(2)
    upw.send_keys(passwd)
    time.sleep(2)
    # 로그인버튼클릭
    mouse=webdriver.ActionChains(chrome) #이거 굳이 또 써줘야 한다는 점 유의!!
    mouse.move_to_element(loginbtn).click().perform()
    time.sleep(2)

    #승차권 예매 버튼 (빨간색) 클릭
    resvbtn=chrome.find_element_by_css_selector('img[alt="승차권예매"]')
    mouse=webdriver.ActionChains(chrome) #이거 굳이 또 써줘야 한다는 점 유의!!
    mouse.move_to_element(resvbtn).click().perform()
    time.sleep(2)

    #승차권 예매 페이지에서 인원정보,좌석방향,출발/도착역,출발일(년/월/일/시) 변경 후
    #조회하기 버튼 클릭 (단, 여기에서는 일반승차권 기준)
    psnum=chrome.find_element_by_id('peop01')
    seatdr=chrome.find_element_by_id('seat02')
    trntype=chrome.find_element_by_css_selector('input[title="KTX"]')
    bgnst=chrome.find_element_by_id('start')
    endst=chrome.find_element_by_id('get')
    stnbtn=''
    styear=chrome.find_element_by_id('s_year')
    stmon=chrome.find_element_by_id('s_month')
    stday=chrome.find_element_by_id('s_day')
    sttime=chrome.find_element_by_id('s_hour')
    findbtn=chrome.find_element_by_css_selector('img[alt="조회하기"]')
    time.sleep(1)

    #실제 값 지정하기
    trntype.click()
    time.sleep(1)

    # seat02 > option:nth-child(3)

    bgnst.clear();bgnst.send_keys('서울')
    time.sleep(1)
    endst.clear();endst.send_keys('양평')
    time.sleep(1)


    #select 요소를 선택하려면 by_xpath함수를 사용해야 함

    chrome.find_element_by_xpath('//*[@id="peop01"]/option[text()="어른 3명"]').click() #//는 최상위 루트. *는 그 밑 하위요소.
    time.sleep(1)
    #chrome.find_element_by_css_selector('select > option:nth-child(3)').click()
    chrome.find_element_by_xpath('//*[@id="seat02"]/option[text()="역방향석"]').click()
    time.sleep(1)
    chrome.find_element_by_xpath('//*[@id="s_year"]/option[text()="2019"]').click()
    time.sleep(1)
    chrome.find_element_by_xpath('//*[@id="s_month"]/option[text()="4"]').click()
    time.sleep(1)
    chrome.find_element_by_xpath('//*[@id="s_day"]/option[text()="22"]').click()
    time.sleep(1)
    chrome.find_element_by_xpath('//*[@id="s_hour"]/option[text()="19 (오후07)"]').click()
    time.sleep(1)

    mouse=webdriver.ActionChains(chrome) #이거 굳이 또 써줘야 한다는 점 유의!!
    mouse.move_to_element(findbtn).click().perform()
    time.sleep(5)



    #alert 창을 띄우기 위해 의도적으로 출발역/도착역 지정()
    #2019.04.04 강원도 산불 관련 안내
    #alert 대화상자 처리
    Alert(chrome).accept()
    timesleep(3)
    #예매 페이지가 잘 보이도록 페이지를 아래로 스크롤함
    chrome.execute_script('scrollTo(0,550') #앞:좌우이동 #뒤:위아래
    timesleep(5)

except Exception as ex:
    print(ex, sys.exc_info()[-1].tb_lineno)
finally:
    #chrome.quit()
    pass