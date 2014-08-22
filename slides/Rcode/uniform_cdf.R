x <- seq(from = 0, to = 1, by = 0.01)
fx <- dunif(x, 0, 1)
Fx <- punif(x, 0, 1)

plot(x, fx, type = 'l', bty = 'n', ylab = 'f(x)', ylim = c(0,1))
lines(c(0,0), c(0,1), lty = 2)
lines(c(1,1), c(0,1), lty = 2)


abline(v = (0:15)/16, lty = 2, lwd = 2)

for(i in 1:4){
  
  ycoords <- c(0,1,1,0)
  
  inc <- 1/16
  g <- ((i - 1) * 4)/16
  r <- g + inc
  y <- r + inc
  b <- y + inc
  
  den <- 10
  
  polygon(c(g, g, g+inc, g+inc), ycoords, col = 'green', border = NA)
  polygon(c(r, r, r+inc, r+inc), ycoords, col = 'red', border = NA)
  polygon(c(y, y, y+inc, y+inc), ycoords, col = 'yellow', border = NA)
  polygon(c(b, b, b+inc, b+inc), ycoords, col = 'blue', border = NA)
  
}#END for



abline(v = 0.25, lty = 2, lwd = 2)
abline(v = 0.5, lty = 2, lwd = 2)
abline(v = 0.75, lty = 2, lwd = 2)
polygon(c(0,0,0.25,0.25), c(0,1,1,0), col = 'green', border = NA, angle = 45, density = 10)
polygon(c(0.25,0.25,0.5,0.5), c(0,1,1,0), col = 'red', border = NA, angle = 45, density = 10)
polygon(c(0.5,0.5,0.75,0.75), c(0,1,1,0), col = 'yellow', border = NA, angle = 45, density = 10)
polygon(c(0.75,0.75,1,1), c(0,1,1,0), col = 'blue', border = NA, angle = 45, density = 10)

#polygon(c(0,0,1,1), c(0,1,1,0), border = NA, angle = 45, density = 4)
#abline(v = 0.4, lty = 2, col = 'blue', lwd = 2)
#abline(v = 0.8, lty = 2, col = 'blue', lwd = 2)
#polygon(c(0,0,0.8,0.8), c(0,1,1,0), border = NA, angle = 45, density = 4, col = 'red')
#polygon(c(0,0,0.4,0.4), c(0,1,1,0), border = NA, angle = 135, density = 4)
#polygon(c(0.4,0.4,0.8,0.8), c(0,1,1,0), border = NA, angle = 45, density = 4, col = 'blue')
#polygon(c(0,0,0.4,0.4), c(0,1,1,0), border = NA, angle = 45, density = 4, col = 'red')


plot(x, Fx, type = 'l', bty = 'n', ylab = 'F(x)')