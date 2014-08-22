x <- seq(from = -4, to = 4, by = 0.01)
z <- dnorm(x)
Phi <- pnorm(x)

#Standard Normal PDF
plot(x, z, type = 'l', bty = 'n', ylab = 'f(x)')

#Standard Normal CDF
plot(x, Phi, type = 'l', bty = 'n', ylab = 'F(x)')


#Middle 95%
plot(x, z, type = 'l', bty = 'n', ylab = 'f(x)')
#abline(v = 0, lty = 2)
x.shade <- seq(from = -2, to = 2, by = 0.01)
y.shade <- dnorm(x.shade)
polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'blue', density = 10)


#Middle 68%
plot(x, z, type = 'l', bty = 'n', ylab = 'f(x)')
#abline(v = 0, lty = 2)
x.shade <- seq(from = -1, to = 1, by = 0.01)
y.shade <- dnorm(x.shade)
polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'blue', density = 10)


#Median
plot(x, z, type = 'l', bty = 'n', ylab = 'f(x)')
abline(v = 0, lty = 2)
x.shade <- seq(from = -4, to = 0, by = 0.01)
y.shade <- dnorm(x.shade)
polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'blue', density = 10)


#90th percentile
plot(x, z, type = 'l', bty = 'n', ylab = 'f(x)')
abline(v = qnorm(0.9), lty = 2)
x.shade <- seq(from = -4, to = qnorm(0.9), by = 0.01)
y.shade <- dnorm(x.shade)
polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'blue', density = 10)


#Middle 68% in two steps
plot(x, z, type = 'l', bty = 'n', ylab = 'f(x)')
x.shade <- seq(from = -4, to = 1, by = 0.01)
y.shade <- dnorm(x.shade)
polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'blue', density = 10)
x.shade <- seq(from = -4, to = -1, by = 0.01)
y.shade <- dnorm(x.shade)
polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'red', density = 10, angle = 135)


#Tail Probabilities
plot(x, z, type = 'l', bty = 'n', ylab = 'f(x)')
x.shade <- seq(from = -4, to = qnorm(0.75), by = 0.01)
y.shade <- dnorm(x.shade)
polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'blue', density = 10)
x.shade <- seq(from = qnorm(0.75), to = 4, by = 0.01)
y.shade <- dnorm(x.shade)
abline(v = qnorm(0.75), lty = 2)
polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'red', density = 10, angle = 135)

#Middle 50% with tail probabilities
plot(x, z, type = 'l', bty = 'n', ylab = 'f(x)')
x.shade <- seq(from = -qnorm(0.75), to = qnorm(0.75), by = 0.01)
y.shade <- dnorm(x.shade)
polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'blue', density = 10)
x.shade <- seq(from = qnorm(0.75), to = 4, by = 0.01)
y.shade <- dnorm(x.shade)
#abline(v = qnorm(0.75), lty = 2)
polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'red', density = 10, angle = 135)
x.shade <- seq(from = -4, to = -qnorm(0.75), by = 0.01)
y.shade <- dnorm(x.shade)
#abline(v = -qnorm(0.75), lty = 2)
polygon( c(x.shade, rev(x.shade)), c(y.shade, rep(0, length(y.shade))), col = 'red', density = 10, angle = 135)

#Various normal means
y1 <- dnorm(x, mean = 1, sd = 1)
y2 <- dnorm(x, mean = -1, sd = 1)
plot(x, y1, type = 'l', bty = 'n', ylab = 'f(x)', col = 'red')
points(x, z, type = 'l', col = 'black')
points(x, y2, type = 'l', col = 'blue')
legend("topleft", legend = c(expression(mu == '-1'), expression(mu == '0'), expression(mu == '1')), fill = c('blue', 'black', 'red'))

#Various std devs
y1 <- dnorm(x, sd = 1/2)
y2 <- dnorm(x, sd = 2)
plot(x, y1, type = 'l', bty = 'n', ylab = 'f(x)', col = 'red')
points(x, z, type = 'l', col = 'black')
points(x, y2, type = 'l', col = 'blue')
legend("topleft", legend = c(expression(sigma == '2'), expression(sigma == '1'), expression(sigma == '1/2')), fill = c('blue', 'black', 'red'))

#Density above 1!
y3 <- dnorm(x, sd = 1/4)
plot(x, y3, type = 'l', bty = 'n', ylab = 'f(x)')
legend('topright', expression(sigma == '0.25'))



#t-distributions
t.1 <- dt(x, df = 1)
t.3 <- dt(x, df = 3)
t.5 <- dt(x, df = 5)
plot(x, z, type = 'l', lty = 2, bty = 'n', ylab = 'f(x)')
points(x, t.3, type = 'l', col = 'red')
points(x, t.1, type = 'l', col = 'blue')
legend('topright', legend = c(expression(nu == infinity), expression(nu == '3'), expression(nu == '1')), fill = c('black', 'red', 'blue'))

#Chi-squared distribution
x.chi <- seq(from = 0, to = 35, by = 0.1)
chi4 <- dchisq(x.chi, df = 4)
chi10 <- dchisq(x.chi, df = 10)
chi20 <- dchisq(x.chi, df = 20)
plot(x.chi, chi4, type = 'l', ylab = 'f(x)', bty = 'n', xlab = 'x')
legend('topright', legend = c(expression(nu == '4'), expression(nu == '10'), expression(nu == '20')), fill = c('black', 'red', 'blue'))
points(x.chi, chi10, type = 'l', col = 'red')
points(x.chi, chi20, type = 'l', col = 'blue')



#F distribution
x.F <- seq(from = 0, to = 5, by = 0.01)
F4.40 <- df(x.F, df1 = 4, df2 = 40)
F10.40 <- df(x.F, df1 = 10, df2 = 40)
F40.40 <- df(x.F, df1 = 40, df2 = 40)
plot(x.F, F40.40, type = 'l', ylab = 'f(x)', bty = 'n', xlab = 'x', col = 'blue')
points(x.F, F10.40, type = 'l', col = 'red')
points(x.F, F4.40, type = 'l', col = 'black')
legend('topright', legend = c(expression(nu == '4, ' ~ omega == '40'), expression(nu == '10, ' ~ omega == '40'), expression(nu == '40 ' ~ omega == '40')), fill = c('black', 'red', 'blue'))
