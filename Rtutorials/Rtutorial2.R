

survey <- read.csv("http://www.ditraglia.com/econ103/old_survey.csv")



survey <- survey[,1:6]



head(survey)
tail(survey)



hist(survey$handedness)



hist(survey$handedness, xlab = 'Handedness Score', main = 'Histogram of Handedness Scores', ylab = '# of Students')



hist(survey$handedness, breaks = 20, xlab = 'Handedness Score', main = 'Histogram of Handedness Scores')



hist(survey$handedness, breaks = 20, freq = FALSE, xlab = 'Handedness Score', main = 'Histogram of Handedness')



plot(survey$height, survey$handspan)



plot(survey$handspan, survey$height)



plot(survey$height, survey$handspan, xlab = "height (in)", ylab = "handspan (cm)")



plot(survey$height, survey$handspan, xlab = "height (in)", ylab = "handspan (cm)", col = "red")



plot(survey$height, survey$handspan, xlab = "height (in)", ylab = "handspan (cm)", col = "red", pch = 3)



plot(survey$height, survey$handspan, xlab = "height (in)", ylab = "handspan (cm)", col = "red", pch = 3, type = 'l')



survey.measurements <- survey[, c("handedness", "handspan", "height")]
pairs(survey.measurements)



boxplot(survey$handspan, ylab = "Handspan(cm)")



boxplot(handspan ~ sex, data = survey, ylab= "Handspan (cm)", main = "Handspan by Sex")



table(survey$eye.color, survey$sex)



table(survey$eye.color)



my.table <- table(survey$eye.color, survey$sex)
addmargins(my.table)



my.table <- table(survey$eye.color, survey$sex)
prop.table(my.table)



100 * prop.table(my.table)



round(100 * prop.table(my.table), digits = 1)
round(100 * prop.table(my.table), digits = 0)



summary(survey)



sum(survey$height)



sum(survey$height, na.rm = TRUE)



mean(survey$height, na.rm = TRUE)



median(survey$height, na.rm = TRUE)



var(survey$height, na.rm = TRUE)



sd(survey$height, na.rm = TRUE)



sqrt(var(survey$height, na.rm = TRUE))



IQR(survey$height, na.rm = TRUE)



max(survey$height, na.rm = TRUE)
min(survey$height, na.rm = TRUE)



max(survey$height, na.rm = TRUE) - min(survey$height, na.rm = TRUE)



range(survey$height, na.rm = TRUE)



quantile(survey$height, na.rm = TRUE)



quantile(survey$height, na.rm = TRUE, probs = 0.3)



quantile(survey$height, na.rm = TRUE, probs = c(0.1, 0.3, 0.7, 0.9))



by(survey$height, survey$sex, mean, na.rm = TRUE)



by(survey$height, survey$sex, var, na.rm = TRUE)



by(survey$height, survey$eye.color, mean, na.rm = TRUE)



by(survey$height, survey[,c('sex', 'credits')], mean, na.rm = TRUE)



results <- by(survey$height, survey[,c('sex', 'credits')], mean, na.rm = TRUE)



as.table(results)



grades <- c(67, 93, 85, 82, 88, 86, 78, 97, 74, 77, 81)



cut(grades, c(60, 70, 80, 90, 100))



cut(grades, c(60, 70, 80, 90, 100), right = FALSE)



cut(grades, c(60, 70, 80, 90, 100), c("D", "C", "B", "A"), right = FALSE)



#Ex-2
titanic <- read.csv("http://www.ditraglia.com/econ103/titanic3.csv")
head(titanic)



#Ex-3
titanic <- titanic[,c('pclass', 'survived', 'sex', 'age', 'fare')]
head(titanic)



#Ex-4
summary(titanic)



#Ex-5
sd(titanic$fare, na.rm = TRUE)
quantile(titanic$fare, 0.9, na.rm = TRUE)
hist(titanic$fare)



#Ex-6
boxplot(fare ~ pclass, data = titanic,  main = "Boxplots of fare by pclass")



#Ex-7
survivors <- subset(titanic, survived == 1)
summary(survivors)



#Ex-8
by(titanic$fare,titanic$sex, mean, na.rm = TRUE)



#Ex-9
as.table(by(titanic$fare, titanic[,c('sex', 'pclass')], mean, na.rm = TRUE))



#Ex-10
as.table(by(titanic$survived, titanic[, c("sex", "pclass")], mean))



#Ex-11
age.group <- cut(titanic$age, c(0, 15, 25, 65, 200), c("Child", "Youth", "Adult", "Senior"))
titanic$age.group <- age.group


#Ex-12
men <- subset(titanic, sex == 'male')
women <- subset(titanic, sex == 'female')
results.men <- by(men$survived, men[,c("age.group", "pclass")], mean, na.rm = TRUE)
results.women <- by(women$survived, women[,c("age.group", "pclass")], mean, na.rm = TRUE)
round(as.table(results.women),2)
round(as.table(results.men),2)
#It's actually possible to do this without using subset as follows:
full.results <- by(titanic$survived, titanic[c("age.group", "pclass", "sex")], mean, na.rm = TRUE)
round(as.table(full.results),2)


