#Function to draw a single Chi-squared random variable with degrees of freedom equal to df
my.rchisq <- function(df){
  
  #Draw df independent standard normals
  normal.sims <- rnorm(df)
  
  #Square them and sum the result
  chi.sims <- sum(normal.sims^2)
  
}  

sims <- replicate(10000, my.rchisq(1))
hist(sims, probability = TRUE)
x <- seq(from = 0, to = max(sims), by = 0.01)
points(x, dchisq(x, df = 1), type = 'l', col = 'red')
sims <- replicate(10000, my.rchisq(5))
hist(sims, probability = TRUE)
x <- seq(from = 0, to = max(sims), by = 0.01)
points(x, dchisq(x, df = 5), type = 'l', col = 'red')
my.rt <- function(df){
 
  numerator <- rnorm(1)
  denominator <- sqrt( my.rchisq(df) / df )
  
  t.sim <- numerator/denominator
  return(t.sim)
  
}
sims <- replicate(10000, my.rt(1))
hist(sims, probability = TRUE)
x <- seq(from = min(sims), to = max(sims), by = 0.01)
points(x, dt(x, df = 1), type = 'l', col = 'red')
sims <- subset(sims, -6 <= sims & sims <= 6)
hist(sims, probability = TRUE)
x <- seq(from = min(sims), to = max(sims), by = 0.01)
points(x, dt(x, df = 1), type = 'l', col = 'red')
sims <- replicate(10000, my.rt(30))
hist(sims, probability = TRUE)
x <- seq(from = min(sims), to = max(sims), by = 0.01)
points(x, dt(x, df = 30), type = 'l', col = 'red')
my.rf <- function(numerator.df, denominator.df){

  numerator <- my.rchisq(numerator.df) / numerator.df
  denominator <- my.rchisq(denominator.df) / denominator.df
  
  f.sim <- numerator / denominator
  return(f.sim)
  
}
sims <- replicate(10000, my.rf(5,40))
hist(sims, probability = TRUE)
x <- seq(from = 0, to = max(sims), by = 0.01)
points(x, df(x, df1 = 5, df2 = 40), type = 'l', col = 'red')
