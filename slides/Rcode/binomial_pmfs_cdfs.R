#These figures are for Lecture #9 - Discrete RVs II

bpmf <- function(n, p){
  
  x <- 0:n
  y <- dbinom(x, size = n, prob = p)
  plot(x, y, xlab = 'x', ylab = 'p(x)', main = bquote(list(n == .(n), p == .(p))), type = 'h')

}

par(mfrow = c(3,3))
bpmf(n = 5, p = 0.5)
bpmf(n = 5, p = 0.8)
bpmf(n = 5, p = 0.2)
bpmf(n = 10, p = 0.5)
bpmf(n = 10, p = 0.8)
bpmf(n = 10, p = 0.2)
bpmf(n = 20, p = 0.5)
bpmf(n = 20, p = 0.8)
bpmf(n = 20, p = 0.2)
par(mfrow = c(1,1))


bcdf<- function(n, p){
  
  x <- seq(from = -1, to = (n+1), by = 0.1)
  y <- pbinom(x, size = n, prob = p)
  plot(x, y, xlab = 'x', ylab = 'F(x)', main = bquote(list(n == .(n), p == .(p))), type = 'S')
  
}


par(mfrow = c(3,3))
bcdf(n = 5, p = 0.5)
bcdf(n = 5, p = 0.8)
bcdf(n = 5, p = 0.2)
bcdf(n = 10, p = 0.5)
bcdf(n = 10, p = 0.8)
bcdf(n = 10, p = 0.2)
bcdf(n = 20, p = 0.5)
bcdf(n = 20, p = 0.8)
bcdf(n = 20, p = 0.2)
par(mfrow = c(1,1))



