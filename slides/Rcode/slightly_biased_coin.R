#Example of statistical significance with no practical importance
n <- 10^7
set.seed(19040)
flip <- rbinom(1, size = n, prob = 0.499)

p.hat <- flip/n
test.stat <- (p.hat - 0.5)/sqrt( 0.5 * (1 - 0.5)/n)

p.value <- 2*(1 - pnorm(abs(test.stat)))

SE <- sqrt(p.hat * (1 - p.hat)/n)
ME <- qnorm(1 - 0.05/2) * SE
LCL <- p.hat - ME
UCL <- p.hat + ME
CI <- c(LCL, UCL)
round(CI, 4)

#Don't Compare p-values!
pR <- 0.61
nR <- 239
pD <- 0.53
nD <- 238

TR <- (pR - 0.5)/sqrt(0.5 * (1 - 0.5)/nR)
p.valueR <- 2 * (1 - pnorm(abs(TR)))
TD <- (pD - 0.5)/sqrt(0.5 * (1 - 0.5)/nD)
p.valueD <- 2 * (1 - pnorm(abs(TD)))

p.pool <- (nR * pR + pD * nD)/(nR + nD)
SE.null.diff <- sqrt((1/nR + 1/nD) * p.pool * (1 - p.pool))
Tdiff <- (pR - pD)/SE.null.diff
2 * (1 - pnorm(abs(Tdiff)))