

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.select import Select

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

    #선택한 시,구,동에 대한 코드값 출력
    for option in sido.options:
        if option.text=='서울특별시'
            print(option.text,option.get_attribute('value')

    #td태그의 style속성에 display:none이 지정되어 있음. 따라서 요소명.text로는 해당 코드값 추출x
    kaptcode=chrome.find_elements_by_xpath('//tr[@id="15"]/td')[0]
    #print(kaptcode.text)
    print(kaptcode.get_attribute('title'))

except Exception as ex:
    print(ex, sys.exc_info()[-1].tb_lineno)
finally:
    #chrome.quit()
    pass