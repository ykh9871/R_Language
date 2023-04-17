#변동계수
cv <- function(x) sd(x)/mean(x)
x <- c(1:10)
cv(x)
cv(1:10)

#최대공약수 찾기

gcd <- function(a,b) {
if (b == 0) return(a)
else return(gcd(b, a %% b))
}

gcd(8,2)