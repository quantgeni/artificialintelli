-- 프로시저 PROCEDURE 
-- 익명 프로시저는 선언부에 변수를 정의하고 실행부에서 코드(로직)를 호출해서 실행.
-- 실행할때마다 컴파일 되어야 하므로 속도가 느림.
-- 다른 PL/SQL에서 호출해서 사용할 수 없음
-- => 코드 재사용 불가 (한번 실행하고 나면 메모리에서 없어지는 휘발성 코드)
--    익명프로시저 주 용도는 코드 실행 후 결과 확인 위한 테스트 목적
-- 실행한 코드를 데이터베이스에 남겨 재사용 가능케 하려면 함수나 프로시저 작성

-- 사용자정의함수. 오라클은 기본적으로 내장함수 통해 다양한 연산 기능을 제공하고 있음.
-- 한편, 사용자가 임의로 코드를 작성해서 함수로 만들 수 있음. => 사용자 정의 함수 (user defined function)
-- 함수는 매개변수(입력값)를 받아서 뭔가를 처리하고 그 결과를 반환하는 데이터베이스 객체

-- create or replace function (매개변수...)
-- return 데이터유형 
-- is
-- 함수 몸체 블럭block

-- 예제1: 인삿말을 출력하는 함수

CREATE OR REPLACE FUNCTION sayHello
RETURN varchar2
IS 
BEGIN
		RETURN 'Hello, World!!';
END;

-- 생성한 sayHello 함수 실행
SELECT sayHello FROM dual;

-- 예제2: 인삿말(Hello,????)을 출력하는 함수
-- 인사 대상을 입력받아 출력하는 함수 정의 <- 즉, 매개변수가 있음!!

CREATE OR REPLACE FUNCTION sayHello(msg varchar2)
RETURN varchar2
IS 
BEGIN
		RETURN ('Hello, '|| msg);
END;

-- 생성한 sayHello 함수 실행
SELECT sayHello('Oracle') FROM dual;


-- 예제3: 3개의 숫자를 입력받아 모두 더해서 출력하는 addPlus라는 함수

CREATE OR REPLACE FUNCTION addPlus(x NUMBER, y NUMBER, z NUMBER)
RETURN NUMBER
IS 
BEGIN
		RETURN x+y+z;
END;

SELECT addPlus(100,50,70) FROM dual;


-- 예제4: 3개의 숫자와 계산유형(+,-,x,/)를 입력받아 처리하고 출력하는 calculator(a,b,c,d)라는 함수

CREATE OR REPLACE FUNCTION calculator(a NUMBER, b NUMBER, c NUMBER, d varchar2)
RETURN NUMBER
IS 
e NUMBER;
BEGIN
		IF d='+' THEN e:=a+b+c;
		ELSIF d='-' THEN e:=a-b-c;
		ELSIF d='*' THEN e:=a*b*c;
		ELSIF d='/' THEN e:=a/b/c;
		END IF;
RETURN e;
END;

SELECT calculator(100,50,70,'*') FROM dual;




-- 사용자정의함수 실행방법 3가지!!
-- 1) select ~ from dual
-- 2) 익명 프로시저 -> dbms_out.put_line으로 함수 반환값 출력
-- 3) execute 명령 이용 -> 변수 선언해서 해당 변수에 함수 반환값 담고 결과 print

DECLARE 
BEGIN
		dbms_output.put_line(sayHello('PL/SQL!!'));
END;


variable results varchar2; -- 1회용 변수 정의
EXECUTE :results :=sayHello('PL/SQL @@');
-- 함수 실행 후 결과를 변수에 저장
print results -- 변수에 저장된 결과 출력



-- 예제5: 도서번호bookid 입력하면 도서정보 출력하는 showBookInfo 함수

CREATE OR REPLACE FUNCTION showBookInfo(bkid NUMBER) -- 카멜 표기법
RETURN varchar2
IS 
	bkname	varchar2(20);
	pname	varchar2(20);
	price	number;
BEGIN 
	SELECT 
	bookname,
	publisher,
	price
	INTO 
	bkname,
	pname,
	price 
	FROM BOOKS
	WHERE bookid = bkid;	
	RETURN	(bkname||'/'||pname||'/'||price);
END;

SELECT showBookInfo(1) FROM dual;


-- %type을 이용한 변수 자료형 정의
-- 테이블명, 컬럼명 %type
-- solid 원칙 지켜야 함. 코드 변화를 주더라도 영향 최소화 => 응집도. "응집도 최소화"
CREATE OR REPLACE FUNCTION showBookInfo(bkid BOOKS.BOOKID%TYPE) -- 카멜 표기법
RETURN varchar2
IS 
	bkname	BOOKS.BOOKNAME%TYPE;
	pname	BOOKS.PUBLISHER%TYPE;
	price	BOOKS.PRICE%TYPE;
BEGIN 
	SELECT 
	bookname,
	publisher,
	price
	INTO 
	bkname,
	pname,
	price 
	FROM BOOKS
	WHERE bookid = bkid;	
	RETURN	bkname||'/'||pname||'/'||price;
END;

SELECT showBookInfo(5) FROM dual;





-- 예제6: 국/영/수 성적 입력 시 총점/평균/학점 계산 후 화면에 출력하고
-- sungjuk 테이블에 계산한 결과를 저장하는 newSungJuK 함수 저장

CREATE OR REPLACE FUNCTION 
		newSungJuK(name SUNGJUK.NAME%TYPE, 
				kor SUNGJUK.KOR%TYPE, 
				eng SUNGJUK.ENG%TYPE, 
				mat SUNGJUK.MAT%TYPE) -- 카멜 표기법
RETURN varchar2
IS 
	tot		SUNGJUK.TOT%TYPE;
	mean	SUNGJUK.MEAN%TYPE;
	grd		SUNGJUK.GRD%TYPE;
	results varchar2(100);
BEGIN 
	tot:=kor+eng+mat;
	mean:=tot/3;

/* 이거 불가
	CASE WHEN mean>=90 THEN grd:='수';
	   	WHEN mean>=80 THEN grd:='우';
	   	WHEN mean>=70 THEN grd:='미';
	   	WHEN mean>=60 THEN grd:='양';
	   	ELSE grd:='가';
	END CASE;
	INSERT INTO SUNGJUK
	(sjno,name,kor,eng,mat,tot,mean,grd)
	VALUES
	(1,name,kor,eng,mat,tot,mean,grd);
*/
	results:=name||'/'||kor||'/'||eng||'/'||mat||'/'||tot||'/'||mean||'/'||grd;
RETURN results;
END;

SELECT newSungJuk('수지',78,89,65) FROM dual;


--예제7. 
CREATE OR REPLACE FUNCTION showBookInfo(bkid NUMBER) -- 카멜 표기법
RETURN varchar2
IS 
	bkname	varchar2(20);
	pname	varchar2(20);
	price	number;
BEGIN 
	IF bkid>10 THEN RETURN '존재하지 않는 도서입니다';
	END IF;
	SELECT 
	bookname,
	publisher,
	price
	INTO 
	bkname,
	pname,
	price 
	FROM BOOKS
	WHERE bookid = bkid;	
	RETURN	bkname||'/'||pname||'/'||price;
END;

SELECT showBookInfo(11) FROM dual;


-- RETURN의 또다른 용도: 일반적으로 연산 수행 후 결과 전달 위해 사용. 
-- 한편 일정시점 코드 실행 중지하고 해당 명령문에서 벗어나기 위해(종료) 사용하기도 함


------ 시험! 3/22일

--1

CREATE OR REPLACE FUNCTION show_emp_dept_count -- 카멜 표기법
RETURN NUMBER
IS 
	deptcnt NUMBER;
BEGIN 
	SELECT 
	COUNT(DISTINCT DEPARTMENT_ID)
	INTO 
	deptcnt
	FROM EMPLOYEES;
	RETURN	deptcnt;
END;

SELECT show_emp_dept_count FROM dual;






--2 


CREATE OR REPLACE PROCEDURE show_emp_john
IS 
	eid			EMPLOYEES.EMPLOYEE_ID%TYPE;
	jid			EMPLOYEES.JOB_ID%TYPE;
	slry		EMPLOYEES.SALARY%TYPE;
	CURSOR	EMPINFO
	IS
	SELECT EMPLOYEE_ID,JOB_ID,SALARY FROM EMPLOYEES WHERE first_name='John';
BEGIN 
	OPEN EMPINFO;
	LOOP
		FETCH EMPINFO INTO eid,jid,slry;
		EXIT WHEN EMPINFO%NOTFOUND;
		dbms_output.put_line(eid||'/'||jid||'/'||slry);
	END LOOP;
	CLOSE EMPINFO;
END;


BEGIN
	show_emp_john;
END;



--3.
CREATE OR REPLACE PROCEDURE show_emp_dept
IS 
	eid			EMPLOYEES.EMPLOYEE_ID%TYPE;
	ename		EMPLOYEES.FIRST_NAME%TYPE;
	jid			EMPLOYEES.JOB_ID%TYPE;
	dname		DEPARTMENTS.DEPARTMENT_NAME%TYPE;
	loc			LOCATIONS.CITY%TYPE;
	CURSOR	EMPINFORM
	IS
	SELECT e.EMPLOYEE_ID,e.FIRST_NAME,e.JOB_ID,d.DEPARTMENT_NAME,l.CITY 
	FROM EMPLOYEES e JOIN DEPARTMENTS d USING(DEPARTMENT_ID) JOIN LOCATIONS l USING(LOCATION_ID);
BEGIN 
	OPEN EMPINFORM;
	LOOP
		FETCH EMPINFORM INTO eid,ename,jid,dname,loc;
		EXIT WHEN EMPINFORM%NOTFOUND;
		dbms_output.put_line(eid||'/'||ename||'/'||jid'/'||dname'/'||loc);
	END LOOP;
	CLOSE EMPINFORM;
END;


BEGIN
	show_emp_dept;
END;


	SELECT e.EMPLOYEE_ID,e.FIRST_NAME,e.JOB_ID,d.DEPARTMENT_NAME,l.CITY 
	FROM EMPLOYEES e JOIN DEPARTMENTS d USING(DEPARTMENT_ID) JOIN LOCATIONS l USING(LOCATION_ID);

--4
CREATE OR REPLACE FUNCTION 
		new_sj_data(name SUNGJUK.NAME%TYPE, 
					kor SUNGJUK.KOR%TYPE, 
					eng SUNGJUK.ENG%TYPE, 
					mat SUNGJUK.MAT%TYPE) -- 카멜 표기법
RETURN varchar2
IS 
	tot		SUNGJUK.TOT%TYPE;
	mean	SUNGJUK.MEAN%TYPE;
	grd		SUNGJUK.GRD%TYPE;
	results varchar2(100);
BEGIN 
	tot:=kor+eng+mat;
	mean:=tot/3;

	results:=name||'/'||kor||'/'||eng||'/'||mat||'/'||tot||'/'||mean||'/'||grd;
RETURN results;
END;

SELECT new_sj_data('수지',78,89,65) FROM dual;









2. 'Jones'라는 사원의 사번, 직급, 급여를 출력하는 프로시져를 작성하세요.
CREATE OR REPLACE PROCEDURE show_emp_jones(name1 EMPLOYEES.LAST_NAME%type)
IS

emid  EMPLOYEES.EMPLOYEE_ID%TYPE;
jbid  EMPLOYEES.JOB_ID%TYPE;
sal   EMPLOYEES.SALARY%TYPE;

BEGIN
	SELECT EMPLOYEE_ID, JOB_ID, SALARY INTO  emid, jbid, sal FROM EMPLOYEES
	WHERE LAST_NAME = name1;
	
	dbms_output.put_line(name1 || ', ' || emid || ', ' || jbid || ', ' || sal);
END;

BEGIN
	show_emp_jones('Jones');
END;

3. 사원들의 사번, 이름, 직책, 부서명, 위치를 조회하는 프로시져를 작성하세요.

CREATE OR REPLACE PROCEDURE show_emp_dept
IS

	dpt_id  NUMBER;
	lname 	varchar2(100);
	job	  	varchar2(100);
	depname varchar2(100);
	lc		NUMBER;

CURSOR cs_dep
IS SELECT DEPARTMENT_ID, FIRST_NAME, JOB_ID, DEPARTMENT_NAME, LOCATION_ID FROM EMPLOYEES  JOIN DEPARTMENTS  using(DEPARTMENT_ID);

BEGIN
	OPEN cs_dep;
	LOOP
	FETCH cs_dep INTO dpt_id, lname, job, depname, lc;
	EXIT WHEN cs_dep%notfound;

	dbms_output.put_line(dpt_id || ', ' || lname || ', ' || job || ', ' || depname || ', ' || lc);
	
	END LOOP;
	
	CLOSE cs_dep;
END;

BEGIN
	show_emp_dept;
END;

4. 국어, 영어, 수학 점수를 입력하면 총점, 평균, 학점을 반환하는 함수를 작성하세요.

CREATE OR REPLACE FUNCTION NEW_sj_data(kor NUMBER, eng NUMBER, mat NUMBER)
RETURN varchar2
IS
tot NUMBER;
mean NUMBER;
grd varchar(10);
BEGIN
	tot := kor + eng  + mat;
	mean := tot / 3;
	IF mean >= 90 THEN grd := '수';
	ELSIF mean >= 80 THEN grd := '우'; 
	ELSIF mean >= 70 THEN grd := '미'; 
	ELSIF mean >= 60 THEN grd := '양';
	ELSE grd := '가';
	END IF;
	
	RETURN ('총점 : ' || tot || ', ' || '평균 : ' || mean || ', ' || '학점 : ' || grd );
END;

SELECT NEW_sj_data(78, 89, 97) FROM dual;

