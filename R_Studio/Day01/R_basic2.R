# 조건문, 반복문, 함수

# 1.흐름 제어
## 흐름 제어 조건문
### if문 예제
if(TRUE){
  print("참")
  print("HELLO")
}else{
  print("거짓")
  print("WORLD")
}
### ifelse()사용 예
x <- c(6,7,8,9,10)
ifelse(x %% 2 ==1, "홀수", "짝수")

## 흐름 제어 반복문문
### for문 예제
for(a in 11:20){
  print(a)
}
for(a in 1:9){
  result = 3*a
  print(result)
}
### while문 예제
a <- 1
while (a<=10) {
  print(a)
  a <- a+1
}
a <- 1
while (a < 10) {
  result = 3*a
  print(result)
  a <- a+1
}
### while문 에서 next 사용
i <- 0
while (i<= 15) {
  i <- i + 1
  if (i %% 3 != 0){
    next #print()를 실행하지 않고while문의 처음으로 감
  }
  print(i)
}
### repeat 사용 예
a <- 11
repeat{
  print(a)
  if(a>=20){
    break
  }
  a <- a+1
}

# 2.연산
## 1. 벡터연산
### 벡터 연산은 벡터 또는 리스트를 한번에 연산하는 것을 의미
a <- c(1,3,5,7,9)
a + 2
### 벡터 간의 연산도 가능
a <- c(1,3,5,7,9)
a + a
a==a
a==c(1,3,5,7,7)
### 벡터 연산시 개수가 다를 경우 경고 발생
x <- c(1,3,5,7,9)
y <- c(2,2,2,2,2,2,2,2)
x+y
## 2. NA의 처리
### 데이터에 NA 포함된 경우, 결과가 항상 NA로 변경됨
### 따라서 NA처리 함수 필요
### NA는 누락 된 값 지시자를 포함하는 길이 1의 논리 상수
# na.rm : NA값이 있을 때, 해당 값을 제거할 것인지 지정
sum(c(1,2,3,NA))
sum(c(1,2,3,NA), na.rm = T)
a <- data.frame(x=c(1,3,5), y=c("x", NA, "z"), z=c("x","y",NA))
a
#na.omit : NA가 포함된 행 제외
na.omit(a)
#na.pass : NA의 포함 여부 상관하지 않음
na.pass(a)
#na.fail : NA가 포함되 었을 경우 에러 반환
na.fail(a)

###NA가 포함되어 있을 때 계산
a <- c(1,3,5,7,9)
b <- c(2,2,2,NA,NA)
a+b
### NA로 처리
(a <- matrix(c(1,3,5,7,9,11), ncol = 3))
(b <- matrix(c(2,2,2,2,NA,NA), ncol = 3))
a
b
a+b
a*b

# 3.함수의 정의
## 1.기본정의
### 함수의 사용은 코드의 반복을 줄이거나 코드의 가독성을 높임
# 함수 ㅣ 함수명  <- functioin(인자, 인자, ...){함수 본문}
fibo <- function(x){
  if (x==3 || x==4) {
    return(1)
  }
  return(fibo(x-3)+fibo(x-4))
}
fibo(3)
fibo(7)
### 인자의 위치에 맞춰서 값을 넘겨주는 방식 가능
### 인자의 이름을 지정해서 넘겨주는 방식 가능
f <- function(a,b) {
  print(a)
  print(b)
}
f(3,4)
f(b=3, a=4)
## 2.가변길이 인자
###'...'은 개수를 알 수 없는 임의의 인자를 표현하는 데 사용
###내부에서 호출하는 다른 함수에 넘겨줄 인자 표시
a <- function(b,...){
  print(b)
  f(...)
}
a(2,3,4)
## 3.중첩 함수
### 함수 안에 또 다른 함수 정의
### 간결한 코드의 표현 가능
# 중첩함수(Nested Function)
f <- function(a,b) {
  print(a)
  y <- function(b) {
    print(b)
  }
  y(b)
}
f(2,3)

# 4.스코프
### 코드에서 기술한 이름(변수명)이 어디에 사용 가능한지를 정하는 규칙
### 문법적 스코프(정적) 사용
### 변수가 정의된 블록 내부에서만 변수를 접근
### <<-전역변수에 할당
#스코프 : 코드에 기술한 변수 등을 지칭하는 이름이 어디에서 사용가능한지 정하는 규칙
y <- 1
f <- function() {
  x <- 3
  a <- function() {
    x <<- 3
    y <<- 3
    print(x)
    print(y)
  }
  a()
  print(x)
  print(y)
}
f()

y <- 1
f <- function() {
  x <- 2
  a <- function() {
    x <- 3
    y <- 3
    print(x)
    print(y)
  }
  a()
  print(x)
  print(y)
}
f()
### 전역변수: 어떤 변수 영역 내에서도 접근할 수 있는 변수
### 지역변수: 함수 내에서 정의되고 사용할 수 있는 변수
### 매개변수: 함수의 인수로부터 받아서 생기는 변수
x <- 5; y <- 9; z <- 13 # 전역변수
ft <- function(x) {
  y <- x+15 # 지역변수
  print(x); print(y); print(z)
  #매개변수#지역변수 #전역변수
}
x
y
ft(x)
ft(10)

# 5.값에 의한 전달
### R에서는 모든 것이 객체
### 객체는 함수 호출 시 일반적으로 값으로 전달
### 객체가 복사되어 함수로 전달
f <- function(af2) {
  af2$a <- c(1,3,5)
}
af <- data.frame(x=c(5,7,9))
f(af)
af

f <- function(af2) {
  af$x <- c(1,3,5)
  return(af)
}
af <- data.frame(x=c(4,6,8))
af <- f(af) # af의 값을 덮어 쓴다.
af

# 6. 객체의 불변성
### R의 객체는(거의 대부분의 경우에) 불변
### 수정이 불가능함
### 객체의 값을 바꾸면, 새로운 객체가 만들어짐
x <- list()
x$y <- c(1,3,5) #실제로 x객체를 변경하는 것은 아님
### 리스트 x에 새로운 필드 y를 만들고 값 1,2,3 할당이 아님
### x를 복사한 다음에 새로운 객체 x를 만들고, 이 x에 필드 추가하여 값을 채우고 변수명 x가 x를 가리킴
#이전 객체는 버려지고, 새로운 객체를 생성

x <- list()
tracemem(x)
x$b <- c(10,20,30)

# 7.모듈 패턴
### 모듈이란 외부에서 접근할 수 없는 데이터와 그 데이터를 제어하기 위한 함수로 구성된 구조물
### 장점
#### 데이터를 외부에서 직접 접근 불가
#### 사전에 정의된 함수로만 다룰 수 있음
#### 함수의 내부구조나 데이터 구조를 마음대로 바꿀 수 있음
## 1.큐
### FIFO(First In First Out) 방식의 자료구조
### 여러 값이 있을 때 제일 앞의 값이 처리되고 새로 입력된 값은 맨뒤에서 기다리는 구조
### Enqueue : 줄의 맨 뒤에 데이터 추가
### Dequeue : 줄의 맨 앞에 데이터 가져옴
### Size : 줄의 길이
que <- c()
que_size <- 0
enq <- function(num) {
  que <<- c(que, num)
  que_size <<- que_size + 1
}
deq <- function() {
  number <- que[1]
  que <<- que[1]
  que_size <<- que_size -1
  return(number)
}
size <- function() {
  return(que_size)
}
enq(1)
enq(3)
enq(5)
print(size())
print(deq())
print(deq())
print(size())
enq(1)
que <- c(que,7)
print(size())
deq()
deq()
size()
### que라는 변수가 전역으로 선언되 있어 이 함수를 거치지 않고 외부에서 데이터 조작 가능
### 데이터 무결성 깨질 수 있음
## 2.큐 모듈작성
q <- function() {
  que <- c()
  que_size <-0
  
  enq <- function(num){
    que <<- c(que, num)
    que_size <<- que_size + 1
  }
  
  deq <- function() {
    number <- que[1]
    que <<- que[-1]
    que_size <<- que_size -1
    return(number)
  }
  
  size <- function() {
    return(que_size)
  }
  
  return(list (enq = enq, deq=deq, size=size))
}
## 3.큐 모듈 사용
### queue() 함수 호출 시 만들어지는 queue() 내부의 지역변수 que와 que_size가 생성되는 공간은 queue() 함수를 호출 할 때 마다 매번 새로 생성
### queue()를 여러 개 만들어 사용해도 데이터가 섞이지 않음
install.packages("collections")
library(collections)
que <- queue()
a <- queue()
que$enqueue(3)
a$size()
a$enqueue(5)
que$dequeue()
a$dequeue()
que$size()
a$size()