







SE <- 5/sqrt(25)
ME <- qnorm(1 - 0.5/2) * SE
Lower <- 5 - ME
Upper <- 5 + ME
c(Lower, Upper)



SE <- 5/sqrt(25)
ME <- qnorm(1 - 0.01/2) * SE
Lower <- 5 - ME
Upper <- 5 + ME
c(Lower, Upper)



my.CI <- function(data, pop.sd, alpha){

  x.bar <- mean(data)
  n <- length(data)
  
  SE <- pop.sd / sqrt(n)
  ME <- qnorm(1 - alpha/2) * SE
  
  lower <- x.bar - ME
  upper <- x.bar + ME
  
  out <- c(lower, upper)
  return(out)
  
}



fake.data <- rep(0, 25)
my.CI(fake.data, pop.sd = 1, alpha = 0.05)



CI.sim <- function(sample.size){
    sims <- rnorm(sample.size)
    CI <- my.CI(sims, pop.sd = 1, alpha = 0.05)
    return(CI)
}
CI.sim(10)



simCIs <- replicate(10000, CI.sim(10))
simCIs[,1:5]
lower <- simCIs[1,]
upper <- simCIs[2,]
covers.truth <- (lower < 0) & (upper > 0) 
sum(covers.truth)/length(covers.truth)



CI.sim2 <- function(sample.size){
    sims <- rnorm(sample.size)
    CI <- my.CI(sims, pop.sd = 1/2, alpha = 0.05)
    return(CI)
}
simCIs <- replicate(10000, CI.sim2(10))
simCIs[,1:5]
lower <- simCIs[1,]
upper <- simCIs[2,]
covers.truth <- (lower < 0) & (upper > 0) 
sum(covers.truth)/length(covers.truth)


