survey <- read.csv("http://www.ditraglia.com/econ103/old_survey.csv")
survey <- survey[,c("handedness", "height", "handspan")]
head(survey)
cor(survey$handspan, survey$height, use = "complete.obs")
cor(survey, use = "complete.obs")
cov(survey$handspan, survey$height, use = "complete.obs")
cov(survey, use = "complete.obs")
lm(height ~ handspan, data = survey)
lm(handspan ~ height, data = survey)
plot(handspan ~ height, data = survey)
plot(handspan ~ height, data = survey)
abline(coefficients(lm(handspan ~ height, data = survey)))
plot(handspan ~ height, data = survey)
abline(coefficients(lm(handspan ~ height, data = survey)))
abline(v = mean(survey$height, na.rm = TRUE), col = "red", lty = 2)
abline(h = mean(survey$handspan, na.rm = TRUE), col = "red", lty = 2)
x <- seq(from = 0, to = 1, by = 0.1)
y <- x^2
plot(y ~ x)
abline(a = 0, b = 1)
#Exercise #1 - Regression
lm(height ~ handedness, data = survey)
plot(height ~ handedness, data = survey)
abline(coefficients(lm(height ~ handedness, data = survey)))
abline(v = mean(survey$handedness, na.rm = TRUE), col = "red", lty = 2)
abline(h = mean(survey$height, na.rm = TRUE), col = "red", lty = 2)
z.score <- function(x){
  z <- (x - mean(x, na.rm = TRUE))/sd(x, na.rm = TRUE)
  return(z)
}
foo <- c(1, 3, NA, 3, 0, NA)
is.na(foo)
foo[1:2]
foo[c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE)]
foo[is.na(foo)]
!is.na(foo)
foo[!is.na(foo)]
foo <- foo[!is.na(foo)]
mymean <- function(x){
  x <- x[!is.na(x)]
  x.bar <- sum(x)/length(x)
  return(x.bar)
}
mean(survey$height, na.rm = TRUE)
mymean(survey$height)
mymean2 <- function(x){
  x.bar <- sum(x, na.rm = TRUE)/length(x)
  return(x.bar)
}
mymean2(survey$height)
myvar <- function(x){
  x <- x[!is.na(x)]
  s.squared <- sum((x-mymean(x))^2)/(length(x) - 1)
  return(s.squared)
}
var(survey$handspan, na.rm = TRUE)
myvar(survey$handspan)
#Exercise #2 - Write a Function to Calculate Skewness
skew <- function(x){
  
  x <- x[!is.na(x)]
  
  numerator <- sum((x - mean(x))^3)/length(x)
  denominator <- sd(x)^3
    
  return(numerator/denominator)  
  
}
skew(survey$handedness)
summary.stats <- function(x){
  
  x <- x[!is.na(x)]
  sample.mean <- mean(x)
  std.dev  <- sd(x)
  
  out <- data.frame(sample.mean, std.dev)
  return(out)
}
results <- summary.stats(survey$handedness)
results
results$sample.mean
results$std.dev
mycov <- function(x, y){
  
  keep <- !is.na(x) & !is.na(y)
  x <- x[keep]
  y <- y[keep]
  
  n <- length(x)
  
  s.xy <- sum( (x - mean(x)) * (y - mean(y)) ) / (n-1)
  return(s.xy)
  
}
cov(survey$handspan, survey$handedness, use = "complete.obs")
mycov(survey$handspan, survey$handedness)
x <- c(1, 2, NA, 3)
y <- c(5, NA, 6, 0)
!is.na(x)
!is.na(y)
keep <- !is.na(x) & !is.na(y)
keep
x[keep]
y[keep]
#Exercise #3 - Write a Function to Carry Out Linear Regression
myreg <- function(y, x){
  
  keep <- !is.na(x) & !is.na(y)
  x <- x[keep]
  y <- y[keep]
  
  b <- cov(x,y)/var(x)
  a <- mean(y) - b * mean(x)
    
  out <- data.frame(a, b)
  return(out)
  
}
lm(height ~ handspan, data = survey)
myreg(y = survey$height, x = survey$handspan)
library(Quandl)
library(zoo)
apple.prices <- Quandl('GOOG/NASDAQ_AAPL', start_date = '2012-01-01', end_date = '2012-12-31', type = 'zoo')
head(apple.prices)
plot(apple.prices)
plot(apple.prices$Close, main = 'Daily Closing Prices: Apple Computer - 2012', xlab = 'Date', ylab = 'Price')
foo <- c(1,2,4,7,11)
diff(foo)
apple.returns <- diff(log(apple.prices$Close))
plot(apple.returns, main = 'Apple Computer - 2012', xlab = 'Date', ylab = 'Log Daily Returns', col = 'blue')
mean(apple.returns)
sd(apple.returns)
mean(apple.returns) * 100
sd(apple.returns) * 100
sum(apple.returns)
hist(apple.returns) 
mean(apple.returns)
median(apple.returns)
#Exercise #4 - Are Apple Returns Skewed?
skew(apple.returns)
#Exercise #5 - Repeat the Above for IBM Returns
ibm.prices <- Quandl("GOOG/NYSE_IBM", start_date = "2012-01-01", end_date = "2012-12-31", type = "zoo")
head(ibm.prices)
plot(ibm.prices)
plot(ibm.prices$Close, main = "Daily Closing Prices: IBM - 2012", xlab = "Date", ylab = "Price")
ibm.returns <- diff(log(ibm.prices$Close))
plot(ibm.returns, main = "IBM - 2012", xlab = "date", ylab = "Log Daily Returns", col = "Blue")
mean(ibm.returns)
sd(ibm.returns)
sum(ibm.returns)
hist(ibm.returns)
mean(ibm.returns)
median(ibm.returns)
skew(ibm.returns)
#Exercise #6 - Correlations between Returns
boa.prices <- Quandl("GOOG/NYSE_BAC", start_date = "2012-01-01", end_date = "2012-12-31", type = "zoo")
boa.returns <- diff(log(boa.prices$Close))
cor(boa.returns, apple.returns)
cor(apple.returns, ibm.returns)
cor(boa.returns, ibm.returns)
