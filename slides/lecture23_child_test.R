## ------------------------------------------------------------------------
source("http://ditraglia.com/econ103/display.R")

## ------------------------------------------------------------------------
data_url <- "http://ditraglia.com/econ103/child_test_data.csv"
child <- read.csv(data_url)

## ------------------------------------------------------------------------
head(child)

## ------------------------------------------------------------------------
reg1 <- lm(kid.score ~ mom.hs, data = child)
display(reg1)

## ------------------------------------------------------------------------
reg2 <- lm(kid.score ~ mom.iq, data = child)
display(reg2)

## ------------------------------------------------------------------------
plot(child$mom.iq, child$kid.score, pch = 20, xlab = 'Mother IQ Score',
     ylab = 'Child Test Score')

## ------------------------------------------------------------------------
plot(child$mom.iq, child$kid.score, pch = 20, xlab = 'Mother IQ Score',
     ylab = 'Child Test Score')
abline(coef(reg2))

## ------------------------------------------------------------------------
reg3 <- lm(kid.score ~ mom.hs + mom.iq, data = child)
display(reg3)

## ------------------------------------------------------------------------
colors <- ifelse(child$mom.hs == 0, "black", "gray")
plot(child$mom.iq, child$kid.score, pch = 20, xlab = 'Mother IQ Score',
     ylab = 'Child Test Score', col = colors)

## ------------------------------------------------------------------------
coef(reg3)
b_both <- coef(reg3)[3]
a_HS <- coef(reg3)[1] + coef(reg3)[2]
a_no_HS <- coef(reg3)[1] 

## ------------------------------------------------------------------------
colors <- ifelse(child$mom.hs == 0, "black", "gray")
plot(child$mom.iq, child$kid.score, pch = 20, xlab = 'Mother IQ Score',
     ylab = 'Child Test Score', col = colors)
abline(a = a_HS, b = b_both, col = 'gray')
abline(a = a_no_HS, b = b_both, col = 'black')

## ------------------------------------------------------------------------
reg4 <- lm(kid.score ~ mom.hs + mom.iq + mom.hs:mom.iq, data = child)
display(reg4)

## ------------------------------------------------------------------------
coef(reg4)
b_HS <- coef(reg4)[3] + coef(reg4)[4]
b_no_HS <- coef(reg4)[3]
a_HS <- coef(reg4)[1] + coef(reg4)[2]
a_no_HS <- coef(reg4)[1] 
colors <- ifelse(child$mom.hs == 0, "black", "gray")
plot(child$mom.iq, child$kid.score, pch = 20, xlab = 'Mother IQ Score',
     ylab = 'Child Test Score at Age 3', col = colors)
abline(a = a_HS, b = b_HS, col = 'gray')
abline(a = a_no_HS, b = b_no_HS, col = 'black')

