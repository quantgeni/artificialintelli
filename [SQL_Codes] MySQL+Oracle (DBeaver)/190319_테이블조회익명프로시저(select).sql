-- 테이블 조회 익명 프로시저
-- SELECT 컬럼 into 변수명 FROM 테이블
-- WHERE 조건
-- 주의 : 결과값은 반드시 단일행 형태이어야 함

-- * 도서번호가 1인 도서의 이름을 조회
DECLARE
	bkname VARCHAR2(20);
BEGIN
	SELECT bookname 
	INTO bkname 
	FROM BOOKS
	WHERE bookid=1;

	dbms_output.put_line(bkname);
END;

-- * 회원번호가 3인 회원 이름, 주소 조회
DECLARE
	name VARCHAR2(12);
	addr VARCHAR2(30);
BEGIN
	SELECT 
		name,
		address 
	INTO name, addr
	FROM CUSTOMERS
	WHERE custid=3;
	dbms_output.put_line(name||'/'||addr);
END;



-- * 주문테이블 이용해서 최소주문액,최대주문액,평균주문액,총주문액,주문건수 출력

DECLARE
	minord	NUMBER;
	maxord	NUMBER;
	mnord	NUMBER(10,2);
	tlord	NUMBER;
	ctord	NUMBER;
BEGIN
	SELECT 
		MIN(SALEPRICE),
		MAX(SALEPRICE),
		AVG(SALEPRICE),
		SUM(SALEPRICE),
		COUNT(ORDERID)
	INTO 
		minord,
		maxord,
		mnord,
		tlord,
		ctord
	FROM orders;
	dbms_output.put_line(minord||'/'||maxord||'/'||mnord||'/'||tlord||'/'||ctord);
	dbms_output.put_line(TO_CHAR(minord,'l000,009'));
END;

-- 성이 Kochchar인 사원 급여 등급
-- 15000 ~ 10000 ~ 5000 ~ 0
-- 초과    우수    보통  최저

DECLARE
	fname	VARCHAR2(50);
	lname	VARCHAR2(50);
	slry	NUMBER(30,2);
	grd		VARCHAR2(10);
BEGIN
	SELECT                     -- select 조회한 결과값이 1튜플이어야 함. 2튜플 이상인 경우 각 1개 변수에 넣을 수 없음!!
		FIRST_NAME,
		LAST_NAME,
		SALARY 
	INTO
		fname,
		lname,
		slry
	FROM employees 
	WHERE LAST_NAME='Kochhar';

	IF slry >= 15000 THEN grd:='초과';
	ELSIF slry >= 10000 THEN grd:='우수';
	ELSIF slry >= 5000 THEN grd:='보통';
	ELSE grd:='최저';
	END IF;

	dbms_output.put_line(fname||'/'||lname||'/'||slry||'/'||grd);
END;


-- 성이 Kochchar인 사원 급여 등급
-- (10관리부, 20마케팅, 30구매부, 90행정부, 100재경부) 출력
DECLARE
	fname	VARCHAR2(50);
	lname	VARCHAR2(50);
	did		NUMBER(10);
	dname	VARCHAR2(10);
BEGIN
	SELECT 
		FIRST_NAME,
		LAST_NAME,
		DEPARTMENT_ID
	INTO
		fname,
		lname,
		did
	FROM employees 
	WHERE LAST_NAME='Kochhar';

	IF did = 10 THEN dname:='관리부';
	ELSIF did = 20 THEN dname:='마케팅';
	ELSIF did = 30 THEN dname:='구매부';
	ELSIF did = 90 THEN dname:='행정부';
	ELSIF did = 100 THEN dname:=' 재경부';
	END IF;

	dbms_output.put_line(fname||'/'||lname||'/'||dname);
END;






