OPTIONS(skip=1)
load data infile
'/home/centos/seoul_zip.csv'
into table zipcode_seoul
fields terminated by ','
optionally enclosed by '"'
trailing nullcols
(Code,Sido,Sigungu,Eupmyeon,Doroname,Buildbon,Buildbu,Sigungubuild,Beobjd,Riname,Jibeonbon)
