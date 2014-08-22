setwd("/Users/fditra/Dropbox/Econ103/Homework/Homework2")
#setwd("/Users/fditraglia/Dropbox/Econ103/Homework/Homework2")

data <- read.csv("survey_cleaned_fall2012.csv", header = TRUE)

anchor <- data[,c('rand.num', 'africa.percent')]

lo <- subset(anchor, rand.num == 10)$africa.percent
hi <- subset(anchor, rand.num == 65)$africa.percent

n <- length(hi)
m <- length(lo)

diff <- mean(hi) - mean(lo)

SE <- sqrt(var(hi)/length(hi) + var(lo)/length(lo))

test.stat <- diff/SE
test.stat

#Various One-sided critical values
alpha <- c(0.1, 0.05, 0.01)
one.side <- qnorm(1 - alpha)
two.side <- qnorm(1 - alpha/2)

round(rbind(alpha, one.side, two.side),2)

#One-sided p-value
1 - pnorm(test.stat)

#Two-sided p-value
2 * (1 - pnorm(test.stat))

#The easy way...
t.test(hi, lo)