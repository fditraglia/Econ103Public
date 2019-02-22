library(plotrix)
draw_dartboard <- function() {
  plot(NULL, xlim = c(-1, 1), ylim = c(-1,1), pty = 's', asp = 1, 
       axes = FALSE, xlab = '',  ylab = '')
  draw.circle(0, 0, 1)
  draw.circle(0, 0, 0.75, col = 'deep sky blue')
  draw.circle(0, 0, 0.5, col = 'red')
  draw.circle(0, 0, 0.25, col = 'yellow')
  draw.circle(0, 0, 0.02, col = 'black')
}

add_darts <- function(darts, mytitle = '') {
  points(darts, pch = 4, col = 'black', cex = 1, lwd = 1.5)
  title(main = mytitle)
}

par(mfrow = c(2, 2), mar=c(3,3,2,1), mgp=c(2,.7,0), tck= -.01, oma = c(0,0,0,0))

set.seed(54321)

A <- cbind(0.2 * rnorm(n) + 0.1 , 0.2 * rnorm(n) + 0.1)
draw_dartboard()
add_darts(A, 'Low Bias, Low Variance')


B <- cbind(runif(n, -1, 1), runif(n, -1, 1))
draw_dartboard()
add_darts(B, 'Low Bias, High Variance')


C <- cbind(0.1 * rnorm(n) - 0.6 , 0.1 * rnorm(n) + 0.5)
draw_dartboard()
add_darts(C, 'High Bias, Low Variance')

D <- cbind(runif(n, -1, 1) + 0.4, runif(n, -1, 1) - 0.6)
draw_dartboard()
add_darts(D, 'High Bias, High Variance')













