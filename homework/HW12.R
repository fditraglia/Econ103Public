







data.url <- 'http://www.ditraglia.com/econ103/ex_13_5.csv'
election <- read.csv(data.url)
head(election)



data.url <- 'http://www.ditraglia.com/econ103/ex_14_5.csv'
bpdata <- read.csv(data.url)
head(bpdata)



library(arm)
data.url <- "http://www.ditraglia.com/econ103/child_test_data.csv"
data <- read.csv(data.url)
attach(data)
reg1 <- lm(kid.score ~ mom.age)
display(reg1)
plot(mom.age, kid.score, pch = 20, xlab = 'Age of Mother at Birth', 
     ylab = 'Child Test Score at Age 3')
coefficients(reg1)
intercept <- coef(reg1)[1]
slope <- coef(reg1)[2]
abline(a = intercept, b = slope)



reg2 <- lm(kid.score ~ mom.hs + mom.age)
display(reg2)
coef(reg2)
slope <- coef(reg2)[3]
intercept.hs <- coef(reg2)[1] + coef(reg2)[2]
intercept.no.hs <- coef(reg2)[1]
colors <- ifelse(mom.hs == 1, 'gray', 'black')
plot(mom.age, kid.score, , ylab = 'Child Test Score at Age 3', xlab = 'Age of Mother at Birth', pch = 20, col = colors)
abline(a = intercept.hs, b = slope, col = 'gray')
abline(a = intercept.no.hs, b = slope, col = 'black')



reg3 <- lm(kid.score ~ mom.hs + mom.age + mom.hs:mom.age)
display(reg3)
coef(reg3)
intercept.no.hs <- coef(reg3)[1]
intercept.hs <- coef(reg3)[1] + coef(reg3)[2]
slope.no.hs <- coef(reg3)[3]
slope.hs <- coef(reg3)[3] + coef(reg3)[4]
plot(mom.age, kid.score, xlab = 'Age of Mother at Birth', pch = 20, col = colors, ylab = 'Child Test Score at Age 3')
abline(a = intercept.hs, b = slope.hs, col = 'gray')
abline(a = intercept.no.hs, b = slope.no.hs, col = 'black')



y.plus.noise <- function(x){
  2.4 + 0.3 * x + rnorm(length(x))
}



x.test <- 0:12
y.sim <- y.plus.noise(x.test)
plot(x.test, 2.4 + 0.3 * x.test, type = 'l', xlab = 'X', ylab = 'Y')
points(x.test, y.sim)



y.sim <- y.plus.noise(x.test)
plot(x.test, 2.4 + 0.3 * x.test, type = 'l', xlab = 'X', ylab = 'Y')
points(x.test, y.sim)



lm(y.sim ~ x.test)
estimates <- coefficients(lm(y.sim ~ x.test))
a.estimate <- estimates[1]
b.estimate <- estimates[2]
plot(x.test, 2.4 + 0.3 * x.test, type = 'l', xlab = 'X', ylab = 'Y')
points(x.test, y.sim)
abline(a = a.estimate, b = b.estimate, lty = 2, col = 'red')



y.sim <- y.plus.noise(x.test)
estimates <- coefficients(lm(y.sim ~ x.test))
a.estimate <- estimates[1]
b.estimate <- estimates[2]
plot(x.test, 2.4 + 0.3 * x.test, type = 'l', xlab = 'X', ylab = 'Y')
points(x.test, y.sim)
abline(a = a.estimate, b = b.estimate, lty = 2, col = 'red')



slope.sim <- function(x){
  
  y.sim <- 2.4 + 0.3 * x + rnorm(length(x))
  reg <- lm(y.sim ~ x)
  b <- coefficients(reg)[2]
  return(b)
  
}



b.sim <- replicate(1000, slope.sim(x.test))



mean(b.sim)
sd(b.sim)
hist(b.sim)


