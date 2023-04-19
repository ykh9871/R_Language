# 데이터 조작 2

## 1.데이터 처리 및 가공 패키지

### 데이터 전처리는 중요하고 실제로 많은 시간이 걸리는 작업
### 머신 러닝 알고리즘을 R 코드로 작성하다 보면 데이터를 원하는 형태로 변환해야 하는 필요가 수없이 발생
### 데이터를 원하는 형태로 바꾸거나 조작하는 능력은 R을 사용하는데 있어서 절대적으로 중요

## 2.SQL을 사용한 데이터 처리

### 1.sqldf패키지

### 데이터 처리 함수들 없이 SQL문을 이용하여 데이터를 편리하게 조작할 수 있음
### 패키지 설치
install.packages("sqldf")
library(sqldf)

### 2.sqldf패키지 사용예

### SQL문을 이용해 Orange데이터의 Tree 종류 검색
sqldf("select distinct Tree from Orange")

### Orange데이터 중 Tree가 1인 age의 평균 구하기
sqldf("select avg([age]) from Orange where Tree =1")

## 3.분할, 적용, 재조합을 통한 데이터 분석

### 1.plyr패키지

### plyr은 데이터를 분할 하고(split), 분할된 데이터에 특정 함수 적용(apply) 한 뒤, 그 결과를 재 조합(combine)하는 세 단계
### 입력은 배열, 데이터 프레임, 리스트
### 출력은 배열, 데이터 프레임, 리스트 또는 결과없음
### 여러 함수를 처리해야 할 일들을 짧은 코드로 대신함
### --ply 형태의 5글자 함수명으로 이루어짐

#### 1.adply

#### adply()는 배열(a)를 받아 데이터 프레임(d)를 반환하는 함수
#### 입력이 반드시 배열일 필요는 없음
#### apply()를 사용해도 되지만, 행방향으로 처리할 때 각 열에 서로
#### 다른 데이터 타입이 섞여있을 경우 예상치 못한 타입 변환 발생 가능성이 있음
#### 예
apply(iris[,1:4], 1, function(row){print(row) })
apply(iris, 1, function(row) {print(row)})
#### Species 컬럼이 없을 때는 숫자로 값이 넘어오지만
#### Species 컬럼을 포함하여 apply하면 숫자가 문자열로 바뀌어 버림
  
#### plyr패키지 설치
install.packages("plyr")
library(plyr)
#### adply()를 사용해 Petal.Length가 5.0 이상이고 Species가 setosa인지 여부 확인후 ,새로운 컬럼 V1에 기록
adply(iris, 1, function(x) {x$Petal.Length >= 1.5 & x$Species == "setosa"})

#### 2.ddply

#### ddply()는 데이터 프레임(d)을 입력으로 받아 데이터 프레임(d)를 내보내는 함수
#### iris데이터에서 Petal.Length의 평균을 Species 별로 계산하는 예
#### 출력시 컬렴명은 Swmean으로 지정
#### 데이터를 그룹짓는 변수는.()안에 기록
ddply(iris, .(Species), function(x) {data.frame(Swmean = mean(x$Petal.Length))})

## 4.데이터 구조의 변형과 요약

### 1.reshape2패키지

### reshape2
### 데이터의 모양을 바꾸거나 그룹별 요약 값을 계산 하는 패키지
### melt(), cast()함수가 대표적
install.packages("reshape2")
library(reshape2)

#### 1.melt()

#### 식별자(id), 측정변수(variable), 측정치(value)형태로 데이터를 제공하는 함수
#### french_fries데이터 프레임
#### 실험 수행시간, 오일 종류, 대상 프렌치프라이, 반복실험 횟수
#### melt()이용한 변수 수행 예
head(french_fries)
m <- melt(id=1:4, french_fries) # 1:4컬럼을 id, 나머지 컬럼을 측정변수 및 측정치로 놓고 변환한 결과
head(m)

#### 2.cast()
#### 얻고자 하는 데이터 타입에 따라 dcast(), acast()로 구분
#### dcast() : 데이터 프레임을 결과로 반환
#### acast() : 벡터, 행렬, 배열을 반환
#### dcast(data, fomular, fun.aggregate) : 결과로 데이터 프레임 반환
#### indetical() : 두 데이터가 완전한 객체인지 판별하는 함수
smiths
m <- melt(id=1:2, smiths)
m
x <- dcast(m, subject + time ~ ...)
x
identical (x, smiths)

## 5.데이터 테이블

## 패키지 설치
install.packages("data.table")
library(data.table)

## 데이터 프레임을 만드는 것과 동일한 문법으로 생성
x <- data.table(a = c(10,20,30), b = c("A","B","C"))
x
## 데이터 테이블 생성하기
Orange_table <- as.data.table(Orange)
Orange_table
## 데이터 테이블의 목록 열람하기
tables()

### 1.데이터 접근과 그룹 연산

### 데이터 테이블의 데이터는 [행, 표현식, 옵션] 형태로 접근
DT <- as.data.table(mtcars)
DT

DT[1,]
DT[DT$disp >=160.]
### [행,표현식,옵션]의 두번째 인자에는 컬럼명을 그대로 적거나 또는 컬럼명에 대한 표현식을 적는다.
DT <- as.data.table(mtcars)
DT
DT[1, mpg]

### 여러 컬름을 선택할 때는 list()안에 컬럼 나열
DT <-as.data.table(mtcars)
DT
DT[1, list(mpg, cyl, disp, hp)]

### 컬럼명을 그대로 사용해 연산 수행 가능
DT[, (max(mpg) - min(mpg))]
DT[, mean(mpg)]
DT[, max(mpg)]
DT[, min(mpg)]
DT[, (max(mpg) - min(mpg))]

### 세번째 인자에는 데이터를 그룹지을 변수 지정
DT[, mean(disp), by="gear"]

### DT2변수에 데이터 테이블 생성 후 x의 평균을 y, z 컬럼에 따라 계산한 예
DT2 <- data.table(x = c(10,20,30,40,50), y = c("a","a","a","b","b"),
                  z = c("c","c","d","d","d"))
DT2
DT2[, mean(x), by = "y,z"]

### 2.key를 사용한 탐색
### 데이터 프레임에서 특정 컬럼에 특정 값이 들어있는 행을 찾는 작업은 모든 행의 값을 하나하나 검토하는 방식
### 데이터 양이 많고 검색 작업의 횟수가 많다면 수행시간 길어짐
### setkey()를 사용해 색인을 만들어 두었다가 검색 시 사용
### J(컬럼명1, 컬럼명2, ...)형태로 키를 나열해 데이터 검색
DF <- data.frame(x = runif(1300000), y = rep(LETTERS, each=50000))
str(DF)
head(DF) # 각 알파벳을 50000회씩 반복한 값을 저장

system.time(x <- DF[DF$y=="D",])
DT <-as.data.table(DF)
setkey(DT, y)
system.time(x <- DT[J("D"), ])

### 3. key를 사용한 병합

### 데이터 테이블 dT1, DT2에서 DT1[DT2, 표현식
### DT1에서 DT2에 대응되는 데이터를 찾는 방식으로 병합
### 대응하지 않는 행이 없으면 z에 NA값이 반환
DT1 <- data.table(x = runif(1300000), y = rep(LETTERS, each = 50000))
DT2 <- data.table(y = c("A","B","C"), z = c("aaa","bbb","ccc"))
setkey(DT1, y)
DT1[DT2,] # DT1으로부터 y값이 A,B,C인 행을 찾아 병합
### 반면 DT2[Dt1, ]은 1300000개의 행을 DT2로부터 검색하므로 결과가 총 1300000행
### 대응하지 않는 행이 없으면 z에 NA값이 반환
setkey(DT2, y)
DT2[DT1,]

### DT1[DT2, ]와 데이터 프레임으로 merge하여 합칠 때 시간 비교
### 색인을 이용한 데이터 테이블의 합병 과정이 더 빠른 처리 시간을 가짐
DT1 <- data.table(x = runif(1300000), y = rep(LETTERS, each = 50000))
DT2 <- data.table(y = c("A","B","C"), z = c("aaa","bbb","ccc"))
setkey(DT1, y)
system.time(DT1[DT2, ])
DF1 <- as.data.frame(DT1)
DF2 <- as.data.frame(DT2)
system.time(merge(DF1, DF2))

## 6.더 나은 반복문

### 1.foreach
### apply(), for()를 대채할 수 있는 루프 함수
### foreach는 apply 함수들, for문 등을 대체할 수 있는 루프문을 위한 함수
### for문과의 가장 큰 차이는 반환값이 있고, %do% 문을 사용해 블록을 지정
install.packages("foreach")
library(foreach)
### 1에서 3까지 숫자를 루프를 돌면서 %do%안에서 반환하면 1부터 3까지의 숫자를 담은 리스트 반환.
### .combine에는 연산자를 지정하여 사용 가능
foreach(i=1:3) %do% {return(i)}
foreach(i=1:5, .combine = "*") %do% {return(i)}
foreach(i=1:5, .combine = "+") %do% {return(i)}