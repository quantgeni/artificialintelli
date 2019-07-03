OPTIONS(skip=1)
load data infile
'/home/centos/iris.csv'
into table iris
fields terminated by ','
optionally enclosed by '"'
(SepalLength,SepalWidth,PetalLength,PetalWidth,Species)