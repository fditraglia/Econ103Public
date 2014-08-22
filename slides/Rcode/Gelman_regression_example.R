#Gelman's Regression Example
x1 <- c(1, 2, 3)
y1 <- c(1, 2, 3)

x2 <- c(1, 1, 2)
y2 <- c(1, 2, 2)

x3 <- c(1, 1, 2, 2) 
y3 <- c(1, 2, 1, 2)

x4 <- c(1, 2, 3, 3, 4, 5)
y4 <- c(2, 3, 1, 3, 2, 3)

op <- par()
par(mfrow = c(2,2))

plot(x1, y1, xlim = c(0,3), ylim = c(0,3), bty = 'n', ylab = '', xlab = '', axes = FALSE, cex = 1.3)
axis(side = 1, at = c(0, 1, 2, 3))
axis(side = 2, at = c(0, 1, 2, 3))
abline(v = mean(x1), lty = 2, col = 'red')
abline(h = mean(y1), lty = 2, col = 'red')
points(x1, y1, pch = 4, col = 'red', cex = 1.5, lwd = 2)
abline(lm(y1 ~ x1), col = 'blue', lwd = 2)


plot(x2, y2, xlim = c(0,3), ylim = c(0,3), bty = 'n', ylab = '', xlab = '', axes = FALSE, cex = 1.3)
axis(side = 1, at = c(0, 1, 2, 3))
axis(side = 2, at = c(0, 1, 2, 3))
abline(v = mean(x2), lty = 2, col = 'red')
abline(h = mean(y2), lty = 2, col = 'red')
points(c(1,2), c(1.5, 2), pch = 4, col = 'red', cex = 1.5, lwd = 2)
abline(lm(y2 ~ x2), col = 'blue', lwd = 2)


plot(x3, y3, xlim = c(0,3), ylim = c(0,3), bty = 'n', ylab = '', xlab = '', axes = FALSE, cex = 1.3)
axis(side = 1, at = c(0, 1, 2, 3))
axis(side = 2, at = c(0, 1, 2, 3))
abline(v = mean(x3), lty = 2, col = 'red')
abline(h = mean(y3), lty = 2, col = 'red')
points(c(1,2), c(1.5, 1.5), pch = 4, col = 'red', cex = 1.5, lwd = 2)
abline(lm(y3 ~ x3), col = 'blue', lwd = 2)


plot(x4, y4, xlim = c(0,6), ylim = c(0,4), bty = 'n', ylab = '', xlab = '', axes = FALSE, cex = 1.3)
axis(side = 1, at = c(0, 1, 2, 3, 4, 5, 6))
axis(side = 2, at = c(0, 1, 2, 3, 4))
abline(v = mean(x4), lty = 2, col = 'red')
abline(h = mean(y4), lty = 2, col = 'red')
points(c(1,2,3,4,5), c(2, 3, 2, 2, 3), pch = 4, col = 'red', cex = 1.5, lwd = 2)
abline(lm(y4 ~ x4), col = 'blue', lwd = 2)


par(op)





  