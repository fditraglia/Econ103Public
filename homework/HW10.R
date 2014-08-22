
## ----include=FALSE-------------------------------------------------------
knit_hooks$set(document=function(x){ 
  sub('\\usepackage{framed}', '', x, fixed=TRUE) 
}) 


## ----include=FALSE-------------------------------------------------------
opts_chunk$set(fig.width=3, fig.height=3, fig.align='center',dev='pdf')


## ----include=FALSE-------------------------------------------------------
options(width = 60)


## ------------------------------------------------------------------------
pbinom(5, size = 50, prob = 0.2)


## ------------------------------------------------------------------------
p <- 0.2
n <- 50
SE <- sqrt(p * (1 - p) / n)
pnorm((0.1 - 0.2)/SE)


## ------------------------------------------------------------------------
group <- c('treatment', 'control', 'refused')
n.children <- 1000 * c(200, 200, 340)
n.polio <- c(57, 142, 157)
rate <- n.polio/n.children
polio.data <- data.frame(group, n.children, n.polio, rate)
polio.data


## ------------------------------------------------------------------------
treatment <- subset(polio.data, group == 'treatment')
control <- subset(polio.data, group == 'control')

estimate <- control$rate - treatment$rate

SE <- sqrt( 
  control$rate * (1 - control$rate)/control$n.children
  + treatment$rate * (1 - treatment$rate)/control$n.children
  )

ME <- qnorm(1 - 0.05/2) * SE
CI <- c(estimate - ME, estimate + ME)


## ------------------------------------------------------------------------
estimate * 10^5
ME * 10^5
CI * 10^5


## ----uniform_clt---------------------------------------------------------
x <- seq(0, 1, 0.01)
y <- dunif(x)
plot(x, y, main = "Uniform(0,1) Density", type = 'l', ylab = 'f(x)')
uniform.means <- replicate(10000, mean(runif(20)))
hist(uniform.means, main = "Uniform(0,1), n = 20")


## ----chisq_clt-----------------------------------------------------------
x <- seq(0.01, 15, 0.01)
y <- dchisq(x, df = 5)
plot(x,y, type = 'l', main = "Chi-squared Density, df = 5", ylab = 'f(x)')
chisq.means <- replicate(10000, mean(rchisq(20, df = 5)))
hist(chisq.means, main = "Chi-squared(5), n = 20")


## ----bernoulli_clt-------------------------------------------------------
x <- c(0,1)
y <- dbinom(x, size = 1, p = 0.3)
plot(x, y, type = 'h', main = "Bernoulli(0.3) pmf", ylim = c(0,1), xlim = c(-1, 2), ylab = 'p(x)')
bernoulli.means <- replicate(10000, mean(rbinom(20, 1, 0.3)))
hist(bernoulli.means, main = "Bernoulli(0.3), n = 20")


## ----roswell_onesample---------------------------------------------------
p.hat <- 0.21
n <- 1247
SE <- sqrt(p.hat * (1 - p.hat)/n)
ME <- qnorm(1 - 0.01/2) * SE
LCL <- p.hat - ME
UCL <- p.hat + ME
c(LCL, UCL)


## ----men_women-----------------------------------------------------------
n <- 623
p.M <- 0.24
p.W <- 0.19
SE.M <- sqrt(p.M * (1 - p.M)/n)
SE.W <- sqrt(p.W * (1 - p.W)/n)
SE <- sqrt(SE.M^2 + SE.W^2)
ME <- qnorm(1 - 0.01/2) * SE
diff <- p.M - p.W
LCL <- diff - ME
UCL <- diff + ME
c(LCL, UCL)


## ----romney_obama--------------------------------------------------------
n.R <- 547
p.R <- 0.27
SE.R <- sqrt(p.R * (1 - p.R)/n.R)
n.O <- 623
p.O <- 0.16
SE.O <- sqrt(p.O * (1 - p.O)/n.O)
SE <- sqrt(SE.R^2 + SE.O^2)
ME <- qnorm(1 - 0.01/2) * SE
diff <- p.R - p.O
UCL <- diff + ME
LCL <- diff - ME
c(LCL, UCL)


## ----anchoring_experiment------------------------------------------------
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
ME <- qnorm(0.975) * SE 
diff <- mean(hi) - mean(lo)
LCL <- diff - ME
UCL <- diff + ME
c(LCL, UCL)


## ------------------------------------------------------------------------
data.url <- "http://www.ditraglia.com/econ103/ex0222.csv"
test.scores <- read.csv(data.url)
head(test.scores)


## ------------------------------------------------------------------------
test.men <- subset(test.scores, Gender == 'male')[,-1]
means.men <- apply(test.men, 2, mean)
var.men <- apply(test.men, 2, var)


## ------------------------------------------------------------------------
test.men <- subset(test.scores, Gender == 'male')[,-1]
test.women <-subset(test.scores, Gender == 'female')[,-1]
means.men <- apply(test.men, 2, mean)
var.men <- apply(test.men, 2, var)
n.men <- nrow(test.men)
means.women <- apply(test.women, 2, mean)
var.women <- apply(test.women, 2, var)
n.women <- nrow(test.women)
diff.means <- means.men - means.women
SE <- sqrt(var.women/n.women + var.men/n.men)
ME <- qnorm(1 - 0.05/2) * SE
LCL <- diff.means - ME
UCL <- diff.means + ME
CI <- rbind(LCL, UCL)
round(diff.means, 2)
round(CI, 2)


## ------------------------------------------------------------------------
data.url <- "http://www.ditraglia.com/econ103/case0202.csv"
twins <- read.csv(data.url)
head(twins)


## ------------------------------------------------------------------------
mean.affected <- mean(twins$Affected)
var.affected <- var(twins$Affected)
n.affected <- length(twins$Affected)
mean.unaffected <- mean(twins$Unaffected)
var.unaffected <- var(twins$Unaffected)
n.unaffected <- length(twins$Unaffected)
diff.means <- mean.unaffected - mean.affected
SE.indep <- sqrt(
    var.affected/n.affected 
    + var.unaffected/n.unaffected)
ME.indep <- qnorm(1 - 0.05/2) * SE.indep
CI.indep <- c(diff.means - ME.indep, diff.means + ME.indep)
round(CI.indep, 3)


## ------------------------------------------------------------------------
twin.diff <- twins$Unaffected - twins$Affected
n.twins <- length(twin.diff)
SE.paired <- sqrt(var(twin.diff)/n.twins)
ME.paired <- qnorm(1 - 0.05/2) * SE.paired
CI.paired <- c(diff.means - ME.paired, diff.means + ME.paired)
round(CI.paired, 3)


## ------------------------------------------------------------------------
ME.t <- qt(1 - 0.05/2, df = n.twins - 1) * SE.paired
CI.paired.t <- c(diff.means - ME.t, diff.means + ME.t)
round(CI.paired.t, 3)


## ------------------------------------------------------------------------
rbinom(1, size = 50, prob = 0.5)/50


## ------------------------------------------------------------------------
n <- 50
p <- 0.5
N.reps <- 100
p.hat <- rbinom(N.reps, size = n, prob = p)/n
ME.hat <- qnorm(0.975) * sqrt(p.hat * (1 - p.hat) / n)
LCL.hat <- p.hat - ME.hat
UCL.hat <- p.hat + ME.hat
CI.hat <- cbind(LCL.hat, UCL.hat)
Coverage <- (LCL.hat <= p) & (p <= UCL.hat)
Coverage <- sum(Coverage)/N.reps
Coverage


## ------------------------------------------------------------------------
n <- 10
p <- 0.1
N.reps <- 10000
p.hat <- rbinom(N.reps, size = n, prob = p)/n
ME.hat <- qnorm(0.975) * sqrt(p.hat * (1 - p.hat) / n)
LCL.hat <- p.hat - ME.hat
UCL.hat <- p.hat + ME.hat
CI.hat <- cbind(LCL.hat, UCL.hat)
Coverage <- (LCL.hat <= p) & (p <= UCL.hat)
Coverage <- sum(Coverage)/N.reps
Coverage


## ------------------------------------------------------------------------
p.tilde <- (n * p.hat + 2) / (n + 4)
ME.tilde <- qnorm(0.975) * sqrt(p.tilde * (1 - p.tilde) / (n + 4))
LCL.tilde <- p.tilde - ME.tilde
UCL.tilde <- p.tilde + ME.tilde
CI.tilde <- cbind(LCL.tilde, UCL.tilde)
Cover.tilde <- (LCL.tilde <= p) & (p <= UCL.tilde)
Cover.tilde <- sum(Cover.tilde)/N.reps
Cover.tilde


