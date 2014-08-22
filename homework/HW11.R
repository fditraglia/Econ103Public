
## ----include=FALSE-------------------------------------------------------
knit_hooks$set(document=function(x){ 
  sub('\\usepackage{framed}', '', x, fixed=TRUE) 
}) 


## ----include=FALSE-------------------------------------------------------
opts_chunk$set(fig.width=4, fig.height=4, fig.align='center',dev='pdf')


## ----include=FALSE-------------------------------------------------------
options(width = 60)


## ----anchoring_experiment_load_data--------------------------------------
data.url <- "http://www.ditraglia.com/econ103/survey_clean.csv"
survey <- read.csv(data.url)
anchoring <- survey[,c("rand.num", "africa.percent")]
lo <- subset(anchoring, rand.num == "10")$africa.percent
hi <- subset(anchoring, rand.num == "65")$africa.percent
lo <- lo[!is.na(lo)]
hi <- hi[!is.na(hi)]
SE.lo <- sd(lo)/sqrt(length(lo))
SE.hi <- sd(hi)/sqrt(length(hi))
SE <- sqrt(SE.hi^2 + SE.lo^2)
diff <- mean(hi) - mean(lo)
test.stat <- diff/SE
test.stat


## ------------------------------------------------------------------------
qnorm(1 - 0.1)


## ------------------------------------------------------------------------
test.stat > qnorm(1 - 0.1)


## ----anchoring_experiment_oneside----------------------------------------
1 - pnorm(test.stat)


## ------------------------------------------------------------------------
qnorm(1 - 0.1/2)		


## ------------------------------------------------------------------------
abs(test.stat) > qnorm(1 - 0.1/2)


## ----anchoring_experiment_twoside----------------------------------------
2 * (1 - pnorm(test.stat))


## ------------------------------------------------------------------------
data.url <- "http://www.ditraglia.com/econ103/case0202.csv"
twins <- read.csv(data.url)
head(twins)


## ------------------------------------------------------------------------
twin.diff <- twins$Unaffected - twins$Affected
mean.diff <- mean(twin.diff)
n.twins <- length(twin.diff)
SE.paired <- sqrt(var(twin.diff)/n.twins)


## ------------------------------------------------------------------------
test.stat <- mean.diff/SE.paired
test.stat
critical.value <- qt(0.05, df = n.twins - 1)
critical.value
test.stat <= critical.value


## ------------------------------------------------------------------------
critical.value <- qt(1 - 0.05, df = n.twins - 1)
critical.value
test.stat >= critical.value


## ------------------------------------------------------------------------
critical.value  <- qt(1 - 0.05/2, df = n.twins - 1)
critical.value
abs(test.stat) >= critical.value


## ------------------------------------------------------------------------
1 - pt(test.stat, df = n.twins - 1)
2 * (1 - pt(abs(test.stat), df = n.twins - 1))


## ------------------------------------------------------------------------
data.url <- "http://www.ditraglia.com/econ103/ex0222.csv"
test.scores <- read.csv(data.url)
head(test.scores)


## ------------------------------------------------------------------------
test.men <- subset(test.scores, Gender == 'male')[,-1]
means.men <- apply(test.men, 2, mean)
var.men <- apply(test.men, 2, var)
n.men <- nrow(test.men)
test.women <-subset(test.scores, Gender == 'female')[,-1]
means.women <- apply(test.women, 2, mean)
var.women <- apply(test.women, 2, var)
n.women <- nrow(test.women)
diff.means <- means.men - means.women
SE <- sqrt(var.women/n.women + var.men/n.men)


## ------------------------------------------------------------------------
test.stats <- diff.means/SE
test.stats


## ------------------------------------------------------------------------
critical.value <- qnorm(1 - 0.05/2)


## ------------------------------------------------------------------------
abs(test.stats) >= critical.value


## ------------------------------------------------------------------------
ME <- qnorm(1 - 0.05/2) * SE
LCL <- diff.means - ME
UCL <- diff.means + ME
rbind(LCL, UCL)


## ------------------------------------------------------------------------
p.values <- 2 * (1 - pnorm(abs(test.stats)))
round(p.values, 4)


## ------------------------------------------------------------------------
p.hat <- 0.21
n <- 1247


## ------------------------------------------------------------------------
p.null <- 0.20
numerator <- p.hat - p.null


## ------------------------------------------------------------------------
n <- 1247
SE.est <- sqrt(p.hat * (1 - p.hat)/n)


## ------------------------------------------------------------------------
SE.0 <- sqrt(p.null * (1 - p.null)/n)


## ------------------------------------------------------------------------
test.stat <- numerator / SE.est
test.stat.refined <- numerator / SE.0
test.stat
test.stat.refined


## ------------------------------------------------------------------------
1 - pnorm(test.stat.refined)


## ------------------------------------------------------------------------
2 * (1 - pnorm(test.stat.refined))


## ------------------------------------------------------------------------
n.R <- 547
p.R <- 0.27
n.O <- 623
p.O <- 0.16
diff <- p.R - p.O


## ------------------------------------------------------------------------
SE.R <- sqrt(p.R * (1 - p.R)/n.R)
SE.O <- sqrt(p.O * (1 - p.O)/n.O)
SE <- sqrt(SE.R^2 + SE.O^2)


## ------------------------------------------------------------------------
n.total <- n.O + n.R
p.pooled <- ((n.O * p.O) + (n.R * p.R)) / n.total
SE.pooled <- sqrt(p.pooled * (1 - p.pooled) * (1/n.O + 1/n.R))


## ------------------------------------------------------------------------
test.stat <- diff / SE
test.stat.refined <- diff / SE.pooled
test.stat
test.stat.refined


## ------------------------------------------------------------------------
2 * (1 - pnorm(test.stat))
2 * (1 - pnorm(test.stat.refined))


## ------------------------------------------------------------------------
power.10 <- function(delta){
  greater <- 1 - pnorm(2.77, mean = delta, sd = sqrt(2))
  less <- pnorm(-2.77, mean = delta, sd = sqrt(2))
  power <- greater + less
  return(power)
}


## ------------------------------------------------------------------------
delta <- seq(from = -10, to = 10, by = 0.01)
plot(delta, power.10(delta), type = 'l')


## ------------------------------------------------------------------------
power.10(3)


## ------------------------------------------------------------------------
power.10(2.7)


## ------------------------------------------------------------------------
power.10(2.75)
power.10(2.76)
power.10(2.77)


## ------------------------------------------------------------------------
power.10(-2.77)


## ------------------------------------------------------------------------
power.10(0)


## ------------------------------------------------------------------------
power.100 <- function(delta){
  greater <- 1 - pnorm(0.88, mean = delta, sd = 1/sqrt(5))
  less <- pnorm(-0.88, mean = delta, sd = 1/sqrt(5))
  power <- greater + less
  return(power)
}


## ------------------------------------------------------------------------
y <- cbind(power.10(delta), power.100(delta))
matplot(delta, y, type = 'l', ylab = 'Power', col = c('blue', 'red'), lty = 1)


## ------------------------------------------------------------------------
power.100(1)
power.100(0.9)
power.100(0.89)
power.100(0.88)


## ------------------------------------------------------------------------
power.100(0)


