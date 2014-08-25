

x <- seq(from = -1, to = 1, by = 0.5)
y <- x^2
plot(x, y)



x <- seq(from = -1, to = 1, by = 0.1)
y <- x^2
plot(x, y)



x <- seq(from = -1, to = 1, by = 0.01)
y <- x^2
plot(x, y)



plot(x, y, type = "l")



#Exercise #1
x <- seq(from = -2, to = 2, by = 0.01)
y <- x^3
plot(x, y, type = 'l')
# Note that the exercise said to plot x^2 not x^3



#Exercise #2
x <- seq(from = 0.5, to = 1.5, by = 0.01)
y <- log(x)
plot(x, y, type = 'l')



#Exercise #3
x <- seq(from = 0, to = 6 * pi, by = 0.01)
y <- sin(x)
plot(x, y, type = 'l')



x <- seq(from = 0, to = 1, by = 0.01)
y1 <- x^2
y2 <- x
plot(x, y1, col = 'blue', type = 'l')
points(x, y2, col = 'red', type = 'l')



x <- seq(from = 0, to = 1, by = 0.01)
y1 <- x^2
y2 <- x + 0.75
plot(x, y1, col = 'blue', type = 'l')
points(x, y2, col = 'red', type = 'l')



y <- cbind(y1, y2)
matplot(x, y, type = 'l')



y <- cbind(y1, y2)
matplot(x, y, type = 'l', col = c("red", "blue"), lty = c(1, 1))



#Exercise #4
x <- seq(from = 0, to = 2 * pi, by = 0.01)
y1 <- sin(x)
y2 <- cos(x)
y3 <- 2 * sin(x + pi/4)
y <- cbind(y1, y2, y3)
matplot(x, y, type = 'l', col = c("black", "red", "blue"), lty = c(1, 1, 1))



rbinom(20, size = 10, prob = 1/2)



sims <- rbinom(100000, size = 10, prob = 1/2)
mean(sims) - (10 * 1/2)
var(sims) - (10 * 1/2 * 1/2)



#Exercise #5
sims <- rbinom(100000, size = 20, prob = 0.9)
mean(sims) - (20 * 0.9)
var(sims) - (20 * 0.1 * 0.9)



dbinom(7, size = 10, prob = 0.8)
choose(10, 7) * (0.8)^7 * (0.2)^3



support <- 0:10
p.x <- dbinom(support, size = 10, prob = 0.5)
p.x



plot(support, p.x)



plot(0:10, p.x, type = 'h', xlab = 'x', ylab = 'p(x)', main = 'pmf for a Bernoulli(n = 10, p = 0.5) RV')



#Exercise #6
support <- 0:20
p.x <- dbinom(support, size = 20, prob = 0.65)
plot(support, p.x, type = 'h', xlab = 'x', ylab = 'p(x)', main = 'pmf for a Bernoulli(n = 20, p = 0.65) RV')



sum(dbinom(0:7, size = 20, prob = 0.3))
pbinom(7.4, size = 20, prob = 0.3)



#Exercise #7
sum(dbinom(0:24, size = 50, prob = 0.5))
pbinom(24.5, size = 50, prob = 0.5)



x <- seq(from = -1, to = 10, by = 0.01)
y <- pbinom(x, size = 10, prob = 0.5)
plot(x, y, ylab = 'F(x)')



plot(x, y, ylab = 'F(x)', type = 's')



#Exercise #8
x <- seq(from = -1, to = 21, by = 0.01)
y1 <- pbinom(x, size = 20, prob = 0.2)
y2 <- pbinom(x, size = 20, prob = 0.5)
y3 <- pbinom(x, size = 20, prob = 0.8)
y <- cbind(y1, y2, y3)
matplot(x, y, col = c("black", "blue", "red"), type = 's', lty = 1, ylab = "F(x)")



#Exercise 9 - Part 1
plot(0:20, dbinom(0:20, size = 20, prob = 0.5), type = 'h', ylab = 'p(x)')
#Part 2
sum(dbinom(12:20, size = 20, prob = 0.5))
#Part 3
sum(dbinom(18:20, size = 20, prob = 0.5))
#Part 4
250 * sum(dbinom(12:20, size = 20, prob = 0.5))
250 * sum(dbinom(18:20, size = 20, prob = 0.5))



#Exercise #10: Binomial(n = 200, p) random variable where p is the unknown proportion who prefer boxers.
1-sum(dbinom((200*.45+1):(200*.65-1),size=200,p=.5))



#Exercise 11 - 1
n <- 10000
sim1 <-  rpois(n, lambda = 1)
sim5 <- rpois(n, lambda = 5)
sim10 <- rpois(n, lambda = 10)
sim15 <- rpois(n, lambda = 15)
#Exercise 11-2
mean(sim1)
mean(sim5)
mean(sim10)
mean(sim15)
#Exercise 11-3
var(sim1)
var(sim5)
var(sim10)
var(sim15)
#Exercise 11-4
range(sim1)
table(sim1)

range(sim5)
table(sim5)

range(sim10)
table(sim10)

range(sim15)
table(sim15)
#Exercise 11-5
x <- -1:15
plot(x, dpois(x, lambda = 2), type = 'h', ylab = 'p(x)')
plot(x, ppois(x, lambda = 2), type = 's', ylab = 'F(x)')


