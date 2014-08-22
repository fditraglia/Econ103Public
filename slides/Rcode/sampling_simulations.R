setwd("/Users/fditra/Dropbox/Econ103/Homework/Homework2")
#setwd("/Users/fditraglia/Dropbox/Econ103/Homework/Homework2")

data <- read.csv("survey_cleaned_fall2012.csv", header = TRUE)

height <- data$height
height <- height[!is.na(height)]


plot(table(height)/length(height), xlab = 'Height in Inches', ylab = 'Relative Frequency')

title.summary <- function(x){
  
  paste('Mean = ', round(mean(x), 1), ', Var = ', round(var(x), 1), sep = '')
  
}#END title.summary


hist(height, prob = TRUE, main = paste('Popn. Mean = ', round(mean(height),1), ', Popn. Var. = ', round(var(height), 1), sep = ''), xlab = 'Height in Inches', ylab = 'Histogram Density')

sample.mean <- function(n){
  
  random.sample <- sample(height, size = n, replace = FALSE)
  x.bar <- mean(random.sample)
  return(x.bar)
  
}#END sample.mean


set.seed(2985)




#Number of simulation replications
M <- 10000

x.bar.5 <- replicate(M, sample.mean(5))
x.bar.10 <- replicate(M, sample.mean(10))
x.bar.20 <- replicate(M, sample.mean(20))
x.bar.50 <- replicate(M, sample.mean(50))

mean(height)
var(height)

mean(x.bar.5)
mean(x.bar.10)
mean(x.bar.20)

var(x.bar.5)
var(x.bar.10)
var(x.bar.20)



par(mfrow = c(2,2))
hist(x.bar.5, xlab = 'n = 5', main = title.summary(x.bar.5), ylab = '')
hist(x.bar.10, xlab = 'n = 10', main = title.summary(x.bar.10), ylab = '')
hist(x.bar.20, xlab = 'n = 20', main = title.summary(x.bar.20), ylab = '')
hist(x.bar.50, xlab = 'n = 50', main = title.summary(x.bar.50), ylab = '')
par(mfrow = c(1,1))


#####################
#Illustration of Law of Large Numbers
x <- rnorm(10000, sd = 10)
x.bar.n <- cumsum(x)/(1:length(x))


# Move the labels closer
plot(x.bar.n, type = 'l', xlab = 'n', ylab = expression(bar(X)[n]), mgp = c(2.5, 1, 0))
abline(h = 0, lty = 2, col = 'red', lwd = 2)

enn <- c(1, 2, 3, 4, 5, 10, 20, 50, 100, 500, 1000, 5000, 10000)
y <- round(x.bar.n[enn], 2)
cbind(enn, y)

#####################
#Verification of variance and mean of sample mean for some simple discrete example...





