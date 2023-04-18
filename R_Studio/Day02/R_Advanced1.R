# 1.데이터 조작1

## 1.아이리스 데이터
head(iris)
str(iris)

### 1.데이터 사용
data(mtcars)
head(mtcars)

## 2.파일 입출력

### 1.csv파일 입출력
setwd("C:/Yoongit/R_Language/R_Studio/Day02/") #작업공간 설정 및 저장
(x<-read.csv("score.csv",header = T)) #csv파일을 데이터 프레임으로 읽어 들인다
str(x)

(x<-read.csv("score-2.csv"))
names(x)<-c("id","name","score") #해더행이 없는 파일에 컬럼 이름 지정
x
str(x) #name 컬럼이 모두 팩터 형태로 변환됨
x$name<-as.character(x$name) # 문자열로 변환해 줌
str(x)

x<-read.csv("score.csv", stringsAsFactors = F) 
#처음부터 문자열 타입으로 읽도록 지정하는 방법법
str(x)

### 2.객체의 파일 입출력
a<-1:10
b<-10:20
save(a,b,file = "ab.RData") #메모리에 있는 객체를 파일에 저장한다
rm(list=ls()) #메모리에 있는 객체를 모두 삭제
a<-1:10
b<-10:20
c<-20:30
save(list = ls(),file = "abd.RData")
rm(list=ls())
ls()
load("abd.RData") #파일로 부터 데이터를 불러들임
a
b
c

## 3.데이터 프레임

### 1.행과 컬럼 합치기
rbind(c(1,3,5), c(2,4,6)) #지정한 데이터들을 행으로 취급해 합친다.
cbind(c(1,3,5), c(2,4,6)) #지정한 데이터들을 컬럼으로 취급해 합친다.

## 4.apply 계열 함수

### 1.apply()
x<-matrix(1:10, ncol=2)
x
# 행렬의 행 또는 열 방향으로 특정 함수를 적용하는 데 사용
#apply(Data, Marjin, Sum) 에서 MarJin = 1 : 행 MarJin = 2는 열을 뜻함
apply(x,1,sum) 
apply(x,2,sum)

### 2.lapply() 결과를 리스트로 반환
lapply(mtcars[,1:4],mean)
str(mtcars)

### 3.sapply() lapply와 유사하지만 리스트대신 결과를 벡터 또는 행렬로 반환
sapply(mtcars[,1:4],mean)
class(sapply(mtcars[,1:4],mean))
#컬럼이 어떤 데이터 타입인지 한번에 확인하기에 응용
sapply(mtcars, class)

### 4.tapply() 그룹별로 함수를 적용하기 위한 함수
tapply(1:15, rep(1,15),sum)
tapply(1:15, 1:15 %% 2 == 0, sum)

### 5.mapply() 여러 데이터를 함수의 인자로 적용
#즉 mapply()에서는 mtcars의 모든 행이 나열되어 인자로 주어짐
mapply(mean,mtcars[,1:4])

## 5.데이터를 그룹으로 묶은 후 함수 호출하기

### 1.summary()
# 자료에 대한 간략한 통계 분석 또는 머신 러닝 모델에 대한 요약을 보기 위해 사용되는 generic function
# 주어진 인자에 따라 다른 동작을 수행하는 함수
# 자료가 인자로 주어지면 간략한 통계요약을, 모델이 인자로 주어지면 모델에 대한 요약을 보여주는 방식
summary(mtcars)

### 2.quantile() 수치형 자료의 분포
quantile(mtcars$mpg)
quantile(mtcars$mpg,seq(0,1,by=0.15))

### 3.summaryBy() 원하는 컬럼의 값을 특정 조건에 따라 요약하는 목적으로 사용
library(doBy)
summaryBy(age+circumference~Tree,Orange)
# age + circumference ∼ Tree 은 formula라고 하는데, 데이터를 일종의 수식으로 푯현하는 방법
# 이 예에서는 age와 circumference 를 +로 연결해 이 두가지에대한 값을 차례로 컬럼으로 놓고, 각 행에는 Tree를 배열하기위해 ∼Tree를 붙임
# 위 결과는 age, circumference를 Tree별료 요약한 예제

### 4.orderBy() 데이터를 정렬하기 위한 목적으로 사용
orderBy(~age, Orange)
# 모든 데이터를 age를 기준으로 정렬하는 예
# 모든 데이터를 보여줄 것이므로 ~좌측은 무시를 뜻함

#모든 데이터를 age, circumference 순으로 정렬한 예
orderBy(~age+circumference, Orange)
# 먼저 age 순으로 정렬되고 그 안에서 circumference 로 정렬

### 5.sample() 주어진 데이터에서 임의로 샘플을 추출하는 목적으로 사용
### 중복을 허용하거나 허용하지 않고 샘플을 추출할 수 있음
### 중복을 허용하려면 replace=TRUE를 지정
sample(1:20, 10)
sample(1:20,10,replace = TRUE)
sample(1:20,10,replace = FALSE)
### 흥미로운 사용방법은 데이터를 무작위로 섞는데 사용
sample(1:20, 20)
### NROW()는 주어진 데이터 프레임 또는 벡터의 행의 수 또는 길이를 반환하는 함수
Orange[sample(NROW(Orange), NROW(Orange)),]
### 샘플링은 데이터의 무작위 재배열 보다는 주어진 데이터에서 일부를 training data, 일부를 validation data(또는 test data) 로 분ㄹ리하는데 더 유용
### 보통은 주어진 데이터에서 각 Tree 마다 10% 씩을 뽑아서test data로 활용하고 싶은 경우 사용
sampleBy(~Tree,frac = 0.1, data =Orange)

## 6.데이터 분리 및 병합

### 1. split()
### 데이터를 분리 하는데 사용
split(Orange, Orange$Tree)
### lapply()를 적용해서 Orange의 Tree별 circumference의 편균을 구할 수 있음
lapply(split(Orange$circumference, Orange$Tree), mean)

### 2. subset()
### subset()은 split()과 유사하지만 전체를 부분으로 구분하는 다른 조건을 만족하는 부분만 원할 때 사용
subset(Orange, Tree==1)
### 벡터간 연산에서의 AND는 &&가 아니라 &를 사용
subset(Orange, Tree==1 & age > 3)
### Tree=1인 값에서 age가 3 이상인 행을 추출
### subset에 select인자를 지정하면 특정 열을 선택하거나 제외
subset(Orange, select = c(Tree, age))
### 특정 열을 제외하고자 한다면 '-' 를 열이름 앞에 붙임
subset(Orange, select=-c(Tree))

### 3.merge()
### 데이터 프레임을 공통된 값을 기준으로 묶는 함수
### 데이터 베이스에서 join과 같은 역할
a <- data.frame(name=c("x", "y", "z"), weight=c(50,55, 60))
b <- data.frame(name=c("y", "z", "x"), height=c(150,160,170))
merge(a,b)
### 이름을 기준으로 몸무게가 저장된 데이터 프레임과, 키가 저장된 데이터 프레임을 결합한 예
### a와 b의 이름이 서로 다른 순서로 저장되어 있으나 이름을 기준으로 찾아서 결합

### 4.cbind()
### 단순히 열을 합치는 함수
a <- data.frame(name=c("x", "y", "z"), weight=c(50,55, 60))
b <- data.frame(name=c("y", "z", "x"), height=c(150,160,170))
cbind(a,b)

###공통된 이름이 없는 경우 NA로 채우면서 전체 데이터를 모두 합치려면 all 인자에 TRUE를 지정
a <- data.frame(name=c("x", "y", "z"), weight=c(50,55, 60))
b <- data.frame(name=c("y", "r", "x"), height=c(150,160,170))
merge(a,b,all = T)

## 7.데이터 정렬렬

### 1.sort()
### 주어진 데이터를 직접 정렬해주는 함수
num<-c(71,85,24,9,13)
sort(num,decreasing = T)
num
### decreasing을 True로 설정하면 내림차순으로 정렬
### 값을 정렬한 결과를 반환, 벡터 자체를 변경하지 않는다.

### 2.order()
### 주어진 인자를 정렬하기 위한 각 요소의 색인 반환
### decreasing=T 설정시 내림차순 결과를 반환
num
order(num)
order(num, decreasing = T)

## 8.데이터 프레임 컬럼 접근

### 1.with()
### 데이터 프레임 또는 리스트 내 필드를 필드 이름만으로 접근할 수 있게 함
### 기존에 Orange$age, Orange$circumference 형태로 적어야 했던 코드를 간단하게 필드 이름으로 접근 가능
with(Orange, {
  print(mean(age))
  print(mean(circumference))
  })

### 2.within()
### within은 with와 비슷하지만 데이터 수정기능을 제공함
### 데이터가 결측치일 때, 이를 중앙값으로 치환한 예
(num<-data.frame(val=c(10,NA,20,30,NA,40,50)))

### 두개의 코드로 사용가능
num<-within(num,{val<-ifelse(is.na(val), median(val,na.rm = T),val)})
num$val[is.na(num$val)]<- median(num$val, na.rm = TRUE)
num

### 3.arrach(), detach()
### 함수 호출 후 모든 코드에서 컬럼들을 직접 접근할 수 있게 함
### Orange를 attach()했다가 detach()로 해제하는 예
Tree
attach(Orange)
Tree
detach(Orange)
Tree

## 9.조건에 맞는 데이터의 색인 찾기

### which()
### 조건에 만족하는 데이터의 행의 색인 자체를 반환
subset(Orange, Tree=="4")
which(Orange$Tree==4)


## 10.그룹별 연산

### 1.aggregate()
### 데이터를 분할하고 각 그룹마다 요약치를 계산
aggregate(age~circumference, Orange, mean)


## 11.편리한 처리를 위한 데이터의 재표현

### 1.stack(), unstack()

### stack() 데이터를 분할하고 각 그룹마다 요약치를 계산
a<-data.frame(x=c(1,4,7),
              y=c(2,9,6),
              z=c(4,3,1))
(stackedA<-stack(a))

### unstack() stack()을 통해 변환된 데이터를 원래 상태로 되돌리는데 사용 
unstack(stackedA, values~ind)