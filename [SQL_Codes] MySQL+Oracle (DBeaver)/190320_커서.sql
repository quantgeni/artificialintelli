-- 커서cursor
-- 이전 예제에서 SELECT문의 실행결과를 하나만 처리했었음.
-- 한편, 오라클에서는 select문의 실행결과를 복수행이 전달되는 경우 cursor로 처리하도록 지원
-- 커서는 질의결과로 전달되는 복수행 집합 중 현재 읽어올 행의 위치를 가리킴.
-- 즉 여러 행 구성 결과집합에서 하나 행 읽어오려면 커서가 그것 가리키고 있어야 함

SELECT * FROM Books WHERE bookid=5; -- 단일행
-- INTO 절을 이용해서 변수에 값을 저장

vs.

SELECT * FROM Books ORDER BY price DESC; -- 복수행
-- 커서를 이용해서 한행씩 값을 출력

-- 커서에는 암시적 implicit / 명시적 explicit 커서가 존재
-- 일반적으로 암시적 커서는 단일행을 결과로 반환. 여러행을 결과로 반환하는 SQL문에는 명시적 커서를.
-- CURSOR 이름 OPEN~FETCH~CLOSE 형식으로 사용
-- 정의된 커서는 for~loop~ end loop문으로 처리
-- 커서의 속성을 제공하는 특수한 명령 :
-- => %rowcount, %notfound, %isopen


-- 예제1) 명시적 커서 + 익명 프로시저
-- insert,update,delete문 실행 시 사용

-- 익명 프로시저임
DECLARE
BEGIN
	UPDATE BOOKS
	SET bookname=bookname
	WHERE bookid=3;
	dbms_output.put_line('수정건수 :'|| SQL%rowcount); --SQL%rowcount는 업데이트 명령으로 변경(업데이트)된 행수를 알려줌!!
END;

-- 예제2) 명시적 커서 + 익명 프로시저
--  select문 실행시, 사용시
-- 커서선언->커서열기->내용가져오기->출력
-- 모든 고객의 이름을 조회
SELECT NAME FROM CUSTOMERS;


DECLARE
	NAME CUSTOMERS.NAME%TYPE;
	CURSOR CS_CUSTNAME -- 커서선언
	IS
	SELECT NAME FROM CUSTOMERS;
BEGIN
	OPEN CS_CUSTNAME; -- 커서열기
	LOOP 
		FETCH CS_CUSTNAME INTO NAME; -- 커서로부터 한행을 읽어 NAME에 저장
		EXIT WHEN CS_CUSTNAME%NOTFOUND; -- 커서에 더이상 읽을 행이 없으면 반복실행 종료
		dbms_output.put_line(NAME); -- NAME에 저장된 내용 출력		
	END LOOP;
	CLOSE CS_CUSTNAME;
END;





-- 예제3) 명시적 커서 + 익명 프로시저
-- 주문번호,주문한고객이름,주문한도서,주문금액 조회
SELECT * FROM ORDERS;
SELECT * FROM CUSTOMERS;
SELECT * FROM BOOKS;

DECLARE
	ORDERID ORDERS.ORDERID%TYPE;
	NAME CUSTOMERS.NAME%TYPE;
	BOOKNAME BOOKS.BOOKNAME%TYPE;
	SALEPRICE ORDERS.SALEPRICE%TYPE;
	CURSOR ORDERINFO -- 커서선언
	IS
	SELECT o.ORDERID,c.NAME,b.BOOKNAME,o.SALEPRICE FROM ORDERS o
	JOIN CUSTOMERS c USING (CUSTID) JOIN BOOKS b USING (BOOKID) ORDER BY ORDERID;
BEGIN
	OPEN ORDERINFO; -- 커서열기
	LOOP 
		FETCH ORDERINFO INTO ORDERID,NAME,BOOKNAME,SALEPRICE; -- 커서로부터 한행을 읽어 NAME에 저장
		EXIT WHEN ORDERINFO%NOTFOUND; -- 커서에 더이상 읽을 행이 없으면 반복실행 종료
		dbms_output.put_line(ORDERID||'/'||NAME||'/'||BOOKNAME||'/'||SALEPRICE); -- NAME에 저장된 내용 출력		
	END LOOP;
	CLOSE ORDERINFO;
END;


-- 예제4) 명시적 커서
-- 부서번호 80번인 사원들 성, 직책 조회
-- 저장 프로시저 이름 : deptid80
SELECT LAST_NAME,JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID=80;


CREATE OR REPLACE PROCEDURE deptid80
IS 
	LNAME			EMPLOYEES.LAST_NAME%TYPE;
	JOBID			EMPLOYEES.JOB_ID%TYPE;
	CURSOR	EMPINFO80
	IS
	SELECT LAST_NAME,JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID=80;
BEGIN 
	OPEN EMPINFO80;
	LOOP
		FETCH EMPINFO80 INTO LNAME,JOBID;
		EXIT WHEN EMPINFO80%NOTFOUND;
		dbms_output.put_line(LNAME||'/'||JOBID);
	END LOOP;
	CLOSE EMPINFO80;
END;


BEGIN
	deptid80;
END;



-- 예제5) 명시적 커서
-- 직책이 sa_rep인 사원들 성,직책,부서명 조회
-- 저장 프로시저 이름 : job_sarep

SELECT e.LAST_NAME,e.JOB_ID,d.DEPARTMENT_NAME 
FROM EMPLOYEES e JOIN DEPARTMENTS d USING (DEPARTMENT_ID) WHERE JOB_ID='SA_REP';


CREATE OR REPLACE PROCEDURE job_sarep
IS 
	LNAME			EMPLOYEES.LAST_NAME%TYPE;
	JOBID			EMPLOYEES.JOB_ID%TYPE;
	DNAME			DEPARTMENTS.DEPARTMENT_NAME%TYPE;
	CURSOR	EMPINFO
	IS
	SELECT e.LAST_NAME,e.JOB_ID,d.DEPARTMENT_NAME 
	FROM EMPLOYEES e JOIN DEPARTMENTS d USING (DEPARTMENT_ID) WHERE JOB_ID='SA_REP';
BEGIN 
	OPEN EMPINFO;
	LOOP
		FETCH EMPINFO INTO LNAME,JOBID,DNAME;
		EXIT WHEN EMPINFO%NOTFOUND;
		dbms_output.put_line(LNAME||'/'||JOBID||'/'||DNAME);
	END LOOP;
	CLOSE EMPINFO;
END;


BEGIN
	job_sarep;
END;







-- 예제6) 커서에 매개변수 사용하기





