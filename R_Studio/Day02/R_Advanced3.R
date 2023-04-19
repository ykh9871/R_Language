# 3.그래프

## 1.산점도
## 주어진 데이터를 점으로 표시해 흩뿌리듯이 시각화한 그림
## 실제 값들이 표시, 한눈에 살펴보기 유용

## plot()함수 이용
methods("plot")

### 1.예제

### 1.Orange데이터의 나이와 둘레를 산점도로 표현
plot(Orange$age, Orange$circumference)

### 2.plot(X,Y, xlab, ylab): x,y 축 이름 지정
plot(Orange$age, Orange$circumference, xlab = "Orange Tree Age", ylab = "Ornage Tree Circumference")

## 2.그래프 옵션

### 1.그래프 제목 (main)

### main 옵션은 그래프의 제목을 지정
plot(Orange$age, Orange$circumference, xlab = "Orange Tree Age", ylab = "Orange Tree Circumference", main = "Orange")

### 2.점의 종류(pch)

### pch 옵션은 점의 모양을 지정
### 숫자 지정 : 미리 지정된 심볼 사용
### 문자 지정 : 해당 문자를 사용해 점으로 표시
plot(Orange$age, Orange$circumference, xlab = "Orange Tree Age", 
     ylab = "Orange Tree Circumference", main = "Orange", pch = 20)
plot(Orange$age, Orange$circumference, xlab = "Orange Tree Age", 
     ylab = "Orange Tree Circumference", main = "Orange", pch = "+")

### 3.점의 크기(cex)

### cex 옵션은 점의 크기를 지정
### 기본값은 1이며 , cex가 작을수록 점의 크기가 작아짐
plot(Orange$age, Orange$circumference, xlab = "Orange Tree Age", 
     ylab = "Orange Tree Circumference", main = "Orange", pch = "+", cex = 2)

### 4.색상(col)

### col은 표현되는 산점도의 색을 지정
### 색상은 점,선,등 모두가 해당됨
plot(Orange$age, Orange$circumference, xlab = "Orange Tree Age",
     ylab = "Orange Tree Circumference", main = "Orange", cex = 2, col = "#ff0000")

### 5.좌표축 값의 범위 xlim, ylim

### xlim, ylim은 그래프에 그려질 값의 범위를 지정할 수 있음
### 좌표축 값의 범위를 지정하려면 먼저 데이터 값의 최소, 최대치를 알아야함

min(Orange$age)
max(Orange$age)       
min(Orange$circumference)       
max(Orange$circumference)

### 앞서 구한 Age, Circumference의 범위 중 범위를 축소하여 산점도 출력
### (Age : 500~1200, Circumference : 50 ~ 150)
plot(Orange$age, Orange$circumference, xlab = "Orange Tree Age",
     ylab = "Orange Tree Circumference", main = "Orange", cex = 2, col = "#ff0000",
     xlim = c(500, 1200), ylim = c(50, 150))

### 6.그래프 유형 (type)

### type중 자주 사용하는 값으로는 p(점), l(선), b(점과 선 모두),
### 0(점과 선을 중첩하여 그림), n(아무것도 그리지 않음)
### b와 o는 유사해 보이지만, b는 점과 선이 만나는 점에서는 점 또는 선 중 하나만 보인다.
### 반면 o 는 점 그래프를 그리고 그 위에 선 그래프를 중첩하여 그린다.
### n은 데이터를 그리지는 않지만 새로운 그래프를 초기화 할 때 사용
plot(Orange$age, Orange$circumference, cex = 2)
plot(Orange$age, Orange$circumference, cex = 2, type = "l", main = "type=l")
plot(Orange$age, Orange$circumference, cex = 2, type = "b", main = "type=b")
plot(Orange$age, Orange$circumference, cex = 2, type = "o", main = "type=o")
plot(Orange$age, Orange$circumference, cex = 2, type = "n", main = "type=n")

### type = o그래프의 경우 오렌지 나무의 나이에 따른 둘레 변화를 보기가 어려움
### 이를 해결하기 위해 tapply() 함수를 이용하여 각 나이마다 평균 둘레를 tapply를 사용해 plot()으로 그림
plot(tapply(Orange$age, Orange$circumference, mean), cex = 2, type = "o")

### 7.선유형 (lty)

### 선 유형을 지정하는 옵션
### lty는 숫자 또는 문자열로 지정할 수 있다.
### 숫자일 경우 0=그리지 않음, 1=실선(기본값), 2=대시(-)로 표시,
### 3 = 점, 4 = 점과 대시, 5 긴 대시, 6 두개의 대시
### 문자열로 지정할 경우 "blank", "solid", "dashed", "dotted", "dotdash", "longdash". "twodash"에 해당한다.
### 앞서 그래프를 type = l로 그리고 , lty="dashed"를 옵션을 주어 대시로 선의 모양을 지정한 예
plot(tapply(Orange$age, Orange$circumference, mean), cex = 2, type="o",
     xlab = "Orange Tree Age", ylab = "Orange Tree Circumference", lty="dashed")

### 8.그래프 배열

### plot()으로 그래프를 그리면 매번 새로운 창에 출력
### par() : 연관된 그래프 다수를 한번에 출력하는 함수
paroption <- par(mfrow = c(2, 2)) # 2행 2열의 그래프 출력 설정
plot(tapply(Orange$age, Orange$circumference, mean), cex = 2, type="o",
     xlab = "Orange Tree Age", ylab = "Orange Tree Circumference", lty="dashed", main = "Orange1")
plot(tapply(Orange$age, Orange$circumference, mean), cex = 2, type="o",
     xlab = "Orange Tree Age", ylab = "Orange Tree Circumference", lty="dashed", main = "Orange2")
plot(tapply(Orange$age, Orange$circumference, mean), cex = 2, type="o",
     xlab = "Orange Tree Age", ylab = "Orange Tree Circumference", lty="dashed", main = "Orange3")
plot(tapply(Orange$age, Orange$circumference, mean), cex = 2, type="o",
     xlab = "Orange Tree Age", ylab = "Orange Tree Circumference", lty="dashed", main = "Orange4")
par(paroption) #설정한 par옵션 해제

## 3.기본 그래프

### 1.점(point)
### points() : 점을 그리는 함수, plot()은 매번 새로운 그래프가 그려지지만 points()는 추가로 그려줌
plot(iris$Sepal.Length, iris$Sepal.Width, cex=2, pch=20)

points(iris$Petal.Length, iris$Petal.Width, cex=2, pch="+", col="#FF0000")
#이미 그려진 그래프에 추가로 표시

### 2.꺾은 선(lines)

### lines(x,y,...) : 연결된 선들을 그래프에 추가하여 그림
### lowess() : 데이터를 설명하는 일종의 추세선(회귀분석)
plot(cars)
lines(lowess(cars))

### 3.직선(abline)

### abline() : y = ax + b 형태 등 직선 형태의 꺾이지 않고 그어진 일직선을 표현하는 함수
### 검은선은 앞서 그렸던 추세선을 lines()
### 파란색 선은 근사값을 이용한 abline()
#dist == 5 + 3.5 x speed 근사값 가정
### 앞서 그래프에 speed와 dist의 평균까지 abline()으로 표현
### abline()함수는 꺾이지 않은 직선이기에 가능

### abline()함수의 파라미터
### h는 수평의 horizontal, v는 수직의vertical를 뜻함
abline(h = mean(cars$dist), lty=2)
abline(v = mean(cars$speed), lty=2)

### 4.곡선(curve)

### curve() : 주어진 표현식에 대해 곡선을 그리는 함수
### curve(표현식, 구간시작점, 구간끝점)
curve(sin, 0, 2*pi) # [0,2pi]구간의 sin함수

## 4.문자열(text)

### text() : 그래프에 문자열을 그리는데 사용하는 함수
### pos는 텍스트의 좌표를 지정
### 1:좌표의 하단, 2:좌표의 좌측, 3:좌표의 상단, 4:좌표의 우측
### adj는 텍스트의 위치를 지정
### (0,0):우측 상단, (0,1):우측 하단, (1,0):좌측 상단, (1,1):좌측 하단
### pos, adj를 동시에 지정하면 pos가 우선
plot(1:6 ,1:6)
text(2,1, "Hi")
text(3,2, "Go")
text(4,4, "00", adj=c(0,0))
text(4,4, "01", adj=c(0,1))
text(4,4, "10", adj=c(1,0))
text(4,4, "11", adj=c(1,1))


plot(Orange$age, Orange$circumference, cex=1)
text(Orange$age, Orange$circumference, pos=4) # 데이터 순서에 따라 번호를 붙임
# pos=1 > 하단, pos=2 > 좌측, pos=3 > 상단, pos=4 > 우측

## 5.그래프에 그려진 데이터의 식별(identify)

### 그래프를 그린 뒤, identify()를 호출하면, 마우스 커서가 십자가 모양으로 변함
### 십자가 커서로 그래프에서 특정 점을 클릭하면 클릭된 점과 가장 가까운 데이터에 레이블을 표시한다.

### identify() : 그래프를 그린 뒤 표현된 산점도의 점을 식별하는 함수
### plot()으로 그래프를 그리고 identify()함수를 실행하면 그림 2와 같이 마우스 아이콘이 십자커서(+) 형태로 표현됨
### 마우스로 그래프에 점을 찍고 ESC로 명령어를 종료하면 찍었던 점에 대한 데이터를 식별해줌
plot(Orange$age, Orange$circumference, cex = 2)
identify(Orange$age, Orange$circumference)

## 6.범례(legend)

### legend() : 범례를 표시해주는 함수
plot(iris$Sepal.Length, iris$Sepal.Width, cex = 2, pch=20)
points(iris$Petal.Length, iris$Petal.Width, cex = 2, pch= "+", col="#FF0000")
legend("topright", legend=c("Sepal", "Petal"), pch = c(20, 43),
       col = c("black", "red"))  # 20 : 원형기호 43 : "+"
# legend에서 pch 지정시, pch=c(20,"+")형태가 사용불가 백터에는 한가지 타입의 인자만 저장 가능하기 떄문

## 7.행렬에 저장된 데이터 그리기

### 1.matplot(), matlines(), matpoints()

### 각각 plot(), lines(), points() 함수와 유사하지만 행렬 형태로 주어진 데이터를 그래프에 그린다는 것이 차이점
### 함수 호출 방식도 큰 차이가 없고, 다만 입력이 행렬로 주어지기만 하면 됨
###[-3pi, 3pi]구간에서의 sin(x), cos(x) 그래프 그리기
x <- seq(-3*pi, 3*pi, 0.01)
y <- matrix(c(sin(x), cos(x)), ncol = 2)
head(x, 50L)
head(y, 50L)

### matplot()에 x, y를 지정해 그래프를 그림
### abline()함수의 x=0, y=0 축을 그리기 위해 h = 0, v = 0 수행
matplot(x, y, lty = c("solid", "dashed"), cex=.5, type = "l")
abline(h = 0, v = 0)


## 8.응용 그래프

### 1.boxplot() : 상자 그림을 그리며, 데이터의 분포를 보여줌
### 그래프의 점들은 이상치(outlier)에 해당
boxplot(cars$dist)

### 2.hist() : 값의 범위를 빈도로 표현한 히스토그램을 그리는 함수
hist(cars$dist)
### hist()표현시 세로는 빈도(데이터의 개수)를 의미하며, 밀도로 확인하고 싶다면freq옵션을 False로 수행
hist(cars$dist, freq = FALSE)
x <- hist(cars$dist, freq = FALSE)
x
sum(x$density) * 20

### 2.density() : 막대의 너비를 가정하지 않고 모든 점에서 데이터의 밀도를 추정하는 커널 밀도를 추정
plot(density(cars$dist))

### plot()대신 lines()를 사용하여 히스토그램 위에 밀도 선 표현가능
hist(cars$dist, freq = FALSE)
lines(density(cars$dist))


### 3.barplot : 막대 그래프를 그리는 함수
### Orange 데이터의 둘레(Circumference)값을 출력하고, x축의 값을 막대 그래프로 그린 예
barplot(Orange$circumference, names.arg = Orange$circumference)

### Orange 데이터의 둘레(Circumference)평균값을 Tree 별로 계산하고, x축의 값을 막대 그래프로 그린 예
barplot(tapply(Orange$circumference, Orange$Tree, mean), names.arg = Orange$tree)

### 4.pie() : 데이터의 비율을 표현하는 목적으로 사용되는 함수
### 1을 10번 반복하여, 색깔을 10단계로 나눠서pie로 출력
pie(rep(1, 10), col = rainbow(10))

### 2019년 스마트폰 판매율을 pie 그래프로 표현하는 예제
slices <- c(19.2, 15.7, 11.9, 7.9, 7.3, 37.9)
name <- c("Samsung", "Huawei", "Apple", "OPPO", "Vivo", "Other")
pie(slices, labels = name, main="Smartphone sales rate in 2019")

### 5.pairs()
### 산점도 행렬 : 다변량 데이터에서 변수 쌍 간의 산점도 들을 그리는 함수
### 다수의 변수가 있을 때 모든 변수간의 산점도를 손쉽게 그리고, 상관관계 등의 특징을 쉽게 확인할 수 있음

### cars데이터에서 speed와 dist의 산점도 행렬을 그리는 예
pairs(cars)

### cars데이터에서 speed와 dist의 산점도 행렬을 그리는 예
### 앞서 배웠던 pch를 사용하여 서로 다른 점 모양 표현이 가능
pairs(cars, pch = c(1,2))

### iris 데이터에서 각 종뵬(setosa, versicolor, virginica)로 Sepal.Width, Sepal.Length, Petal.Width, Petal.Length의 산점도 행렬을 그리는 예제
pairs(~ Sepal.Width + Sepal.Length + Petal.Width + Petal.Length, data = iris, pch = c(10, 15, 20)[iris$Species])