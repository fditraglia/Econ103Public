
#Calculate the power of a two-sided test for a population proportion
power <- function(n, p, p0 = 0.5, alpha = 0.05){

  SE <- sqrt(p * (1-p) / n)
  
  c.alpha <- qnorm(1 - alpha/2) 
  
  upper <- (p0 + (c.alpha * p0)/sqrt(n) - p) / SE
  lower <- (p0 - (c.alpha * p0)/sqrt(n) - p) / SE
  
  power <- pnorm(lower) + 1 - pnorm(upper)
  
  return(power)
  
}#END power

#Check against the book
power(n = 600, p = 0.55)

op <- par()

p1 <- seq(from = 0, to = 1, by = 0.001)

par(mfrow = c(2,2), oma = c(0,0,0,0), mar = c(5, 4, 2, 1))

plot(p1, power(n = 10, p1), type = 'l', xlab = '', ylab = 'Power', bty = 'n', main = 'n = 10')

plot(p1, power(n = 100, p1), type = 'l', xlab = '', ylab = '', bty = 'n', main = 'n = 100')

plot(p1, power(n = 500, p1), type = 'l', xlab = 'True p', ylab = 'Power', bty = 'n', main = 'n = 500')

plot(p1, power(n = 1000, p1), type = 'l', xlab = 'True p', ylab = '', bty = 'n', main = 'n = 1000')
par(op)

#Evaluate power at various sample sizes and alternatives
power.table <- function(p1, n){
  
  params <- expand.grid(p1, n)
  values <- round(mapply(power, n = params[,2], p = params[,1]),2)
  out <- matrix(values, nrow = length(p1), dimnames = list(paste('p=', p1, sep = ''), paste('n=', n, sep = '')))
  
  return(out)
  
}#END power.table

#``Fine'' power table around 0.5
p1 <- seq(from = 0.45, to = 0.55, by = 0.01)
n <- c(10,100, 500, 1000, 5000, 10000, 50000)
fine <- power.table(p1, n)

#``Coarse'' power table
p1 <- seq(from = 0.1, to = 0.9, by = 0.1)
n <- c(10, 20, 30, 40, 50)
coarse <- power.table(p1, n)

library(Hmisc)
latex(coarse)
latex(fine)



