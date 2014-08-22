coin.power <- function(a, p, n){
  c <-  qnorm(1 - a/2)  
  mu <- sqrt(n) * (2 * p - 1) 	
  sigma <- sqrt(4 * p * (1 - p))
  
  less.than <- pnorm( -c, mean = mu, sd = sigma)
  greater.than <- 1 - pnorm(c, mean = mu, sd = sigma)
  power <- less.than + greater.than
  return(power)
}

coin.power(a = 0.05, p = 0.55, n = 100)
coin.power(a = 0.05, p = 0.55, n = 1000)
coin.power(a = 0.1, p = 0.55, n = 100)
coin.power(a = 0.05, p = 0.6, n = 100)


alternatives <- seq(from = 0, to = 1, by = 0.001)
power <- coin.power(a = 0.05, alternatives, n = 10)
plot(alternatives, power, xlab = 'True p', ylab = 'Power', type = 'l')


#Vary sample size for fixed significance level
n10 <- coin.power(0.05, alternatives, n = 10)
n50 <- coin.power(0.05, alternatives, n = 50)
n250 <- coin.power(0.05, alternatives, n = 250)
plot(alternatives, n10, type = 'l', xlab = 'True p', ylab = 'Power', main = '5% Significance Level', col = 'red', lwd = 3)
points(alternatives, n50, type = 'l', lty = 2, col = 'blue', lwd = 3)
points(alternatives, n250, type = 'l', lty = 3, col = 'orange', lwd = 3)
legend("bottomright", c('n = 10',  'n = 50', ' n = 250'), lty = 1:3, col = c('red', 'blue', 'orange'), lwd = 3, cex = 0.8)

#Vary significance level for fixed sample size
a01 <- coin.power(0.01, alternatives, n = 50)
a05 <- coin.power(0.05, alternatives, n = 50)
a10 <- coin.power(0.1, alternatives, n = 50)
plot(alternatives, a01, type = 'l', xlab = 'True p', ylab = 'Power', main = 'Sample Size of 50 Observations', col = 'red', lwd = 3)
points(alternatives, a05, type = 'l', lty = 2, col = 'blue', lwd = 3)
points(alternatives, a10, type = 'l', lty = 3, col = 'orange', lwd = 3)
legend("bottomright", c('1% Level' ,  '5% Level', '10% Level'), lty = 1:3, col = c('red', 'blue', 'orange'), lwd = 3, cex = 0.8)


