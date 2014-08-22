
## ----include=FALSE-------------------------------------------------------
knit_hooks$set(document=function(x){ 
  sub('\\usepackage{framed}', '', x, fixed=TRUE) 
}) 


## ----include=FALSE-------------------------------------------------------
opts_chunk$set(fig.width=4, fig.height=4, fig.align='center',dev='pdf')


## ----include=FALSE-------------------------------------------------------
options(width = 60)


## ------------------------------------------------------------------------
pnorm(10, mean = 12, sd = 2)


## ------------------------------------------------------------------------
pnorm(250, mean = 300, sd = 10)


## ------------------------------------------------------------------------
n <- 950:961
width <- 2 * qnorm(1 - 0.01/2) * 6/sqrt(n)
cbind(n, width)


## ------------------------------------------------------------------------
speed.data <- read.csv("http://www.ditraglia.com/econ103/speed.csv", header = FALSE)
speed.data <- speed.data[,1]
head(speed.data)


## ------------------------------------------------------------------------
n.speed <- length(speed.data)
a.speed <- qchisq(0.1/2, df = n.speed - 1)
b.speed <- qchisq(1 - 0.1/2, df = n.speed - 1)
LCL <- (n.speed - 1) * var(speed.data)/b.speed
UCL <- (n.speed - 1) * var(speed.data)/a.speed
c(LCL, UCL)


## ------------------------------------------------------------------------
LCL.mhr <- (n.speed - 1) * var(0.62 * speed.data)/b.speed
UCL.mhr <- (n.speed - 1) * var(0.62 * speed.data)/a.speed
c(LCL.mhr, UCL.mhr)


## ------------------------------------------------------------------------
data.url <- "http://www.ditraglia.com/econ103/sleep.csv"
sleep.data <- read.csv(data.url, header = FALSE)
sleep.data <- sleep.data[,1]
head(sleep.data)


## ------------------------------------------------------------------------
n.sleep <- length(sleep.data)
SE.sleep <- sd(sleep.data)/sqrt(n.sleep)
ME.sleep <- qt(1 - 0.05/2, df = n.sleep - 1) * SE.sleep
LCL <- mean(sleep.data) - ME.sleep
UCL <- mean(sleep.data) + ME.sleep
c(LCL, UCL)


## ------------------------------------------------------------------------
a.sleep <- qchisq(0.05/2, df = n.sleep - 1)
b.sleep <- qchisq(1 - 0.05/2, df = n.sleep - 1)
LCL <- (n.sleep - 1) * var(sleep.data)/b.sleep
UCL <- (n.sleep - 1) * var(sleep.data)/a.sleep
c(LCL, UCL)


