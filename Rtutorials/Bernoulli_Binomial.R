#This function simulates n independent, identically distributed Bernoulli Random Variables
rbern <- function(n, p){
  
  sims <- sample(0:1, size = n, replace = TRUE, prob = c(1-p, p))
  return(sims)
  
}
rbern(30, 0.1)
rbern(30, 0.5)
rbern(30, 0.9)
#This function simulates n independent, identically distributed Bernoulli Random Variables and returns their sum
rbern.sum <- function(n, p){
  
  sims <- rbern(n, p)
  return(sum(sims))
  
}
rbern.sum(50, 0.1)
rbern.sum(50, 0.5)
rbern.sum(50, 0.9)
binom.sims <- replicate(10^5, rbern.sum(10, 0.5))
head(binom.sims)
p.sim <- table(binom.sims)/10^5
p.sim
plot(p.sim, type = 'h')
support <- 0:10
p.true <- dbinom(support, size = 10, prob = 0.5)
rbind(support, p.true)
plot(support, p.true, type = 'h')
p.sim - p.true
