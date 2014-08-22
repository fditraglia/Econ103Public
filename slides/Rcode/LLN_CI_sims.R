#setwd("/Users/fditra/Dropbox/Econ103/Homework/Homework2")
setwd("/Users/fditraglia/Dropbox/Econ103/Homework/Homework2")

data <- read.csv("survey_cleaned_fall2012.csv", header = TRUE)

height <- data$height
height <- height[!is.na(height)]


plot(table(height)/length(height), xlab = 'Height in Inches', ylab = 'Relative Frequency')

title.summary <- function(x){
  
  paste('Mean = ', round(mean(x), 1), ', Var = ', round(var(x), 1), sep = '')
  
}#END title.summary


hist(height, prob = TRUE, main = paste('Popn. Mean = ', round(mean(height),1), ', Popn. Var. = ', round(var(height), 1), sep = ''), xlab = 'Height in Inches', ylab = 'Histogram Density')

sample.mean <- function(n){
  
  random.sample <- sample(height, size = n, replace = FALSE)
  x.bar <- mean(random.sample)
  return(x.bar)
  
}#END sample.mean


set.seed(2985)




#Number of simulation replications
M <- 10000

x.bar.5 <- replicate(M, sample.mean(5))
x.bar.10 <- replicate(M, sample.mean(10))
x.bar.20 <- replicate(M, sample.mean(20))
x.bar.50 <- replicate(M, sample.mean(50))

mean(height)
var(height)

mean(x.bar.5)
mean(x.bar.10)
mean(x.bar.20)

var(x.bar.5)
var(x.bar.10)
var(x.bar.20)



par(mfrow = c(2,2))
hist(x.bar.5, xlab = 'n = 5', main = title.summary(x.bar.5), ylab = '')
hist(x.bar.10, xlab = 'n = 10', main = title.summary(x.bar.10), ylab = '')
hist(x.bar.20, xlab = 'n = 20', main = title.summary(x.bar.20), ylab = '')
hist(x.bar.50, xlab = 'n = 50', main = title.summary(x.bar.50), ylab = '')
par(mfrow = c(1,1))


#####################
#Illustration of Law of Large Numbers
x <- rnorm(10000, sd = 10)
x.bar.n <- cumsum(x)/(1:length(x))


# Move the labels closer
plot(x.bar.n, type = 'l', xlab = 'n', ylab = expression(bar(X)[n]), mgp = c(2.5, 1, 0))
abline(h = 0, lty = 2, col = 'red', lwd = 2)

enn <- c(1, 2, 3, 4, 5, 10, 20, 50, 100, 500, 1000, 5000, 10000)
y <- round(x.bar.n[enn], 2)
cbind(enn, y)

#########################
#Alternative Illustration of Law of Large Numbers
x <- seq(from = -4, to = 4, by = 0.01)

f.1 <- dnorm(x)
f.10 <- dnorm(x, mean = 0, sd = 1/sqrt(10))
f.50 <- dnorm(x, mean = 0, sd = 1/sqrt(50))
f.100 <- dnorm(x, mean = 0, sd = 1/sqrt(100))

ymax <- max(f.100)

par(mfrow = c(2,2), mar = c(4.1, 3.1, 3.1, 1.1)-0.1)

plot(x, f.1, type = 'l', bty = 'n', ylab = '', ylim = c(0, ymax), xlab = 'n = 1')

plot(x, f.10, type = 'l', bty = 'n', ylab = '', ylim = c(0, ymax), xlab = 'n = 10')

plot(x, f.50, type = 'l', bty = 'n', ylab = '', ylim = c(0, ymax), xlab = 'n = 50')

plot(x, f.100, type = 'l', bty = 'n', ylab = '', ylim = c(0, ymax), xlab = 'n = 100')


par(mfrow = c(1,1), mar = c(5.1, 4.1, 4.1, 2.1)) 


#####################
#Simulation example for normal confidence interval, variance known
#Try with right and wrong variances!


  
alpha <- 0.05
m.0 <- 0
s.0 <- 1
n <- 5
reps <- 20

#Generate all the samples in one step and then arrange in a matrix
sims <- rnorm(n * reps, mean = m.0, sd = s.0)
sims <- matrix(sims, ncol = reps, nrow = n) #each column is a replication
x.bar <- apply(sims, 2, mean)
SE <- s.0/sqrt(n)

z <- qnorm(1 - alpha/2)
lower <- x.bar - z * SE
upper <- x.bar + z * SE

plot(x.bar, seq_along(x.bar), xlim = c(min(lower), max(upper)), ylab = '', pch = 20, yaxt = 'n', bty = 'n', ylim = c(0, reps), col = 'blue', xlab = expression(bar(X)[n]))
abline(v = m.0, lty = 2, lwd = 2, col = 'red')
segments(y0 = seq_along(lower), y1 = seq_along(lower), x0 = lower, x1 = upper, col = 'blue')

