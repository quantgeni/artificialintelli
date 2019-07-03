-- 서울 우편번호 : zipcode_seoul2
create table zipcode_seoul2 (
우편번호		varchar(255),
시도			varchar(255),		
시군구			varchar(255),	
읍면			varchar(255),	
도로명			varchar(255),
건물번호본번	varchar(255),
건물번호부번	varchar(255),
시군구용건물명	varchar(255),
법정동명		varchar(255),
리명			varchar(255),
행정동명		varchar(255),	
지번본번		varchar(255),
지번부번		varchar(255)
);

-- 경기도 우편번호 : zipcode_gyeonggido
create table zipcode_gyeonggido (
우편번호		varchar(255),
시도			varchar(255),		
시군구			varchar(255),	
읍면			varchar(255),	
도로명			varchar(255),
건물번호본번	varchar(255),
건물번호부번	varchar(255),
시군구용건물명	varchar(255),
법정동명		varchar(255),
리명			varchar(255),
행정동명		varchar(255),	
지번본번		varchar(255),
지번부번		varchar(255)
);

/* load data from local file into table
load data local infile 'C:/Users/curycu/workspace/test.csv' 
  into table `temp`.`temp_table` 

  character set euckr

  fields terminated by ','
  enclosed by '"'
  lines terminated by '\r\n'
  ignore 1 lines
;﻿
[출처] mysql : how to upload local file into table|작성자 Curycu */

select count(우편번호) from zipcode_seoul2;
# 569,443
-- select * from Zipcode_seoul;

-- 하계올림픽 메달리스트 : summer_medals
create table summer_medals (
Years		int,
City		varchar(255),
Sport		varchar(255),
Discipline	varchar(255),
Athlete		varchar(255),
Country		varchar(255),
Gender		varchar(255),
Event		varchar(255),
Medal		varchar(255)
);

select count(*) as total_no from summer_medals;


-- 하계올림픽 메달리스트 : winter_medals
create table winter_medals (
Years		varchar(255),
City		varchar(255),
Sport		varchar(255),
Discipline	varchar(255),
Athlete		varchar(255),
Country		varchar(255),
Gender		varchar(255),
Event		varchar(255),
Medal		varchar(255)
);

select count(*) as total_no from winter_medals;

-- 서울 생필품 가격 : seoul_daily_products
create table seoul_daily_products (
일련번호		varchar(255),
시장마트번호	varchar(255),
시장마트이름	varchar(255),
품목번호		varchar(255),
품목이름		varchar(255),
실판매규격		varchar(255),
가격			varchar(255),
년도			varchar(255),
비고			varchar(255),
점검일자		varchar(255),
시장유형코드	varchar(255),
시장유형이름	varchar(255),
자치구코드		varchar(255),
자치구이름		varchar(255)
);

select *  from seoul_daily_products;

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



	
	



























