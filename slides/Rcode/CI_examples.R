#####################
#Simulation example for normal confidence interval, variance known
#Try with right and wrong variances!


set.seed(4365)

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


#Sideways version
plot(seq_along(x.bar), x.bar, ylim = c(min(lower), max(upper)), xlab = '', pch = 20, xaxt = 'n', bty = 'n', xlim = c(0, reps), col = 'blue', ylab = expression(bar(X)[n]))
abline(h = m.0, lty = 2, lwd = 2, col = 'red')
segments(x0 = seq_along(lower), x1 = seq_along(lower), y0 = lower, y1 = upper, col = 'blue')

#Example of creating a confidence interval for the mean when the sd is known
data <- rnorm(100) + 5
mean(data)

#Wider and narrower intervals
qnorm(1 - 0.1/2)
qnorm(1 - 0.05/2)
qnorm(1 - 0.01/2)

#Middle 100*(1-alpha)% of Std Normal with tail probabilities
normal.tail.plot <- function(alpha){

  x <- seq(from = -4, to = 4, by = 0.01)
  z <- dnorm(x)
  plot(x, z, type = 'l', bty = 'n', ylab = 'f(x)')
  x.shade <- seq(from = qnorm(alpha/2), to = qnorm((1-alpha/2)), by = 0.01)
  y.shade <- dnorm(x.shade)
  polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'blue', density = 10)
  x.shade <- seq(from = qnorm(1-alpha/2), to = 4, by = 0.01)
  y.shade <- dnorm(x.shade)
  polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'red', density = 10, angle = 135)
  x.shade <- seq(from = -4, to = qnorm(alpha/2), by = 0.01)
  y.shade <- dnorm(x.shade)
  polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'red', density = 10, angle = 135)
  
}#END normal.tail.plot

normal.tail.plot(0.05)


#Middle 100*(1-alpha)% of chi-square with tail probabilities
chisq.tail.plot <- function(alpha, nu){
  
  x <- seq(from = 0, to = 5*nu, by = 0.01)
  f.x <- dchisq(x, df = nu)
  plot(x, f.x, type = 'l', bty = 'n', ylab = 'f(x)')
  x.shade <- seq(from = qchisq(alpha/2, df = nu), to = qchisq((1-alpha/2), df = nu), by = 0.01)
  y.shade <- dchisq(x.shade, df =nu)
  polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'blue', density = 10)
  x.shade <- seq(from = qchisq(1-alpha/2, df = nu), to = 5*nu, by = 0.01)
  y.shade <- dchisq(x.shade, df = nu)
  polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'red', density = 10, angle = 135)
  x.shade <- seq(from = 0, to = qchisq(alpha/2, df = nu), by = 0.01)
  y.shade <- dchisq(x.shade, df = nu)
  polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'red', density = 10, angle = 135)
  
}#END chisq.tail.plot

chisq.tail.plot(0.1, 7)

#Example of CI for chisq
n <- 100
data <- rnorm(n, mean = 5, sd = 2)
s2 <- var(data)
alpha <- 0.05
a <- qchisq(alpha/2, df = n - 1)
b <- qchisq((1 - alpha/2), df = n-1)
c(a,b)

lower <- ((n-1) * s2)/b
upper <- ((n-1) * s2)/a
c(lower, upper)


#Middle 100*(1-alpha)% of t dist with tail probabilities
t.tail.plot <- function(alpha, nu){
  x <- seq(from = -4, to = 4, by = 0.01)
  z <- dt(x, df = nu)
  plot(x, z, type = 'l', bty = 'n', ylab = 'f(x)')
  x.shade <- seq(from = qt(alpha/2, df = nu), to = qt((1-alpha/2), df = nu), by = 0.01)
  y.shade <- dt(x.shade, df = nu)
  polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'blue', density = 10)
  x.shade <- seq(from = qt(1-alpha/2, df = nu), to = 4, by = 0.01)
  y.shade <- dt(x.shade, df = nu)
  polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'red', density = 10, angle = 135)
  x.shade <- seq(from = -4, to = qt(alpha/2, df = nu), by = 0.01)
  y.shade <- dt(x.shade, df = nu)
  polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'red', density = 10, angle = 135)
  
}#END t.tail.plot
t.tail.plot(0.1, nu = 5)
t.tail.plot(0.05, nu = 5)

#Comparison of qnorm and qt for various values of nu
nu <- c(1, 5, 10, 30, 100, Inf)
a.1 <- qt(1 - 0.01/2, df = nu)
a.5 <- qt(1 - 0.05/2, df = nu)
a.10 <- qt(1 - 0.1/2, df = nu)
tab <- cbind(nu, a.10, a.5, a.1)
round(tab, 2)

