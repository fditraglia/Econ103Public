library(scatterplot3d)

joint.dist <- function(p.mat, support.x, support.y){
  
  if(sum(p.mat) != 1){return("Error: joint distribution should sum to 1!")}
  
  
  x <- rep(support.x, length(support.y))
  y <- rep(support.y, each = length(support.x))
  p <- as.vector(p.mat) #Stacks by column
  
  p.xy <- data.frame(x, y, p)
  
  
  
  
  scatterplot3d(p.xy, axis = TRUE, color = 'red', lab =c(length(support.x), length(support.y)), angle=40, pch=20, type="h", zlab = 'p(x,y)', lwd = 3, y.margin.add = 0.1, col.grid = 'gray', col.axis = 'gray')
  
  
  #Marginal Distributions
  p.x <- data.frame(x = support.x, p = rowSums(p.mat))
  p.y <- data.frame(y = support.y, p = colSums(p.mat))
  
  #Conditional Distributions
  p.x.given.y <- apply(p.mat, 2, function(x){x/sum(x)})
  p.x.given.y <- data.frame(support.x, p.x.given.y)
  names(p.x.given.y) <- c('x', paste('y=', support.y, sep = ''))
  
  p.y.given.x <- apply(p.mat, 1, function(x){x/sum(x)})
  p.y.given.x <- data.frame(support.y, p.y.given.x)
  names(p.y.given.x) <- c('y', paste('x=', support.x, sep = ''))
  
  #Covariance
  E.x <- sum(apply(p.x, 1, prod))
  E.y <- sum(apply(p.y, 1, prod))
  E.xy <- sum(apply(p.xy, 1, prod))
  Cov.xy <- E.xy - E.x * E.y
  
  out <- list(p.x = p.x, p.y = p.y, p.x.given.y = p.x.given.y, p.y.given.x = p.y.given.x, E.x = E.x, E.y = E.y, Cov.xy = Cov.xy)
  return(out)
  
}#END joint.dist


support.x <- 0:3
support.y <- 1:3


p.mat <- matrix(NA, ncol = length(support.y), nrow = length(support.x))
p.mat[1,] <- c(1/8, 0, 0)
p.mat[2,] <- c(0, 2/8, 1/8)
p.mat[3,] <- c(0, 2/8, 1/8)
p.mat[4,] <- c(1/8, 0, 0)


joint.dist(p.mat, support.x, support.y)




support.x <- 0:2
support.y <- 0:1
p.mat <- matrix(NA, ncol = length(support.y), nrow = length(support.x))
p.mat[1,] <- c(0.2, 0)
p.mat[2,] <- c(0.4, 0.2)
p.mat[3,] <- c(0, 0.2)

joint.dist(p.mat, support.x, support.y)



