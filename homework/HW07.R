







x <- seq(from = -5, to = 5, by = 0.01)
y1 <- dnorm(x)
y2 <- dt(x, df = 1)
y <- cbind(y1, y2)
matplot(x, y, lty = 1, type = 'l', ylab = 'f(x)')



y3 <- dt(x, df = 100)
y <- cbind(y1, y3)
matplot(x, y, lty = 1, type = 'l', ylab = 'f(x)')



x <- seq(from = 0, to = 20, by = 0.01)
y <- dchisq(x, df = 4)
plot(x, y, type = 'l', ylab = 'f(x)')



x <- seq(from = 0, to = 5, by = 0.01)
y <- df(x, df1 = 4, df2 = 40)
plot(x, y, type = 'l', ylab = 'f(x)')



sims <- rnorm(100000)



sum((sims >= -1) & (sims <= 1))/length(sims)



sum((sims >= -2) & (sims <= 2))/length(sims)



sum((sims >= -3) & (sims <= 3))/length(sims)



pnorm(1) - pnorm(-1)
pnorm(2) - pnorm(-2)
pnorm(3) - pnorm(-3)



data.url <- "http://www.ditraglia.com/econ103/old_survey.csv"
survey <- read.csv(data.url)
height <- survey$height
height <- height[!is.na(height)]



hist(height, main = 'Population - All Econ 103 Students', 
     xlab = 'Height in Inches')
mean(height)



x.bar.draw <- function(n){
  
  sim <- sample(height, size = n, replace = TRUE)
  return(mean(sim))
  
}#END x.bar.draw



x.bar.draw(10000)



x.bar.5 <- replicate(10000, x.bar.draw(5))
x.bar.10 <- replicate(10000, x.bar.draw(10))
x.bar.20 <- replicate(10000, x.bar.draw(20))
x.bar.50 <- replicate(10000, x.bar.draw(50))



mean(x.bar.5)
mean(x.bar.10)
mean(x.bar.20)
mean(x.bar.50)
hist(x.bar.5)
hist(x.bar.10)
hist(x.bar.20)
hist(x.bar.50)

var(x.bar.5)
var(x.bar.10)
var(x.bar.20)
var(x.bar.50)



ones <- rep(1, 10)
ones
cumsum(ones)
cumsum(1:10)



n <- 10000
sims <- rnorm(n, mean = 0, sd = 10)
running.mean <- cumsum(sims)/(1:n)
plot(1:n, running.mean, type = 'l', xlab = 'n', ylab = 'Sample Mean')
abline(h = 0, col = "red", lty = 2)



n <- 10000
sims <- rt(n, df = 1)
running.mean <- cumsum(sims)/(1:n)
plot(1:n, running.mean, type = 'l', xlab = 'n', ylab = 'Sample Mean')
abline(h = 0, col = "red", lty = 2)



n <- 10000
sims <- rt(n, df = 3)
running.mean <- cumsum(sims)/(1:n)
plot(1:n, running.mean, type = 'l', xlab = 'n', ylab = 'Sample Mean')
abline(h = 0, col = "red", lty = 2)


