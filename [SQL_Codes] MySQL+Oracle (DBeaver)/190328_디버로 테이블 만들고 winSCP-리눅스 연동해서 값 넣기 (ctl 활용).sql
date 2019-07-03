

CREATE TABLE summer_medal(
Years varchar2(50),
City varchar2(50),
Sport varchar2(50),
Discipline varchar2(50),
Athlete varchar2(50),
Country varchar2(50),
Gender varchar2(50),
Event varchar2(50),
Medal varchar2(50)
)

/* 이건 winSCP 내 ctl 파일 내 입력
OPTIONS(skip=1)
load data infile
'/home/centos/summermedal.csv'
into table summer_medal
fields terminated by ','
optionally enclosed by '"'
(Years,City,Sport,Discipline,Athlete,Country,Gender,Event,Medal)*/

우편번호,시도,시군구,읍면,도로명,건물번호본번,건물번호부번,시군구용건물명,법정동명,리명,행정동명,지번본번,지번부번
우편번호,시도,시군구,읍면,도로명,건물번호본번,건물번호부번,시군구용건물명,법정동명,리명,행정동명,지번본번,지번부번

CREATE TABLE zipcode_seoul(
Code varchar2(255),
Sido varchar2(255),
Sigungu varchar2(255),
Eupmyeon varchar2(255),
Doroname varchar2(255),
Buildbon varchar2(255),
Buildbu varchar2(255),
Sigungubuild varchar2(255),
Beobjd varchar2(255),
Riname varchar2(255),
Jibeonbon varchar2(255)
)



SELECT count(*) FROM zipcode_seoul WHERE beobjd='개포동';

SELECT count(beobjd) FROM zipcode_seoul WHERE beobjd='개포동'




CREATE TABLE iris(
SepalLength	NUMBER,
SepalWidth	NUMBER,
PetalLength	NUMBER,
PetalWidth	NUMBER,
Species		VARCHAR2(75)
);


. /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
sqlldr control='/home/centos/iris.ctl' log='iris.log'





