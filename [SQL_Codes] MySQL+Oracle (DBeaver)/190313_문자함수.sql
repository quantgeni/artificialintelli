-- '오라클', '마리아디비'라는 문자열을 하나로 연결해서 출력하세요

SELECT 
	concat('오라클','마리아디비'),
	'오라클'||'마리아디비',
	'오라클'||' '||'마리아디비',
	concat('오라클 ','마리아디비')
FROM dual;


SELECT 
	initcap('hello, world!!'),
	upper('hello, world!!'),
	lower('HELLO, WORLD!!')
FROM dual;

-- '  abc123  ' 문자열 공백 제거 출력
SELECT 
	'|  abc123  |',
	concat('|',trim('  abc123  ')),
	concat('|',ltrim('  abc123  ')),
	concat(rtrim('  abc123  '),'|')
FROM dual;


-- 'xxabc123yyzz'라는 문자열에서 x 또는 y 또는 z 제거하고 출력
SELECT 
	'xxabc123yyzz',
	trim(leading 'x' FROM 'xxabc123yyzz'),
	trim(leading 'x' FROM 'xaabc123yyzz'),
	trim(leading 'x' FROM 'xaxabc123yyzz'),
	trim(leading 'x' FROM 'axaxabc123yyzz'),
	trim(trailing 'x' FROM 'xxabc123yyzz'),
	trim(trailing 'y' FROM 'xxabc123yyzz'),
	trim(BOTH 'z' FROM 'xxabc123yyzz')
FROM dual;


-- 'hello, world!!' 문자열에서 
-- world 문자열을 oracle로 바꾸어 출력

SELECT	
	'hello, world!!',
	replace('hello, world!!','world','oracle'),
	replace('hello, world!!','world'), -- 3번 째 생략 시 null
	replace('hello, world!!','world','')
FROM dual;

-- 'hello, world!!' 문자열에서 
-- world 문자열만 출력

SELECT 
	'hello, world!!',
	substr('hello, world!!',8,5),
	substr('hello, world!!',8,6),
	substr('hello, world!!',8,7),
	replace('hello, world!!','hello'),
	replace('hello, world!!','hello, ')
FROM dual;



-- '123456-1234567' 이라는 주민번호에서
-- 성별 의미 문자열 출력

SELECT 
	'123456-1234567',
	substr('123456-1234567',8,1)
FROM dual;

-- a, A, 0 문자의 ascii 코드값 출력
SELECT 
	ascii('a'),
	ascii('A'),
	ascii('0')
FROM dual;

-- 십진수 97,65,48에 대한 문자를 출력
SELECT
	chr(97),
	chr(65),
	chr(48)
FROM dual;


-- '안녕하세요'라는 문자열의 길이와 바이트수 출력
-- 여기에서 한글은 1글자당 3바이트 차지한다는 것을 알 수 있음
SELECT
	'안녕하세요',
	LENGTH('안녕하세요'),
	LENGTHB('안녕하세요'),
	vsize('안녕하세요')
FROM dual;

-- 'CORPORATE FLOOR'라는 문자열에서 3번째에서 시작해서 2번째 OR이 나타나는 자리수 출력
SELECT
	instr('CORPORATE FLOOR','OR',1,1) "1",
	instr('CORPORATE FLOOR','OR',1,2) "2",
	instr('CORPORATE FLOOR','OR',1,3) "3",
	instr('CORPORATE FLOOR','OR',3,2) "4",
	instr('CORPORATE FLOOR','OR',5,2) "5"
FROM dual;

-- 2번째 AT가 나타나는 위치?
-- instr(문자열,찾을문자,시작위치,번째[빈도])
-- ★목표 : 위치적 좌표만 찍고 싶은 것 (distance 개념이 아닌)
SELECT
	instr('CONGRATULATIONS','AT',1,1) "1",
	instr('CONGRATULATIONS','AT',1,2) "2",
	instr('CONGRATULATIONS','AT',6,2) "3",
	instr('CONGRATULATIONS','AT',7,2) "4",
	instr('CONGRATULATIONS','AT',-1,1) "5",
	instr('CONGRATULATIONS','AT',-1,2) "6",
	instr('CONGRATULATIONS','AT',-7,2) "7",
	instr('CONGRATULATIONS','AT',-7,1) "8"
FROM dual;

SELECT
	instr('stress','s',1,1),
	instr('stress','s',1,2),
	instr('stress','s',1,3),
	instr('stress','s',2,1),
	instr('stress','s',3,2),
	instr('stress','s',4,3),
	instr('stress','s',-1,1),
	instr('stress','s',-1,2),
	instr('stress','s',-1,3)
FROM dual;


SELECT bookname, replace(bookname,'야구','농구')
FROM books WHERE bookname LIKE '%야구%';

SELECT 
	bookname,
	length(bookname) 제목길이,
	lengthb(bookname) 제목바이트수
FROM BOOKS
WHERE PUBLISHER='굿스포츠';

SELECT 
	substr(name,1,1) 성, 
	count(name) 인원수
FROM CUSTOMERS
GROUP BY substr(name,1,1)
;


create table SungJuk (sjno int primary key auto_increment, ' \
' name varchar(10), kor int default 0, kor int default 0, mat int default 0, tot int default 0, mean decimal(4,1) default 0.0, ' \
' grade varchar(2), regdate datetime default current_timestamp


