#setwd("/Users/fditra/Dropbox/Econ103/Homework/Homework2")
setwd("/Users/fditraglia/Dropbox/Econ103/Homework/Homework2")

data <- read.csv("survey_cleaned_fall2012.csv", header = TRUE)

anchor <- data[,c('rand.num', 'africa.percent')]

lo <- subset(anchor, rand.num == 10)$africa.percent
hi <- subset(anchor, rand.num == 65)$africa.percent

n <- length(hi)
m <- length(lo)

diff <- mean(hi) - mean(lo)

se <- sqrt(var(hi)/length(hi) + var(lo)/length(lo))

ME <- 2 * se

LCL <- diff - ME
UCL <- diff + ME

CI <- c(LCL, UCL)

CI