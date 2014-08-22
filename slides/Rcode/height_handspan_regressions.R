setwd("/Users/fditra/Dropbox/Econ103/Homework/Homework2")
#setwd("/Users/fditraglia/Dropbox/Econ103/Homework/Homework2")

student.data <- read.csv("survey_cleaned_fall2012.csv", header = TRUE)

student.data <- student.data[,c('sex', 'height', 'handspan')]

keep <- as.logical(apply(!is.na(student.data), 1, prod))
student.data <- student.data[keep,]


library(arm)


#Nonlinear relationship: gestation and birthweight
setwd("/Users/fditra/Dropbox/Econ103/Notes and Slides/Econ 103 Slides/Lecture 22")

gestation.data <- read.csv('econometric_game.csv', header = TRUE)
gestation.data <- gestation.data[,c('birwt', 'gest')]

#Dataset is too big: take a random subset of 1000 observations
row.sample <- sample(1:nrow(gestation.data), size = 10000, replace = FALSE)
gestation.data <- gestation.data[row.sample,]

plot(gestation.data$gest, gestation.data$birwt, pch = 20, col = rgb(red = 206, green = 206, blue = 206, alpha = 100, maxColorValue = 255), xlab =  'Length of Gestation (Weeks)', ylab = 'Birthweight (grams)')

linear.fit <- lm(birwt ~ gest, data = gestation.data)
quadratic.fit <- lm(birwt ~ gest + I(gest^2), data = gestation.data)

abline(a = coef(linear.fit)[1], b = coef(linear.fit)[2], col = 'black')
x <- seq(from = 20, to = 50, by = 0.01)
y <- coef(quadratic.fit)[1] + coef(quadratic.fit)[2] * x + coef(quadratic.fit)[3] * x^2
points(x, y, type = 'l', col = 'red')


linear.fit
quadratic.fit

set.seed(3728)

#Sampling experiment
reg.sample <- function(n){
  
  row.sample <- sample(1:nrow(student.data), size = n, replace = TRUE)
  data.subset <- student.data[row.sample,]
  coef(lm(height ~ handspan, data = data.subset))
  
}#END reg.sample

true.coef <- coef(lm(height ~ handspan, data = student.data))
a.true <- true.coef[1]
b.true <- true.coef[2]


attach(student.data)
plot(handspan, height, xlab = 'Handspan (cm)', ylab = 'Height (in)')
abline(a = a.true, b = b.true)
detach(student.data)

reg.sims <- replicate(1000, reg.sample(25))
reg.sims <- t(reg.sims)
plot(student.data$handspan, student.data$height, xlab = 'Handspan (cm)', ylab = 'Height (inches)', col = 'white')
mapply(abline, a = reg.sims[,1], b = reg.sims[,2], col = rgb(red = 206, green = 206, blue = 206, alpha = 50, maxColorValue = 255))
abline(a = a.true, b = b.true, lwd = 2)



a.sim <- reg.sims[,1]
b.sim <- reg.sims[,2]
par(mfrow = c(1,2))
hist(a.sim, xlab = '', main = 'Intercept Estimates')
abline(v = a.true, lwd = 2, col = 'red', lty = 2)
hist(b.sim, xlab = '', main = 'Slope Estimates')
abline(v = b.true, lwd = 2, col = 'red', lty = 2)
par(mfrow = c(1,1))




#Some example regressions 
reg1 <- lm(height ~ 1, data = student.data)
display(reg1)

mean(student.data$height)
sd(student.data$height)/sqrt(length(student.data$height))
sd(student.data$height)

reg2 <- lm(height ~ sex, data = student.data)
display(reg2)

male <- subset(student.data, sex == 'Male')
female <- subset(student.data, sex == 'Female')

mean(male$height) - mean(female$height)
sqrt(var(male$height)/length(male$height) + var(female$height)/length(female$height))


reg3 <- lm(height ~ handspan, data = student.data)
display(reg3)
cor(student.data$height, student.data$handspan)^2



