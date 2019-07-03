#----------------------- 5/24일 시험 (제출자 : 유형균)

#1. 
setwd('c:/Java/data')
phones <- read.csv('phone02.csv', header=T,
                   stringsAsFactors = F)

#2
mean(phones$age) #연령 평균
median(phones$age) #연령 중앙값
mean(phones$height) #키 평균
median(phones$height) #키 중앙값
mean(phones$weight) #몸무게 평균
median(phones$weight) #몸무게 중앙값

#3
summary(phones)

#4
install.packages('sqldf')
library(sqldf)

rm(phones)
setwd('c:/Java/data')
phones <- read.csv('phone02.csv', header=T,
                   stringsAsFactors = F)

phones <- sqldf('select buyyear, round(avg(dispsize),1) average_dispsize from phones group by 1 order by 1')

buyyear <- phones$buyyear
average_dispsize <- phones$average_dispsize

plot(average_dispsize, type='b', pch=1,
     col='red', xaxt='n',
     xlab='구매시기 (연도)', 
     ylab='평균화면크기',
     main='[구매시기 & 평균화면크기 분석 (Buy-Year & Average-Display-Size Analysis)]')

axis(side=1, at=1:3, labels=buyyear, las=1, cex.axis=1.5)

#5
install.packages('sqldf')
library(sqldf)

rm(phones)
setwd('c:/Java/data')
phones <- read.csv('phone02.csv', header=T,
                   stringsAsFactors = F)

phones <- sqldf('select age, round(avg(phonetime),1) average_phonetime, 
avg(lteamount) average_lteamount from phones group by 1 order by 1')

age <- phones$age
average_phonetime <- phones$average_phonetime
average_lteamount <- phones$average_lteamount

plot(average_lteamount, type='b', pch=1,
     col='red', xaxt='n', yaxt='n',
     xlab='연령', 
     ylab='평균 데이터사용량/폰사용시간',
     main='[핸드폰 수집데이터 분석: 연령 별 평균 폰사용시간 및 평균 데이터사용량]')

lines(average_phonetime, type='b', pch=3, col='blue')
axis(side=1, at=1:16, labels=age, las=1, cex.axis=0.7)
axis(side=2, at=seq(0,1200,50), labels=seq(0,1200,50), cex.axis=0.5, las=1)

legend('topright',legend=c('평균데이터사용량','평균폰사용시간'),
       pch=c(1,3),col=c('red','blue'))