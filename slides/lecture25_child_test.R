source("http://www.ditraglia.com/econ103/display.R")



data.url <- "http://www.ditraglia.com/econ103/child_test_data.csv"
data <- read.csv(data.url)
attach(data)



head(data)



reg1 <- lm(kid.score ~ mom.hs)
display(reg1)



reg2 <- lm(kid.score ~ mom.iq)
display(reg2)



plot(mom.iq, kid.score, pch = 20, xlab = 'Mother IQ Score',
     ylab = 'Child Test Score')



coef(reg1)
intercept <- coef(reg2)[1]
slope <- coef(reg2)[2]
plot(mom.iq, kid.score, pch = 20, xlab = 'Mother IQ Score',
     ylab = 'Child Test Score')
abline(a = intercept, b = slope)



reg3 <- lm(kid.score ~ mom.hs + mom.iq)
display(reg3)



colors <- ifelse (mom.hs == 0, "black", "gray")
plot(mom.iq, kid.score, pch = 20, xlab = 'Mother IQ Score',
     ylab = 'Child Test Score', col = colors)



coef(reg3)
slope <- coef(reg3)[3]
intercept.hs <- coef(reg3)[1] + coef(reg3)[2]
intercept.no.hs <- coef(reg3)[1] 



colors <- ifelse (mom.hs == 0, "black", "gray")
plot(mom.iq, kid.score, pch = 20, xlab = 'Mother IQ Score',
     ylab = 'Child Test Score', col = colors)
abline(a = intercept.hs, b = slope, col = 'gray')
abline(a = intercept.no.hs, b = slope, col = 'black')



reg4 <- lm(kid.score ~ mom.hs + mom.iq + mom.hs:mom.iq)
display(reg4)



coef(reg4)
slope.hs <- coef(reg4)[3] + coef(reg4)[4]
slope.no.hs <- coef(reg4)[3]
intercept.hs <- coef(reg4)[1] + coef(reg4)[2]
intercept.no.hs <- coef(reg4)[1] 
colors <- ifelse (mom.hs == 0, "black", "gray")
plot(mom.iq, kid.score, pch = 20, xlab = 'Mother IQ Score',
     ylab = 'Child Test Score at Age 3', col = colors)
abline(a = intercept.hs, b = slope.hs, col = 'gray')
abline(a = intercept.no.hs, b = slope.no.hs, col = 'black')


