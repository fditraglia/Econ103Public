setwd("/Users/fditra/Dropbox/Econ103/Homework/Homework2")

survey <- read.csv("survey_cleaned_Fall2012.csv", header = TRUE)

names(survey)

handspan <- survey$handspan
height <- survey$height
 

drop <- is.na(height) | is.na(handspan)
height <- height[!drop]
handspan <- handspan[!drop]

plot(height, handspan ,xlab = 'x = Height (in)', ylab = 'y = Handspan (cm)', cex = 1.3)
abline(lm(handspan ~ height), col = 'blue', lwd = 2)


plot(handspan, height ,ylab = 'y = Height (in)', xlab = 'x = Handspan (cm)', cex = 1.3)
abline(lm(height ~ handspan), col = 'blue', lwd = 2)


reg <- lm(handspan ~ height)
paste('a = ', round(coefficients(reg)[1],1), sep = '')
paste('b = ', round(coefficients(reg)[2],1), sep = '')


cor(height, handspan)
cov(height, handspan)
sd(height)
sd(handspan)

mean(handspan)
mean(height)

z.score <- function(x){
  
  (x - mean(x, na.rm = TRUE))/sd(x, na.rm = TRUE)
  
}

#Standardized Regression
plot(z.score(height), z.score(handspan), xlab = 'z-score for Height', ylab = 'z-score for Handspan', cex = 1.3)
abline(lm(z.score(handspan) ~ z.score(height)))

cbind(height, z.score(height))[order(z.score(height)),]
cbind(handspan, z.score(handspan))[order(z.score(handspan)),]

