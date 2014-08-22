img.dir <- '~/Dropbox/Econ103/Slides/images'
this.dir <- '~/Dropbox/Econ103/Slides/R Scripts'
library(Hmisc)

#Plots and tables to illustrate in what sense values in the middle of a CI are ``more likely''
a <- seq(from = 0.01, to = 0.99, by = 0.01)
q <- qnorm(1 - a/2)

setwd(img.dir)

pdf(file = 'width_compare.pdf', width = 4, height = 4)
plot(a, q/q[1], type = 'l', ylab = 'Width Relative to 99% CI', xlab = expression(alpha))
dev.off()

width.tab <- round(cbind(1 - a, q/q[1]), 2)
width.tab <- width.tab[1:50,]
width.tab1 <- width.tab[1:25,]
width.tab2 <- width.tab[-(1:25),]
width.tab <- cbind(width.tab1, width.tab2)
colnames(width.tab) <- c('conf', 'width', 'conf', 'width')

setwd(this.dir)
out <- latex(width.tab, file = 'width_compare.tex')

#Matched Pairs versus Independent Samples Example: Student Grades
setwd(this.dir)
grades <- read.csv('midterms.csv')
grades <- grades[complete.cases(grades),]
names(grades) <- c('midterm1', 'midterm2')

attach(grades)
D <- midterm2 - midterm1



SE.indep <- sqrt(var(midterm1)/length(midterm1) + var(midterm2)/length(midterm2))

SE.pair <- sqrt(var(D)/length(D))

r <- cor(midterm1, midterm2)

est <- mean(midterm2) - mean(midterm1)
detach(grades)

ME.pair <- 2 * SE.pair
ME.indep <- 2 * SE.indep

CI.indep <- c(est - ME.indep, est + ME.indep)
CI.pair <- c(est - ME.pair,  est + ME.pair)


grades.out <- data.frame(student = 1:length(D), grades, Difference = D)

grades.out <- rbind(head(grades.out), tail(grades.out))
setwd(this.dir)
out <- latex(round(grades.out,1), file = 'grades.tex', rowname = NULL)




#Redo the Above Using the Bootstrap
hist(D, prob = TRUE, col = 'lightblue', main = '', xlab = 'Midterm 2 - Midterm 1')
points(density(D), type = 'l', lwd = 2, lty = 2)

bootstrap <- function(x){
  sample(x, size = length(x), replace = TRUE)
}#END boostrap

boot.mean <- replicate(10000, mean(bootstrap(D)))
hist(boot.mean)

quantile(boot.mean, c(0.025, 0.975))

#But we can use the bootstrap to calculate confidence intervals for lots of things that the standard theory doesn't cover, e.g. median, IQR, etc.
boot.median <- replicate(10000, median(bootstrap(D)))
hist(boot.median)
quantile(boot.median, c(0.025, 0.975))

boot.IQR <- replicate(10000, IQR(bootstrap(D)))
hist(boot.IQR)
quantile(boot.IQR, c(0.025, 0.975))

#For homework give them a fully fleshed-out version of 8-22 from the book. Have they check coverage, etc.

#Refined Confidence Interval for Proportions - Example of How the Textbook Interval can Fail

#True Population Parameters
n <- 10
p <- 0.1

#Generated Repeated Samples from the Population
N.reps <- 10000
x <- rbinom(N.reps, size = n, prob = p)

#Textbook 95% CI
p.hat <- x/n
ME.hat <- 2 * sqrt(p.hat * (1 - p.hat) / n)
LCL.hat <- p.hat - ME.hat
UCL.hat <- p.hat + ME.hat
CI.hat <- cbind(LCL.hat, UCL.hat)

#Check Coverage of Textbook Interval
Cover.hat <- (LCL.hat <= p) & (p <= UCL.hat)
Cover.hat <- sum(Cover.hat)/N.reps

#Refined 95% CI
p.tilde <- (n * p.hat + 2) / (n + 4)
ME.tilde <- 2 * sqrt(p.tilde * (1 - p.tilde) / (n + 4))
LCL.tilde <- p.tilde - ME.tilde
UCL.tilde <- p.tilde + ME.tilde
CI.tilde <- cbind(LCL.tilde, UCL.tilde)

#Check Coverage of Refined Interval
Cover.tilde <- (LCL.tilde <= p) & (p <= UCL.tilde)
Cover.tilde <- sum(Cover.tilde)/N.reps

c(Cover.hat, Cover.tilde)
