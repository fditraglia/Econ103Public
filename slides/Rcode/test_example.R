data <- read.csv("http://www.ditraglia.com/child_test_data.csv")

head(data)
library(arm)

attach(data)

reg1 <- lm(kid.score ~ mom.hs)
display(reg1)

reg2 <- lm(kid.score ~ mom.iq)
display(reg2)

coef(reg2)
plot(mom.iq, kid.score, xlab = 'Mother IQ', ylab = 'Child Test Score', pch = 20)
intercept <- coef(reg2)[1]
slope <- coef(reg2)[2]

abline( a = intercept, b = slope)


reg3 <- lm(kid.score ~ mom.hs + mom.iq)
display(reg3)

slope <- coef(reg3)[3]
intercept.no.hs <- coef(reg3)[1]
intercept.hs <- coef(reg3)[1] + coef(reg3)[2]


colors <- ifelse(mom.hs == 0, 'black', 'gray')
  
  
plot(mom.iq, kid.score, xlab = 'Mother IQ', ylab = 'Child Test Score', pch = 20, col = colors)
abline(a = intercept.no.hs, b = slope, col = 'black')
abline(a = intercept.hs, b = slope, col = 'gray')

#AN INTERACTION!
reg4 <- lm(kid.score ~ mom.hs + mom.iq + mom.hs:mom.iq)
display(reg4)

plot(mom.iq, kid.score, xlab = 'Mother IQ', ylab = 'Child Test Score', pch = 20, col = colors)


coef(reg4)
intercept.no.hs <- coef(reg4)[1]
intercept.hs <- coef(reg4)[1] + coef(reg4)[2] 
slope.hs <- coef(reg4)[3] + coef(reg4)[4] 
slope.no.hs <- coef(reg4)[3]

#Mom went to HS
abline(a = intercept.hs, b = slope.hs, col = 'gray')
abline(a = intercept.no.hs, b = slope.no.hs, col = 'black')










