-- 데이터 삽입 : INSERT ---------------------------

-- 고객관리-----------------------------------------------------
-- Customers
insert into Customers 
(cuid, cname, age, grade, job, mileage)
values 
('apple', '정소화', 20, 'gold', '학생', 1000),
('banana', '김선우', 25, 'vip', '간호사', 2500),
('carrot', '고명석', 28, 'gold', '교사', 4500),
('orange', '김용욱', 22, 'silver', '학생', 0),
('melon', '성원용', 35, 'gold', '회사원', 5000),
('peach', '오형준', NULL, 'silver', '의사', 300),
('pear', '채광주', 31, 'silver', '회사원', 500)
;

-- Products
insert into Products
(prdno, prdname, stock, price, maker)
values
('p01', '그냥만두', 5000, 4500, '대한식품'),
('p02', '매운쫄면', 2500, 5500, '만국푸드'),
('p03', '쿵떡파이', 3600, 2600, '한빛제과'),
('p04', '맛난초콜릿', 1250, 2500, '한빛제과'),
('p05', '얼큰라면', 2200, 1200, '대한식품'),
('p06', '통통우동', 1000, 1550, '만국푸드'),
('p07', '달콤비스킷', 1650, 1500, '한빛제과')
;

-- Orders
insert into Orders
(ordno, cuid, prdno, amount, addr, orddate)
values
('o01', 'apple', 'p03', 10, '서울시 마포구', '2019-01-01'),
('o02', 'melon', 'p01', 5, '인천시 계약구', '2019-01-10'),
('o03', 'banana', 'p06', 45, '경기도 부천시', '2019-01-11'),
('o04', 'carrot', 'p02', 8, '부산시 금정구', '2019-02-01'),
('o05', 'melon', 'p06', 36, '경기도 용인시', '2019-02-20'),
('o06', 'banana', 'p01', 19, '충청북도 보은군', '2019-03-02'),
('o07', 'apple', 'p03', 22, '서울시 영등포구', '2019-03-15'),
('o08', 'pear', 'p02', 50, '강원도 춘천시', '2019-04-10'),
('o09', 'banana', 'p04', 15, '전라남도 목포시', '2019-04-11'),
('o10', 'carrot', 'p03', 20, '경기도 안양시', '2019-05-22')
;

-- 학사관리------------------------------------------------
insert into Students 
(stdno, name, addr, age, birth, mjname, prof, mttime)
VALUES
(201350050,'김태희','경기도 고양시',25,'1985.3.22','컴퓨터공학',504,'목 2교시'),
(201250006,'송혜교','서울 영등포구',22,'1988.9.17','컴퓨터공학',301,'월 3교시'),
(201252110,'전지현','경기도 의정부시',24,'1986.4.30','의상디자인',445,'화 4교시'),
(201351010,'수지','서울 성북구',20,'1988.7.13', '식품영양', 556,'금 7교시'),
(201353011,'아이유','경기도 천안시',21,'1987.2.25','철학',504,'수 6교시');

insert into Majors
(mjname, tel, office, prof, mkdate)
VALUES
('컴퓨터공학','123-4567-8901','E동 2층',504,'2007년'),
('의상디자인','234-5678-9012','A동 1층',301,'2009년'),
('식품영양','345-6789-0123','F동 8층',556,'2006년'),
('철학','456-7890-1234','Z동 25층',504,'2000년');

insert into Subjects
(subjno, subjname, summary, prof)
VALUES
('0205','프로그래밍','자바 프로그래밍', 301),
('0211','드레스 코드','옷 입기의 기초', 445),
('5029','생활의 참견','음식의 영양', 556),
('4111','악마의 사도','종교와 철학, 과학의 얽힘', 504);

insert into Professors
(prof, name, major)
VALUES
(301,'이순신','프로그래밍'),
(445,'정약용','의상디자인'),
(556,'김유신','식품영양'),
(504,'이성계','철학');

insert into Sections
(prof, sec)
VALUES
(504,1),
(301,3),
(556,1),
(504,4);

insert into Registers
(stdno, subjno)
VALUES
(201250006,'0205'),
(201252110,'0211'),
(201351010,'5029'),
(201353011,'4111');

insert into Techs
(prof, tech)
VALUES
(445,'의상디자인 산업기사'),
(556,'식품영양 기능사'),
(301,'OCJP, 정보처리기사');


-- 도서------------------------------------------------
-- 일련번호 자동 생성을 위해 auto_increment 속성을 사용. 단, PRIMARY KEY 제약조건이 설정된 칼럼에만 가능함
-- DEFAULT CURRENT_TIMESTAMP를 설정

CREATE TABLE Bookss (
	bookid		int 		PRIMARY KEY AUTO_INCREMENT,
	bookname	varchar(25),
	publisher	varchar(10),
	price int,
	regdate datetime DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Bookss
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

CREATE TABLE Customerss (
	custid	int			PRIMARY KEY AUTO_INCREMENT,
	name	varchar(10),
	address	varchar(20),
	phone	varchar(15),
	regdate datetime DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Customerss
(name, address, phone)
VALUES
('박지성','영국 맨체스타','000-5000-0001'),
('김연아','대한민국 서울','000-6000-0001'),
('장미란','대한민국 강원도','000-7000-0001'),
('추신수','미국 클리블랜드','000-8000-0001'),
('박세리','대한민국 대전',NULL)
;


CREATE TABLE Orderss (
	orderid		int				PRIMARY KEY AUTO_INCREMENT,
	custid		int,
	bookid		int,
	saleprice	int,
	orderdate	datetime,
FOREIGN KEY (custid)
	REFERENCES Customerss (custid),
FOREIGN KEY (bookid)
	REFERENCES Bookss (bookid)
);

INSERT INTO Orderss
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
(2,10,7000,'2014-07-09'),
(3,8,13000,'2014-07-10')
;




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
(2,10,7000,'2014-07-09'),
(3,8,13000,'2014-07-10')
;


























