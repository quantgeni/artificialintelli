SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


CREATE TABLE Books (
	bookid		NUMBER	PRIMARY KEY,
	bookname	varchar2(40),
	publisher	varchar2(40),
	price NUMBER
);


-- sequence 만들기
CREATE SEQUENCE seqbooks;
CREATE SEQUENCE seqcusts;
CREATE SEQUENCE seqords;
-- 생성한 sequence 확인
SELECT * FROM user_sequences;

SELECT * FROM user_tables;

-- 현재 시퀀스번호 확인
SELECT seqbooks.currval FROM dual;
-- 다음 시퀀스번호 확인
SELECT seqbooks.nextval FROM dual;

-- 시퀀스 삭제
DROP SEQUENCE seqbooks;
DROP SEQUENCE seqcusts;
DROP SEQUENCE seqords; 




INSERT INTO Books VALUES (seqbooks.nextval,'축구의 역사','굿스포츠',7000);
INSERT INTO Books VALUES (seqbooks.nextval,'축구아는 여자','나무수',13000);
INSERT INTO Books VALUES (seqbooks.nextval,'축구의 이해','대한미디어',22000);
INSERT INTO Books VALUES (seqbooks.nextval,'골프 바이블','대한미디어',35000);
INSERT INTO Books VALUES (seqbooks.nextval,'피겨 교본','굿스포츠',8000);
INSERT INTO Books VALUES (seqbooks.nextval,'역도 단계별기술','굿스포츠',6000);
INSERT INTO Books VALUES (seqbooks.nextval,'야구의 추억','이상미디어',20000);
INSERT INTO Books VALUES (seqbooks.nextval,'야구를 부탁해','이상미디어',13000);
INSERT INTO Books VALUES (seqbooks.nextval,'올림픽 이야기','삼성당',7500);
INSERT INTO Books VALUES (seqbooks.nextval,'Olympic Champions','Pearson',13000);

CREATE TABLE Customers (
	custid		NUMBER	PRIMARY KEY,
	name		varchar2(80),
	address		varchar2(80),
	phone		varchar2(60)
);


INSERT INTO Customers VALUES (seqcusts.nextval,'박지성','영국 맨체스타','000-5000-0001');
INSERT INTO Customers VALUES (seqcusts.nextval,'김연아','대한민국 서울','000-6000-0001');
INSERT INTO Customers VALUES (seqcusts.nextval,'장미란','대한민국 강원도','000-7000-0001');
INSERT INTO Customers VALUES (seqcusts.nextval,'추신수','미국 클리블랜드','000-8000-0001');
INSERT INTO Customers VALUES (seqcusts.nextval,'박세리','대한민국 대전',NULL);

CREATE TABLE Orders (
	orderid		NUMBER	PRIMARY KEY,
	custid		NUMBER,
	bookid		NUMBER,
	saleprice	NUMBER,
	orderdate	DATE
);

CREATE TABLE Orders (
	orderid		NUMBER	PRIMARY KEY,
	custid		NUMBER,
	bookid		NUMBER,
	saleprice	NUMBER,
	orderdate	DATE,
	FOREIGN KEY (custid) 
		REFERENCES Customers (custid)
			ON DELETE CASCADE,
	FOREIGN KEY (bookid) 
		REFERENCES Books (bookid)
			ON DELETE CASCADE
);

INSERT INTO Orders VALUES (seqords.nextval,1,1,6000,'2014-07-01');
INSERT INTO Orders VALUES (seqords.nextval,1,3,21000,'2014-07-03');
INSERT INTO Orders VALUES (seqords.nextval,2,5,8000,'2014-07-03');
INSERT INTO Orders VALUES (seqords.nextval,3,6,6000,'2014-07-04');
INSERT INTO Orders VALUES (seqords.nextval,4,7,20000,'2014-07-05');
INSERT INTO Orders VALUES (seqords.nextval,1,2,12000,'2014-07-07');
INSERT INTO Orders VALUES (seqords.nextval,4,8,13000,'2014-07-07');
INSERT INTO Orders VALUES (seqords.nextval,3,10,12000,'2014-07-08');
INSERT INTO Orders VALUES (seqords.nextval,2,10,7000,'2014-07-09');
INSERT INTO Orders VALUES (seqords.nextval,3,8,13000,'2014-07-10');




-- 도서------------------------------------------------ 위는 bigdata DB, 아래는 hr DB
-- 일련번호 자동 생성을 위해 auto_increment 속성을 사용. 단, PRIMARY KEY 제약조건이 설정된 칼럼에만 가능함
-- DEFAULT CURRENT_TIMESTAMP를 설정

CREATE TABLE Books (
	bookid		int 		PRIMARY KEY AUTO_INCREMENT,
	bookname	varchar(25),
	publisher	varchar(10),
	price int,
	regdate datetime DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Books
(bookname, publisher, price)
VALUES
('축구의 역사','굿스포츠',7000),
('축구아는 여자','나무수',13000),
('축구의 이해','대한미디어',22000),
('골프 바이블','대한미디어',35000),
('피겨 교본','굿스포츠',8000),
('역도 단계별기술','굿스포츠',6000),
('야구의 추억','이상미디어',20000),
('야구를 부탁해','이상미디어',13000),
('올림픽 이야기','삼성당',7500),
('Olympic Champions','Pearson',13000)
;

CREATE TABLE Customers (
	custid	int			PRIMARY KEY AUTO_INCREMENT,
	name	varchar(10),
	address	varchar(20),
	phone	varchar(15),
	regdate datetime DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Customers
(name, address, phone)
VALUES
('박지성','영국 맨체스타','000-5000-0001'),
('김연아','대한민국 서울','000-6000-0001'),
('장미란','대한민국 강원도','000-7000-0001'),
('추신수','미국 클리블랜드','000-8000-0001'),
('박세리','대한민국 대전',NULL)
;


CREATE TABLE Orders (
	orderid		int				PRIMARY KEY AUTO_INCREMENT,
	custid		int,
	bookid		int,
	saleprice	int,
	orderdate	datetime,
FOREIGN KEY (custid)
	REFERENCES Customers (custid),
FOREIGN KEY (bookid)
	REFERENCES Books (bookid)
);

INSERT INTO Orders
(custid, bookid, saleprice, orderdate)
VALUES
(1,1,6000,'2014-07-01'),
(1,3,21000,'2014-07-03'),
(2,5,8000,'2014-07-03'),
(3,6,6000,'2014-07-04'),
(4,7,20000,'2014-07-05'),
(1,2,12000,'2014-07-07'),
(4,8,13000,'2014-07-07'),
(3,10,12000,'2014-07-08'),

select * from Books,Customers,Orders;
(2,10,7000,'2014-07-09'),
(3,8,13000,'2014-07-10')
;




-- 오라클..
SELECT '안녕하세요',
vsize('안녕하세요') 바이트수,
length('안녕하세요') 문자길이,
lengthb('안녕하세요') 바이트수
FROM dual;



-- MariaDB에서는 
-- length(), char_length()
-- bit_length() 함수 등으로
-- 문자 길이 확인 가능


select * from EMPLOYEES where JOB_ID like 'IT_PROG'

select * from EMPLOYEES where LAST_NAME like 'H%'



CREATE TABLE empdept (
LAST_NAME varchar2(100),
FIRST_NAME varchar2(100),
DEPARTMENT_ID varchar2(100),
JOB_ID varchar2(100),
SALARY varchar2(100)
);

CREATE TABLE semiweathers (
tmef varchar(50),
wf varchar(50)
);


select * from summer_medals where City='Seoul' and Medal='Gold'

select * from summer_medals where Athlete like 'GAO%'


select * from seoulmedal where Athlete like 'GAO%'

select * from seoulmedal where Athlete like 'GAO%'





create table test1(
select years,city,sport,discipline, concat(concat('\"',athlete),'\"'),country,gender,event,medal from summer_medals where City='Seoul' and Medal='Gold'
)

create table test2(
select * from test1
)

select * from test1;
select * from test2

create table test3(
select years,city,sport,discipline, concat(concat('"',athlete),'"'),country,gender,event,medal from summer_medals where City='Seoul' and Medal='Gold'
);
select * from test3;


create table test4(
select years,city,sport,discipline, athlete,country,gender,event,medal from summer_medals where City='Seoul' and Medal='Gold'
);

create table test5(
select * from test4
);
select * from test5


create table test7(
select years,city,sport,discipline, concat(concat("'",athlete),"'"),country,gender,event,medal from summer_medals where City='Seoul' and Medal='Gold'
);
select * from test7;









CREATE TABLE seoulmedal2 (
Years varchar(80),
City varchar(80),
Sport varchar(80),
Discipline varchar(80),
Athlete varchar(150),
Country varchar(80),
Gender varchar(80),
Event varchar(80),
Medal varchar(80)
);



