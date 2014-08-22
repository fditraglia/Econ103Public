set.seed(36788)
mu.x <- 4
mu.y <- 3
sd.x <- 3
sd.y <- 4
n <- 25

x <- rnorm(n, mu.x, sd.x)
y <- rnorm(n, mu.y, sd.y)

mean(x) 
mean(y)

diff <- mean(x) - mean(y)
SE <- sqrt(sd.x^2/n + sd.y^2/n)

ME <- 2 * SE
c(diff - ME, diff + ME)