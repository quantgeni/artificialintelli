-- 오라클 기본 테이블 : dual 테이블
-- 사용자가 함수의 실행결과를 확인할 때
-- 지정하는 테이블 
-- 주로 함수의 사용법을 익힐 때 사용함
select ABS(123) from books; -- 이건 1개 이상 반복 출력.. (books 테이블 행수만큼)
-- 함수는 대부분 단일행 함수임. 따라서 함수를 실행하면 결과는 단 하나만 출력(되는게 맞음)
-- 따라서 오라클에서는 이런 이유로 산술연산만을 위한 테이블 기본 제공
-- => dual 테이블 (dummy 칼럼만 존재). dummy 칼럼은 varchar2(1) 형식으로 정의.
--    실제값은 X라는 문자 하나만 저장

SELECT * FROM dual;
select ABS(price) from books;

select ABS(123) from dual;

-- -78과 +78의 절대값을 구하시오.
SELECT abs(-78), abs(78) FROM dual;


SELECT 
	round(4.875), 
	round(4.875,1), 
	round(4.875,2)
FROM dual;

-- 고객 별 평균 주문 금액을 백원단위로 반올림한 값을 구하시오
SELECT 
	CUSTID, 
	avg(SALEPRICE),
	round(avg(SALEPRICE)),
	round(avg(SALEPRICE),-1),
	round(avg(SALEPRICE),-2)
FROM ORDERS
GROUP BY CUSTID
;

-- 반올림x, 절삭
SELECT 
	trunc(4.875),
	trunc(4.875, 1),
	trunc(4.875, 2),
	trunc(411.875, -1),
	trunc(411.875, -2)
FROM dual;


-- 무조건 올린값 : ceil vs. round
-- 무조건 내린값 : floor
SELECT 
	ceil(4.875),
	ceil(0.1234),
	ceil(-4.567),
	ceil(-0.987),
	round(4.875),
	round(0.1234),
	round(-4.567),
	round(-0.987),
	floor(4.875),
	floor(0.1234),
	floor(-4.567),
	floor(-0.987)
FROM dual;

-- 총 게시물이 17개이고, 페이지당 게시물 수는 5개라 할 때 총 몇개 페이지 필요?
SELECT 17/5, round(17/5), ceil(17/5) FROM dual;
-- ceil로 해야 함

-- 기타 숫자함수
SELECT 
	log(10,100),
	sqrt(16),
	power(2,3)
FROM dual;

-- 나머지 구하기
SELECT
	10/3,
	mod(10,3)
FROM dual;











-- 오라클 내장 함수

-- 