x <- seq(-5, 5, 0.001)
fx <- dnorm(x)
alpha <- 0.05
c1_lower <- qnorm(alpha)
c1_upper <- qnorm(1 - alpha)
c2 <- qnorm(1 - alpha/2)

par(mfrow = c(1, 3))

plot(x, fx, ylab = 'dnorm(x)', type = 'l', lwd = 2, main = "Two-Sided Test")
abline(v = c2, lty = 2, lwd = 2, col = 'red')
abline(v = -c2, lty = 2, lwd = 2, col = 'red')
d <- 0.4
text((1 + d) * c2, (1 + d) * dnorm(c2), '2.5%', col = 'red')
text((1 + d) * -c2, (1 + d) * dnorm(-c2), '2.5%', col = 'red')

x_lower_2 <- x[x < -c2]
fx_lower_2 <- fx[x < -c2]
polygon(x = c(rev(x_lower_2), x_lower_2),
        y = c(rep(0, length(x_lower_2)), fx_lower_2), col = 'red')

x_upper_2 <- x[x > c2]
fx_upper_2 <- fx[x > c2]
polygon(x = c(rev(x_upper_2), x_upper_2),
        y = c(rep(0, length(x_upper_2)), fx_upper_2), col = 'red')


plot(x, fx, ylab = 'dnorm(x)', type = 'l', lwd = 2, main = "One-Sided Test (<)")
abline(v = c1_lower, lty = 2, lwd = 2, col = 'red')
text((1 + d) * c1_lower, (1 + d) * dnorm(c1_lower), '5%', col = 'red')

x_lower_1 <- x[x < c1_lower]
fx_lower_1 <- fx[x < c1_lower]
polygon(x = c(rev(x_lower_1), x_lower_1),
        y = c(rep(0, length(x_lower_1)), fx_lower_1), col = 'red')


plot(x, fx, ylab = 'dnorm(x)', type = 'l', lwd = 2, main = "One-Sided Test (>)")
abline(v = c1_upper, lty = 2, lwd = 2, col = 'red')
text((1 + d) * c1_upper, (1 + d) * dnorm(c1_upper), '5%', col = 'red')

x_upper_1 <- x[x > c1_upper]
fx_upper_1 <- fx[x > c1_upper]
polygon(x = c(rev(x_upper_1), x_upper_1),
        y = c(rep(0, length(x_upper_1)), fx_upper_1), col = 'red')


par(mfrow = c(1, 1))
