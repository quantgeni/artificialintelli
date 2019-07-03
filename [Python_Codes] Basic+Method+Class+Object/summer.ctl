OPTIONS(skip=1)
load data infile
'/home/centos/summermedal.csv'
into table summer_medal
fields terminated by ','
optionally enclosed by '"'
(Years,City,Sport,Discipline,Athlete,Country,Gender,Event,Medal)