setwd('~/Econ103Public/slides/Rcode/')
midterms <- read.csv('midterms.csv')

midterms <- round(midterms)
Midterm1 <- midterms[,1]
Midterm2 <- midterms[,2]

table(Midterm1)

plot(Midterm2 ~ Midterm1, xlab = 'Score on Midterm 1 (%)', ylab = 'Score on Midterm 2 (%)', col = 'blue')

plot(Midterm2 ~ Midterm1, xlab = 'Score on Midterm 1 (%)', ylab = 'Score on Midterm 2 (%)', col = ifelse(Midterm1 == 81, 'red', 'blue'), pch = ifelse(Midterm1 == 81, 19, 1))

midterms[Midterm1 == 81,]
# Midterm1 Midterm2
# 6        81       89
# 45       81       NA
# 46       81       69
# 47       81       NA
# 61       81       67

mean(Midterm2[Midterm1 == 81], na.rm = TRUE)
# [1] 75

text(81, mean(Midterm2[Midterm1 == 81], na.rm = TRUE), mean(Midterm2[Midterm1 == 81], na.rm = TRUE), col = 'red')

plot(Midterm2 ~ Midterm1, xlab = 'Score on Midterm 1 (%)', ylab = 'Score on Midterm 2 (%)', col = ifelse(Midterm1 == 81, 'red', 'blue'), pch = ifelse((Midterm1 == 81) | (Midterm1 == 79), 19, 1))


text(81, mean(Midterm2[Midterm1 == 81], na.rm = TRUE), mean(Midterm2[Midterm1 == 81], na.rm = TRUE), col = 'red')

text(79, mean(Midterm2[Midterm1 == 79], na.rm = TRUE), round(mean(Midterm2[Midterm1 == 79], na.rm = TRUE)), col = 'blue')

abline(v = 89, lty = 2)


reg <- lm(Midterm2 ~ Midterm1)

round(coef(reg),2)

plot(Midterm2 ~ Midterm1, xlab = 'Score on Midterm 1 (%)', ylab = 'Score on Midterm 2 (%)', col = 'blue', main =  expression(hat(y) %~~% 32 + 0.6*x))

#rug(Midterm1, side = 1)
#rug(Midterm2, side = 2)
abline(v = mean(Midterm1, na.rm = TRUE), lty = 2)
abline(h = mean(Midterm2, na.rm = TRUE), lty = 2)

abline(coef(reg), lwd = 2, col = 'blue')


#---------------SHOW THE DEVIATIONS FOR A GIVEN LINE
plot.ss <- function(x, y, a, b){
  
  fitted <- a + b * x
  residuals <- y - fitted
  SS <- sum(residuals^2)
  
  plot(x,y, pch = 20, col = 'white', main = bquote(sum(d^2) ==  .(SS)), xlab = bquote(hat(y) == .(a) + (.(b)) *x))
  abline(a, b, lwd = 2, col = 'red')
  segments(x0 = x, y0 = y, x1 = x, y1 = fitted, col = 'red')
  points(x,y, pch = 20, col = 'blue')
  
  
}#END plot.ss


midterms <- midterms[complete.cases(midterms),] 

plot.ss(x = midterms[,1], y = midterms[,2], a = 120, b = -0.6)

plot.ss(x = midterms[,1], y = midterms[,2], a = 80, b = 0)

plot.ss(x = midterms[,1], y = midterms[,2], a = 58, b = 0.3)

plot.ss(x = midterms[,1], y = midterms[,2], a = 32, b = 0.6)

