#R에 로딩된 패키지 목록

search()

#패키지에 있는 함수를 사용할 수 없는 경우
library(MASS)
detach(package:MASS)
require(doBy)

#내장된 데이터에 접근하기
head(pressure)
help(pressure)
data()

head(Cars93)
library(MASS)
head(Cars93)

#컴퓨터에 설치된 패키지 목록
library()
installed.packages()[,c("Package", "Version")]