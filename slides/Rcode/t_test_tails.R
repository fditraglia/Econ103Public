x <- seq(from = -6, to = 6, by = 0.01)
n <- 9
y <- dt(x, df = n-1)


c2 <- qt(0.975, df = n - 1)
c1 <- qt(0.95, df = n - 1)

reject2 <- seq(from = -6, to = -c2, by = 0.01)
accept2 <- seq(from = -c2, to = c2, by = 0.01)

reject1 <- seq(from = c1, to = 6, by = 0.01)
accept1 <- seq(from = -6, to = c1, by = 0.01)




op <- par()
par <- par(oma = c(0,0,0,0), mar = c(4, 4, 1, 2))
plot(x, y, bty = 'n', type = 'l', xlab = 'x', ylab = 'f(x)')
par(op)



op <- par()
par <- par(oma = c(0,0,0,0), mar = c(4, 4, 1, 2))
plot(x, y, bty = 'n', type = 'l', xlab = 'x', ylab = 'f(x)')

polygon( c(reject1, rev(reject1)), c(dt(reject1, df = n - 1), rep(0, length(reject1))), col = 'red', density = 10, angle = 135)

polygon( c(accept1, rev(accept1)), c(dt(accept1, df = n - 1), rep(0, length(accept1))), col = 'blue', density = 10, angle = 135)

par(op)




op <- par()
par <- par(oma = c(0,0,0,0), mar = c(4, 4, 1, 2))
plot(x, y, bty = 'n', type = 'l', xlab = 'x', ylab = 'f(x)')

polygon( c(reject2, rev(reject2)), c(dt(reject2, df = n - 1), rep(0, length(reject2))), col = 'red', density = 10, angle = 135)

polygon( c(-reject2, rev(-reject2)), c(dt(-reject2, df = n - 1), rep(0, length(reject2))), col = 'red', density = 10, angle = 135)

polygon( c(accept2, rev(accept2)), c(dt(accept2, df = n - 1), rep(0, length(accept2))), col = 'blue', density = 10, angle = 135)

par(op)



set.seed(1938)
sim <- rnorm(n, mean = 550, sd = 50)
mean(sim)
sd(sim)

test <- (mean(sim) - 550)/(sd(sim)/sqrt(n))


op <- par()
par <- par(oma = c(0,0,0,0), mar = c(4, 4, 1, 2))
plot(x, y, bty = 'n', type = 'l', xlab = 'x', ylab = 'f(x)')

abline(v = test, lty = 2)

temp <- seq(from = test, to = 6, by = 0.01)
temp2 <- seq(from = -6, to = test, by = 0.01)

polygon( c(temp, rev(temp)), c(dt(temp, df = n - 1), rep(0, length(temp))), col = 'red', density = 10, angle = 135)

polygon( c(temp2, rev(temp2)), c(dt(temp2, df = n - 1), rep(0, length(temp2))), col = 'blue', density = 10, angle = 135)

par(op)


op <- par()
par <- par(oma = c(0,0,0,0), mar = c(4, 4, 1, 2))
plot(x, y, bty = 'n', type = 'l', xlab = 'x', ylab = 'f(x)')

abline(v = test, lty = 2)

temp <- seq(from = test, to = 6, by = 0.01)
temp2 <- seq(from = -6, to = test, by = 0.01)

polygon( c(temp, rev(temp)), c(dt(temp, df = n - 1), rep(0, length(temp))), col = 'red', density = 10, angle = 135)

polygon( c(temp2, rev(temp2)), c(dt(temp2, df = n - 1), rep(0, length(temp2))), col = 'blue', density = 10, angle = 135)

par(op)

op <- par()
par <- par(oma = c(0,0,0,0), mar = c(4, 4, 1, 2))
plot(x, y, bty = 'n', type = 'l', xlab = 'x', ylab = 'f(x)')

abline(v = test, lty = 2)
abline(v = -test, lty = 2)
temp <- seq(from = test, to = 6, by = 0.01)
temp2 <- seq(from = -test, to = test, by = 0.01)

polygon( c(temp, rev(temp)), c(dt(temp, df = n - 1), rep(0, length(temp))), col = 'red', density = 10, angle = 135)


polygon( c(-temp, rev(-temp)), c(dt(-temp, df = n - 1), rep(0, length(-temp))), col = 'red', density = 10, angle = 135)

polygon( c(temp2, rev(temp2)), c(dt(temp2, df = n - 1), rep(0, length(temp2))), col = 'blue', density = 10, angle = 135)

par(op)



