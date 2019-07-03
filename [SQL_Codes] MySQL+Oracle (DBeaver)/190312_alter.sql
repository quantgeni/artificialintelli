CREATE TABLE members (
	userno NUMBER,
	userid varchar(20),
	passwd varchar(20)
);
DESC members; DESCRIBE members;

ALTER TABLE members add(name varchar2(15));
ALTER TABLE members add(email varchar2(50));
ALTER TABLE members add(regdate DATE);
ALTER TABLE members add(age NUMBER);

ALTER TABLE members 
add(name varchar2(15), email varchar2(50), regdate DATE, age NUMBER);

ALTER TABLE members MODIFY (age NUMBER(3));
ALTER TABLE members MODIFY (regdate DATE DEFAULT SYSDATE);
-- 등록일 칼럼에 날짜/시간이 자동저장되도록 => MySQL은 TIMESTAMP, ORACLE은 SYSDATE!
-- MySQL은 DATE와 DATETIME이 구분되지만, ORACLE은 DATE도 시간까지 찍힘

ALTER TABLE members RENAME COLUMN name TO names;
ALTER TABLE members RENAME COLUMN regdate TO joindate;

-- 칼럼 제거
ALTER TABLE members DROP COLUMN names;


-- 제약조건 constraint 다루기

ALTER TABLE members MODIFY (userno NUMBER PRIMARY key); -- primary key 지정
SELECT * FROM user_constraints; -- 제약조건 조회
ALTER TABLE members DROP COLUMN userno;
ALTER TABLE members ADD (userno NUMBER);

-- 제약조건 생성
-- ALTER TABLE 테이블이름
-- ADD CONSTRAINT 제약조건이름 제약조건;


ALTER TABLE members
ADD CONSTRAINT m_pk PRIMARY KEY (userno);

SELECT * FROM user_constraints;


ALTER TABLE members
ADD CONSTRAINT m_fk FOREIGN KEY (userno)
	REFERENCES dept(userno);


ALTER TABLE members
	ADD CONSTRAINT m_ui_nn NOT NULL; -- 테이블 전체 단의 NOT NULL
ALTER TABLE members
	MODIFY (userno varchar(18) NOT NULL); -- 칼럼 단 NOT NULL
ALTER TABLE members
	MODIFY (userno varchar(18) CONSTRAINT m_ui_nn NOT NULL); -- 칼럼 단 NOT NULL
ALTER TABLE members
	ADD CONSTRAINT m_uq unique(userid);
ALTER TABLE members
	ADD CONSTRAINT m_ag_ck CHECK (age>=10 AND age<=125);

INSERT INTO members (userno, userid, age)
VALUES (1,'abc123',15);

INSERT INTO members (userno, userid, age)
VALUES (1,'abc123',7);

INSERT INTO members (userno, userid, age)
VALUES (1,'abc123','abc');


ALTER TABLE members
	ADD CONSTRAINT m_pk PRIMARY KEY (userno);
ALTER TABLE members 
	DROP CONSTRAINT m_pk;

-- 제약조건 지우지 않고 비활성화 : DISABLE CONSTRAINT 제약조건 이름 [CASCADE];
-- 제약조건 활성화 : ENABLE CONSTRAINT 제약조건 이름 [CASCADE];
ALTER TABLE members
	disable CONSTRAINT m_ag_ck;
ALTER TABLE members
	enable CONSTRAINT m_ag_ck;

-- 대량 bulk insert 문
-- load data 구문으로 외부 데이터파일의 내용을 테이블에 insert 하는 방법도 존재
-- 보통은 select문을 이용한 bulk insert 문 구현

-- 대한미디어, 이상미디어 출판사에서 출시한 도서를 newBooks 테이블에 모두 삽입

CREATE TABLE newBooks (
	bookid number(3),
	bookname varchar2(40),
	publisher varchar2(40),
	price number(7)
);

INSERT INTO newBooks
	SELECT * FROM books WHERE PUBLISHER IN ('대한미디어','이상미디어');

SELECT * FROM newBooks;



-- regexone.com 정규표현식













