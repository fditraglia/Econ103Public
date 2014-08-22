setwd("~/Dropbox/Econ103/Slides/R Scripts")

candy <- read.csv("candy_experiment_Spring2013.csv", header = FALSE)
candy <- candy * 20
candy <- as.vector(candy[,1])

#In class, the scale read 938 grams
actual <- 938

hist(candy, main = 'Histogram', xlab = 'Estimated Weight of All Candies (grams)')
abline(v = actual, col = 'red', lty = 2, lwd = 2)
mean(candy)
sd(candy)
length(candy)

sum(candy > actual)
sum(candy < actual)
sum(candy == actual)
sum(candy > actual)/length(candy)


bias <- mean(candy) - actual
var(candy)

bias
var(candy)
MSE <- bias^2 + var(candy)
MSE

round(bias)
round(var(candy))

#Actual Distribution:
#20 fun size Snickers - largest size
#30 Reese's cups - medium size
#50 Tootsie Rolls - smallest size




