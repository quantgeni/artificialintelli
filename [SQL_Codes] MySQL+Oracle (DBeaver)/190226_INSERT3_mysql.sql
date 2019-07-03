-- 서울 우편번호 : zipcode_seoul
create table Zipcode_seoul (
우편번호		varchar(20),
시도			varchar(20),		
시군구			varchar(20),	
읍면			varchar(30),	
도로명			varchar(30),
건물번호본번	int,
건물번호부번	int,
시군구용건물명	varchar(30),
법정동명		varchar(30),
리명			varchar(30),
지번본번		int
);

select count(우편번호) from Zipcode_seoul;
# 569,443
-- select * from Zipcode_seoul;

-- 하계올림픽 메달리스트 : summer_medals
create table Summer_medals (
Yearr		int,
City		varchar(30),
Sport		varchar(30),
Discipline	varchar(30),
Athlete		varchar(70),
Country		varchar(30),
Gender		varchar(20),
Event		varchar(50),
Medal		varchar(50)
);

-- 오픈북 실기--------------------------------------------------------
create table 회원 (
회원아이디	varchar(20)	primary key	not null,
비밀번호	varchar(20)	not null,
이름		varchar(10)	not null,
나이		int,
직업		varchar(20),
등급		varchar(10)	not null,
적립금		int			not null default 0,
check (나이 >= 0)
);

create table 상품 (
상품번호	varchar(20) primary key,
상품명		varchar(30),
재고량		int,
단가		int,
제조업체명	varchar(30),
공급일자	date,
공급량		int
);

create table 제조업체 (
제조업체명	varchar(30)	primary key,
전화번호	varchar(30),
위치		varchar(30),
담당자		varchar(10)
);


create table 주문 (
	회원아이디	varchar(20)	not null,
	상품번호	varchar(20),
	주문번호	varchar(20),
	주문수량	int,
	배송지		varchar(30),
	주문일자	date,
	primary key (회원아이디, 상품번호),
	foreign key (회원아이디)
		references 회원 (회원아이디),
	foreign key (상품번호)
		references 상품 (상품번호)
);



	
	



























