set.seed(2020)

N.sims <- 10000

#Chi-squared
x <- seq(from = 0 , to = 25, by = 0.01)
plot(x, dchisq(x, df = 5), type = 'l', bty = 'n', ylab = 'f(x)', main = 'Chi-squared(5) Population')

hist(replicate(N.sims, mean(rchisq(n = 20, df = 5))), xlab ='', ylab = '', main = 'Sample Mean - Chisq(5) Pop (n=20)')


#Uniform
x <- seq(from = 0 , to = 1, by = 0.01)
plot(x, rep(1, length(x)), type = 'l', bty = 'n', xlab = 'x', ylab = 'f(x)', ylim = c(0,1.5), main = 'Uniform Population')
segments(x0 = c(0,1), y0 = c(0,0), x1 = c(0,1), y1 = c(1,1), lty = 2)

hist(replicate(N.sims, mean(runif(20))), xlab = '', ylab = '', main = 'Sample Mean - Uniform Pop (n = 20)')



#Bernoulli
plot(0:1, c(0.7, 0.3), type = 'h',bty = 'n', xlab = 'x', ylab = 'p(x)', main = 'Bernoulli(0.3) Population', xlim = c(-1, 2), ylim = c(0,1))
hist(replicate(N.sims, rbinom(1, size = 20, 0.3)/n), xlab = '', ylab = '', main = 'Sample Mean - Ber(0.3) Pop (n = 20)')


#Situation where n isn't large enough
#For the approx of the binomial proportion to be good, need to have np(1-p) > 5
plot(0:1, c(0.1, 0.9), type = 'h',bty = 'n', xlab = 'x', ylab = 'p(x)', main = 'Bernoulli(0.9) Population', xlim = c(-1, 2), ylim = c(0,1))
hist(replicate(N.sims, rbinom(1, 20, 0.9)/20), xlab = '', ylab = '', main = 'Sample Mean - Ber(0.9) Pop (n = 20)')

hist(replicate(N.sims, rbinom(1, 100, 0.9)/100),  xlab = '', ylab = '', main = 'Sample Mean - Ber(0.9) Pop (n = 100)')


#n <- 100
#hist(replicate(N.sims, mean(runif(n))))
#hist(replicate(N.sims, mean(rchisq(n, df = 5))))
#hist(replicate(N.sims, rbinom(1, n, 0.5)/n))
#hist(replicate(N.sims, rbinom(1, n, 0.1)/n))
#hist(replicate(N.sims, rbinom(1, n, 0.9)/n))

