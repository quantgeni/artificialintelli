CREATE TABLE seoul(
Code varchar(255),
Sido varchar(255),
Sigungu varchar(255),
Eupmyeon varchar(255),
Doroname varchar(255),
Buildbon varchar(255),
Buildbu varchar(255),
Sigungubuild varchar(255),
Beobjd varchar(255),
Riname varchar(255),
Jibeonbon varchar(255)
)

load data 
local infile 'D:\william/seoul_zip.csv'
into table seoul
fields terminated by ','
optionally enclosed by '"'
ignore 1 lines;




CREATE TABLE summer_medal(
Years varchar(50),
City varchar(50),
Sport varchar(50),
Discipline varchar(50),
Athlete varchar(50),
Country varchar(50),
Gender varchar(50),
Event varchar(50),
Medal varchar(50)
);


load data local infile '/home/centos/summermedal.csv'
into table summer_medal
fields terminated by ','
optionally enclosed by '"'
ignore 1 lines;

























