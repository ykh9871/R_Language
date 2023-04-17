fib <- c(0,1,1,2,3,5,8,13,21,34)
fib
fib[1]
fib[2]
fib[3]
fib[1:3]
fib[c(1,2,4,8)]
fib[-1]
fib < 10
fib[fib < 10]

years <- c(1960,1964,1976,1994)
names(years) <- c("Kenndey","Johnson","Carter","Clinton")
years
years["Carter"]
years[c("Carter","Clinton")]