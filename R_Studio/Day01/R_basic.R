#변수, 자료형
# 1.변수
a<-3
b<<-3
c=3
d<-4
# 2.함수 호출 시 인자 지정
Data(a, b, c =3, d=4)
Data(1,2)

# 3.스칼라
## 1.스칼라 숫자
x<-4
y<-6.5
z<-x+y
print(z)
z

## 2.스칼라 NA와 Null
num1<-95
num2<-88
num3<-77
num4<-NA
is.na(num4)
a<-NULL
is.null(a)

## 3.스칼라 문자열
x<- "Hello World!"
print(x)
x<- 'Hello World!'
print(x)

## 4.스칼라 진릿값
TRUE & TRUE
TRUE & FALSE
TRUE | TRUE
TRUE | FALSE
!TRUE
!FALSE
#TRUE,FALSE는 예약어 이므로 할당 불가능
TRUE<-FALSE
#&,|와 &&,||의 차이
c(TRUE, TRUE) & c(TRUE, FALSE)
c(TRUE, TRUE) && c(TRUE, FALSE)

## 5.스칼라 팩터
f<-factor("s", c("s","t"))
f
nlevels(f)
levels(f)
ordered("x", c("x", "y", "z"))

# 4.벡터
## 1.벡터 생성하기
(a<-c(10, 20, 30, 40))
c(10, 20, 30)
c(10, 20,30,c(10,20,30))
a<-c(10,20,30)
names(a)<-c("lee", "park", "choi")
a
## 2.벡터 데이터 접근
a<-c("x","y","z")
a[1]
a[2]
a[-3]
a[-1]
a[c(1,2)]
a[c(2,3)]
a[1:2]
a[2:3]
## 3.벡터 연산자
"x" %in% c("x","y","z")
"w" %in% c("x","y","Z")
a<-c(10,20,30,40)
a+1
10-a
## 4.벡터 시퀀스 생성
seq(1,5)
seq(1,5,2)
seq(1,5,3)
1:5
5:1
## 5.벡터 반복된 값 저장
rep(1:2, times=4)
rep(1:2, each=4)
rep(1:2, each=4, times=2)

# 5.리스트
## 1.리스트 생성
(a<- list(names = "Data", num=100))
(a<- list(names = "Data", num= c(10,20,30)))

# 6.행렬
## 1.행렬 생성
matrix(c(10,20,30,40), nrow = 2)
matrix(c(10,20,30,40), ncol = 2)
a <- matrix(1:4, ncol = 2)
rownames(a) # 행 이름이 없으므로 NULL반환
rownames(a)  <- c("one", "two")
a
colnames(a)  <- c("one", "two")
a
### 1. 행 우선으로 지정하여 행렬생성
matrix(c(1:9), nrow = 3, byrow = TRUE)
### 2. 행과 열에 명칭 부여하기
matrix(1:9, nrow = 3, dimnames = list(c("A", "B", "C"), c("D", "E", "F")))

## 2. 데이터 접근
(a  <- matrix(c(1:9), ncol = 3))
a[1,2]
a[3,1]
a[2:3,] #2,3행의 데이터를 가져옴
a[, 1:2]

## 3. 행렬연산
(a  <- matrix(c(1:9), ncol = 3))
a*3
a/2
a+a+a
a-a
a%*%a

# 7.배열
## 1.배열 생성
array(11:22, dim = c(2,5)) #2*5 차원의 배열

# 8.데이터프레임 
## 1. 생성 예제
### 데이터 프레임 생성
(a <- data.frame(x=c(1,2,3,4,5), y=c(6,7,8,9,10)))
### 팩터 컬럼 z 추가
(a <- data.frame(x=c(1,2,3,4,5), y=c(6,7,8,9,10), z=c("s","f","s","f","s")))
### str()함수로 저장 구조 확인
str(a)
### 이미 정의된 프레임에 값 변경하기
a$x
a$x <- 11:15
a
### 새로운 컬럼 추가하기
a$w <-c(1:5)
a
### 행, 컬럼 이름 지정하기
colnames(a) <- c("num1", "num2","num3","num4")
a
rownames(a) <- c(6:10)
a
## 2. 접근예제
### 프레임에 접근하기
a
a$x
a[2,]
a[2,1]
### 색인 지정 및 제외 할 컬럼 설정하기
a[c(1,3),2]
a[-2.-2]
### 컬럼 이름 지정하기
a[,c("x","y")]
a[,c("x")]
### drop 옵션 사용(형 변환 원치 않을 때)
a[,c("x"),drop=FALSE]
### 특정 컬럼 선택하기
(a <-data.frame(x=1:3, y=4:6, z=7:9))
a[,names(a)%in% c("y", "z")]
### 연산자 사용해서 특정 컬럼 선택하기
a[, !names(a) %in% c("x")]
## 3. 유틸리티 함수
### head(), tail()를 이용한 데이터 출력
a <-data.frame(x=1:100)
head(a)
tail(a)
head(a,20L)
### View()를 이용한 데이터 출력
View(a)

# 9.타입 판별
## 1.예제
### 클래스 구하기
class(c(10,20))
class(matrix(c(10,20)))
class(data.frame(a=c(10,20),b=c(30,40)))
### 데이터 타입 판별하기
is.factor(factor(c('a','b')))
is.numeric(1)
is.character(c("a","b"))
is.data.frame(data.frame(a=1:5))

# 10.타입 변환
## 1.예제
### 문자열 벡터를 팩터로 변환 후, 다시 벡터로 변환하기
a <-c("x","y","z")
as.factor(a)
as.character(as.factor(a))
### 행렬을 데이터 프레임으로 변환하기
a <- matrix(1:4, ncol = 2)
as.data.frame(a)
(x <-data.frame(matrix(c(1:4), ncol = 2)))
### 리스트를 데이터 프레임으로 변환
data.frame(list(x=c(1:3), y=c(4:6)))