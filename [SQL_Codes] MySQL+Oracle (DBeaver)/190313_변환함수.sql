-- 변환함수
-- 입력하려는 데이터 자료형과 저장될 칼럼 자료형이 일치하지 않는 경우
-- 형변환 통해 제대로 입력 가능

-- 숫자->문자형칼럼저장 : 성공
-- 문자->숫자형칼럼저장 : 실패
-- 문자->날짜형칼럼저장 : 장담못함
-- 단 문자를 날짜형에 저장시 국가/지역에 따라 적절한 형변환 필요

-- 문자변환 (to_char)
SELECT 
	sysdate,
	to_char(sysdate,'RR/DD/MM') "1",
	to_char(sysdate,'RR/MM/DD') "2",
	to_char(sysdate,'YYYY-MM-DD') "3",
	to_char(sysdate,'HH:MI:SS AM') "4",
	to_char(sysdate,'HH24:MI:SS') "5"
FROM dual;
-- 위는 날짜를 문자형으로 변환한 것 R은 Y 즉 연도
-- AM이건 PM이건 아무거나 써도 현재 기준으로 나옴

SELECT	
	1234,
	to_char(1234),
	substr(1234,1,1),
	1244||5678,
	concat(1234,5678)
FROM dual;
-- 숫자와 문자를 정렬 위치부터 다르다. 컴마도 그렇고.
-- 숫자는 자동으로 문자형으로 변환 (concat, substr, ||등)

SELECT 
	'1234'+'5678' 
FROM dual;
-- 문자는 연산자와 결합될때 자동으로 숫자 변환
SELECT 
	sqrt('9') 
FROM dual;

SELECT 
	123456789.1234
FROM dual;

SELECT 
	to_char(123456789.1234,'$9999999999.99') "1",
	to_char(123456789.9876,'$9999999999') "2",
	to_char(12345,'$9999999999') "3",
	to_char(12345,'$0000999999.99') "4",
	to_char(12345,'$0000000009.99') "5"
FROM dual;
-- 9 : 숫자데이터 한자리를 의미
-- 0 : 숫자데이터 한 자리를 의미,
--     공백일 시 0으로 채움


-- 날짜 변환 (to_date)
-- NLS date format에 정의된 형식을 참고함 
SELECT
	sysdate,
	TO_CHAR(sysdate) "1",
	TO_CHAR(sysdate, 'yy-mm-dd') "2",
	TO_CHAR(sysdate, 'hh24:mi:ss') "3",
	TO_CHAR(sysdate, 'hh24-mi-ss') "4",
	TO_CHAR('2018-12-25') "5",
	TO_DATE(sysdate, 'yy-mm-dd hh24-mi-ss') "6", --6번도 7번과 같이 출력 ㅋ
	TO_DATE(sysdate, 'yy-mm-dd hh24:mi:ss') "7",
	-- TO_DATE(sysdate, 'yy-mm-dd'), 오류남. DATE는 NLS date format 상 완전성 추구. 못 자름.
	TO_DATE('2018-12-25 12:35:15') "8",
	TO_DATE('19-12-25') "9"
FROM dual; 

-- 마당서점은 주문일로부터 10일 후 매출 확정. 각 주문 확정일자 구하시오
SELECT
	orderid,
	orderdate 주문일자,
	to_char(orderdate, 'YYYY-MM-DD') 주문일자2,
	orderdate+10 확정일자
FROM ORDERS;

-- 2014년 7월 7일 주문받은 도서의 주문번호,주문일,고객번호,도서번호를 모두 보이시오.
-- 단 주물일은 'yyyy-mm-dd 요일' 형태로 출력
SELECT
	ORDERID,
	CUSTID,
	BOOKID,
	ORDERDATE,
	TO_CHAR(orderdate,'yyyy-mm-dd dy') "1",
	TO_CHAR(orderdate,'yyyy-mm-dd day') "2",
	TO_CHAR(orderdate,'yyyy-mm-dd day') "3",
	TO_CHAR(orderdate,'yyyy-mon-dd day') "4",
	TO_CHAR(orderdate,'yyyy-month-dd day') "5"
FROM ORDERS
WHERE ORDERDATE='2014-07-07';

-- DBMS 서버에 설정된 현재 시간과 오늘 날짜 확인
SELECT
	SYSDATE,
	SYSTIMESTAMP,
	TO_CHAR(SYSTIMESTAMP,'yy-mm-dd')
FROM dual;

-- 날짜 처리 함수
-- 현재일 vs. 주문날짜 사이 일수, 개월수를 조회
-- 날짜 연산 시 소수점 나오면 trunc 함수로 절삭해 줌
SELECT
	ORDERDATE,
	SYSDATE-ORDERDATE 일GAP,
	MONTHS_BETWEEN(SYSDATE,ORDERDATE) 월GAP,
	(SYSDATE-ORDERDATE)/365 연GAP,
	MONTHS_BETWEEN(SYSDATE,ORDERDATE)/12 연GAP2
FROM ORDERS;

-- 주문일로부터 3개월 후 결제 확정. 각 주문 결제일자 구하시오.
SELECT 
	ORDERDATE,
	ORDERDATE+90, -- 단 3개월 후를 90으로 확정하는 것은 부정확
	ADD_MONTHS(ORDERDATE,3)
FROM ORDERS;

-- 주문일로부터 일주일 후 재고보충 확정. 각 주문 재고보충일자 구하시오.
SELECT 
	ORDERDATE,
	ORDERDATE+7
FROM ORDERS;

-- 현재일의 요일 기준 다음 주 해당 요일은 며칠인가?
 SELECT 
	SYSDATE,
	TO_CHAR(SYSDATE,'yyyy-mm-dd day') "1",
	NEXT_DAY(SYSDATE,'수요일') "2",
	NEXT_DAY(SYSDATE,'수') "3",
	NEXT_DAY(SYSDATE,4) "4",
	NEXT_DAY(SYSDATE,1) "5",
	-- NEXT_DAY(SYSDATE) "6" <- 에러
FROM ORDERS;


-- 각 주문일 기준 월말에 재고보충 확정. 각 주문 재고보충일자
SELECT
	ORDERDATE,
	LAST_DAY(ORDERDATE)
FROM ORDERS;






