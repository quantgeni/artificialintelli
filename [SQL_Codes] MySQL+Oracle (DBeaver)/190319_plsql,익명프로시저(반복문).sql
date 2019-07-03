-- PL/SQL
-- 데이터베이스 응용프로그램 개발에 사용하는 SQL 전용언어
-- SQL문 만으로 처리하기 어려운 문제를 해결
-- 기존 SQL문만으로 반복/비교/오류 처리 불가능
-- SQL문 자체를 보안 상 이유로 캡슐화하기 어려움

-- Oracle : PL/SQL
-- MSSQL : T-SQL

-- CREATE PROCEDURE/FUNCTION 명령으로 생성
-- 생성된 프로시저나 함수는 EXECUTE 명령으로 실행
-- 오류 발생 시 show errors 명령으로 확인

-- [프로시저 종류 3가지]
-- 익명 프로시저 : declare 문으로 시작
-- 저장 프로시저 : create procedure 문으로 시작
-- 사용자 정의 함수 : create function 문으로 시작

-- PL/SQL문의 구조: 선언부/실행부/예외처리부

-- 익명 프로시저 예
-- SET serveroutput ON -- pl/sql 출력기능 활성화

BEGIN -- pl/sql 블럭 시작
	dbms_output.put_line('Hello, World!!');
END; -- pl/sql 블럭 끝


-- 선언부 : 변수와 상수 선언
-- 이름은 30자 이내, 영문자 시작
-- name(변수는 소문자로), PI(상수는 대문자로), kor1(변수)
-- 1kor (숫자로 시작했으므로 변수x)
-- 문자/날짜는 ''로 지정해서 표시

-- 자료형: number, vachar2, date
-- %type : 테이블의 특정칼럼의 타입 참조
-- %rowtype :테이블의 모든칼럼의 타입 참조

vName varchar2(10) := '수지'; -- 변수
PI number(10,5) := 3.1415; -- 상수
POINT constant positive := 100; -- 상수

-- 익명프로시저 예2
/* DECLARE
vName varchar2(10) := '수지'; -- 변수
PI number(10,5) := 3.1415; -- 상수
POINT constant positive := 100; 
*/
DECLARE
	vName varchar2(10); -- 변수
	PI number(10,5); -- 상수
BEGIN
	vName :='수지';
	PI :='3.1415';

	dbms_output.put_line(vName);
	dbms_output.put_line(PI);
	dbms_output.put_line(vName || '/' || PI);
END;

-- 반복문 : 특정 SQL문을 반복 실행
-- while, loop, for
-- loop : 자바의 do ~while문과 비슷
--		  (조건이 맞지 않더라도 최소 한 번 반복실행)
-- 		즉, 코드 실행 후 조건검사
-- while : 자바의 while문과 비슷
-- 			즉, 먼저 조건검사 후 코드 실행
-- 		  (조건이 맞지 않으면 아예 반복실행x)

-- loop 
--		[-]
-- 		exit when [-]
-- end loop;


-- 반복문0: Hello, World!!를 10번 출력


BEGIN -- pl/sql 블럭 시작
	dbms_output.put_line('Hello, World!!');
	dbms_output.put_line('Hello, World!!');
	dbms_output.put_line('Hello, World!!');
	dbms_output.put_line('Hello, World!!');
	dbms_output.put_line('Hello, World!!');
	dbms_output.put_line('Hello, World!!');
	dbms_output.put_line('Hello, World!!');
	dbms_output.put_line('Hello, World!!');
	dbms_output.put_line('Hello, World!!');
	dbms_output.put_line('Hello, World!!');
END; -- pl/sql 블럭 끝


-- 반복문1: Hello, World!!를 10번 출력
DECLARE
	i NUMBER := 1;
BEGIN 
	LOOP
		dbms_output.put_line('Hello, World!!' || i);	
		i:=i+1;
		EXIT WHEN i>10;
	END LOOP;
END;


-- 반복문2: 현재 날짜/시간을 테이블에 10번 반복 저장


CREATE TABLE temp (
	tmpno NUMBER(6),
	today DATE
);

DECLARE
	i NUMBER(5) := 1;
BEGIN 
	LOOP
		INSERT INTO temp VALUES (i, SYSDATE);	
		i:=i+1;
		EXIT WHEN i>10; -- 조건식이 거짓일 때 반복
	END LOOP;
END;

SELECT * FROM temp;




DECLARE
	j number(5) :=1;
BEGIN
	WHILE (j <= 10) -- 조건식이 참일 동안 반복실행
	LOOP
		dbms_output.put_line('HelloWorld!!');
		j := j+1;
	END LOOP;
END;


DECLARE
	j NUMBER(5) := 1;
BEGIN 
	WHILE (j <= 10)
	LOOP
		INSERT INTO temp VALUES (j, SYSDATE);	
		j:=j+1; 
	END LOOP;
END;


SELECT * FROM temp;

-- while [...]
-- loop
-- [...]
-- end loop;

-- while, loop vs. for
-- while/loop의 경우 정확히 반복횟수를 모르고 단지 조건에 따라 반복 실행
-- 반면, for의 경우 지정한 반복횟수에 따라 반복

-- for in  시작 .. 끝
-- loop
-- [..]
-- end loop;


BEGIN
	FOR k IN 1 .. 10 -- 1과 10 사이 빈칸 필요함
	LOOP
		dbms_output.put_line(k || 'HelloWorld!!');
	END LOOP;
END;
-- 별도 변수 선언 (declare) 불요

BEGIN
	FOR k IN REVERSE  1 .. 10 -- 1과 10 사이 빈칸 필요함
	LOOP
		dbms_output.put_line(k || 'HelloWorld!!');
	END LOOP;
END;
-- 별도 변수 선언 (declare) 불요


-- 반복문 7단
BEGIN
	FOR k IN 1 .. 19
	LOOP
		dbms_output.put_line('7 * '||k||' = '||7*k);	
	END LOOP;
END;


DECLARE	
	dan number(2) := 7;
BEGIN
	FOR k IN 1 .. 19
	LOOP
		dbms_output.put_line(dan||' * '||k||' = '||dan*k);	
	END LOOP;
END;


DECLARE	
	dan number(2) := 7;
	k 	number(2) := 1;
BEGIN
	WHILE (k<=19)
	LOOP
		dbms_output.put_line(dan||' * '||k||' = '||dan*k);	
		k := k+1;
	END LOOP;
END;






