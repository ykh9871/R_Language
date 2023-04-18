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
