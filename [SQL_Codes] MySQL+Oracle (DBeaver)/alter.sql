

CREATE TABLE members (
	userno NUMBER,
	userid varchar(20),
	passwd varchar(20)
);

DESC members;
DESCRIBE members;


ALTER TABLE members add(name varchar2(15));
ALTER TABLE members add(email varchar2(50));
ALTER TABLE members add(regdate DATE);
ALTER TABLE members add(age NUMBER);

ALTER TABLE members 
add(name varchar2(15), email varchar2(50), regdate DATE, age NUMBER);















