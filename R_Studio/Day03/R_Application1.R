# 빅데이터 분석 및 시각화 실습 1
# 서울시 공공와이파이 위치정보가 담긴 wifi.csv 파일을 활용
# 작업 위치 설정 및 확인
setwd("C:/Yoongit/R_Language/R_Studio/Day03")
getwd()

# 필요한 패키지 설치 및 적용
install.packages("ggplot2")
install.packages("ggmap")
install.packages("stringr")
install.packages("dplyr")
library(ggplot2)
library(ggmap)
library(stringr)
library(dplyr)
# R Studio를 실행한 후 다음과 같은 작업을 한다.
# setwd()는 작업 할 디렉토리 위치를 설정해주는 것으로 샘플 데이터가 있는 곳을 위치로 한다.
# getwd()는 setwd()에서 작업할 위치를 잡아준 곳을 확인할 수 있다.
# 그리고 사용할 패키지를 설치 및 적용 한다.

# 파일 read및 head확인
data <- read.csv("wifi.csv", header = T, fileEncoding = "euc-kr")
head(data)
# data라는 변수에 설정했던 csv파일을 읽으며 header 옵션을 True로 설정하여 csv파일의 각 속성을 알려주는 속성명을 적용한다.
# head(data)로 각 속성을 확인해보면
# 구명, 유형, 지역명, 설치x좌표, 설치y좌표, 기관으로 ggmap을 이용한 지도에 wifi가 설치된 지역을 보기위해 지역명, x좌표, y좌표, 기관명을 다음장에 정제한다
# “invalid multibyte string at ~” 오류 발생 시 read.csv 함수의 옵션에 fileEncoding=“euc-kr” 추가 

# 필요한 열만 정제(지역명, 설치위치(위도, 경도))
data2 <-data[,c(1,4,5)]
head(data2)
# 앞서 필요한 열만 정제하기 위해 1,4,5 열만 뽑은 다음 data2 변수에 넣고 head로 확인해본다.

# data2의 열 이름 변경
names(data2) <-c("name", "lon", "lat")
head(data2)
# 정제한 데이터(data2)의 컬럼명을 name, lon, lat로 변경한다.

# 이름이 동작구인 부분만 필터링
data3 <- data2 %>% filter(
  name == "동작구"
)
# 정제한 데이터에서 name이 동작구인 부분만 필터링하여 data3 변수에 저장한다.

# qmplot 함수를 이용하며, 경도, 위도에 필요한 데이터는 data3를 이용하고, maptype은 toner-lite,
# 지도에 표기할 와이파이 지점의 점은 빨간색으로 표기
qmplot(lon, lat, data = data3, maptype = "toner-lite", color = I("red"))
# 데이터가 포함된 지도를 빠르게 그릴 수 있는 qmplot 함수를 이용하여 시각화한다.
# lon, lat에 필요한 데이터는 data3를 이용한다.
# Maptype은 toner-lite로 설정한다.
# 지도에 표시할 와이파이 지점의 점은 color 옵션을 통해 빨간색으로 지정한다.
