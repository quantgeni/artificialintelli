DROP TABLE members;
-- 회원정보 테이블
-- 회원번호 userno, 주키
-- 회원아이디 userid, 가변문자18
-- 회원비밀번호 passwd, 가변문자18
-- 회원이름 usernm, 가변문자12
-- 회원이메일 usereml, 가변문자25
-- 회원가입일 regdate, 날짜, 현재날짜 기본값

CREATE TABLE members (
userno 	NUMBER(6)	PRIMARY KEY,
userid 	VARCHAR2(18)	NOT NULL,
passwd	VARCHAR2(18),
usernm	VARCHAR2(12),
usereml	VARCHAR2(25),
regdate	DATE DEFAULT SYSDATE
);

CREATE SEQUENCE seqmbm;

INSERT INTO members (userno, userid, passwd, usernm, usereml)
VALUES 
(seqmbm.nextval,'abc','123','홍길동','abc@xyz.com');

SELECT userid,passwd
FROM members;




