from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup
import sys
import time

url='https:www.naver.com'
options=Options()
#options.add_argument('--headless')

try:
    chrome=webdriver.Chrome(options=options)
    chrome.get(url)
    # chrome.implicitly_wait(2) #시간지연
    time.sleep(2)

    #res=chrome.page_source
    # 로그인 버튼을 찾아서 selenium이 클릭하게 함 (왜냐하면
    loginbtn = chrome.find_element_by_class_name('lg_local_btn')
    mouse = webdriver.ActionChains(chrome)
    mouse.move_to_element(loginbtn).click().perform()

    # chrome.implicitly_wait(3) #시간지연
    time.sleep(2)

    userid = 'intgeni'
    passwd = 'ohgenius1'

    # 로그인 페이지의 id, pwd 입력창, 로그인버튼 찾음
    uid = chrome.find_element_by_id('id') #elements 아님에 유의!! elements 하면 리스트로 넘어옴
    upw = chrome.find_element_by_id('pw')
    loginbtn = chrome.find_element_by_class_name('btn_global')

    # id,pwd 입력창에 값 입력
    uid.send_keys(userid)
    time.sleep(2)
    upw.send_keys(passwd)
    time.sleep(2)

    # 로그인버튼클릭
    mouse = webdriver.ActionChains(chrome)
    mouse.move_to_element(loginbtn).click().perform()
    time.sleep(3)
except Exception as ex:
    print(ex, sys.exc_info()[-1].tb_lineno)
finally:
    chrome.quit()
    pass

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup
import sys
import time
#-------------------------------
url='https://www.daum.net/'
options=Options()
#options.add_argument('--headless')
try:
    chrome=webdriver.Chrome(options=options)
    chrome.get(url)
    # chrome.implicitly_wait(2) #시간지연
    time.sleep(2)
    #res=chrome.page_source
    # chrome.implicitly_wait(3) #시간지연
    time.sleep(2)
    #selenium 제어를 main이 아닌 iframe으로 이동
    iframe=chrome.find_element_by_id('loginForm')
    chrome.switch_to.frame(iframe)

    userid = 'verydiligent'
    passwd = 'cjswotbvj'
    # 로그인 페이지의 id, pwd 입력창, 로그인버튼 찾음
    uid = chrome.find_element_by_id('id')
    #daum의 경우 iframe에 id 넣어둬서 바로 못 들어감. 따라서, 위에서 먼저 frame 스위치 해줘야 함
    upw = chrome.find_element_by_id('inputPwd')
    loginbtn = chrome.find_element_by_id('loginSubmit')
    # id,pwd 입력창에 값 입력
    uid.send_keys(userid)
    time.sleep(2)
    upw.send_keys(passwd)
    time.sleep(2)
    # 로그인버튼클릭
    mouse = webdriver.ActionChains(chrome)
    mouse.move_to_element(loginbtn).click().perform()
    time.sleep(2)
    #받은메일확인
    mailnum=chrome.find_element_by_class_name('link_num') #link_num #mail이 아닌?
    print('받은 메일: ', mailnum.text)
    time.sleep(2)
    logoutbtn = chrome.find_element_by_class_name('btn_logout')
    #ico_pctop btn_logout라고 쓰지 않는 것에 유의!
    logoutbtn.submit() #submit 활성화
    mouse.move_to_element(logoutbtn).click().perform()
    time.sleep(2)

except Exception as ex:
    print(ex, sys.exc_info()[-1].tb_lineno)
finally:
    #chrome.quit()
    pass