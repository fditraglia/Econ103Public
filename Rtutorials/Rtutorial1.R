x <- 5
x == 5
foo <- 3
bar <- 5
foo.bar <- foo + bar
foo.bar2 <- 2 * foo.bar
foo_bar <- foo - bar
foo <- 1:5
sum(foo)
prod(foo)
length(foo)
length(1:100)
exp(1)
log(1)
exp(log(1))
abs(-1)
abs(1)
abs(-3:3)
pi
sin(0)
cos(pi)
x <- 1:5
y <- 2*x
z <- cbind(x,y)
z
z <- rbind(x,y)
z
rbind(z,x)
cbind(1:5, 2 * 1:5, 3 * 1:5)
foo <- 1:5
bar <- 2 * foo
foo.bar <- data.frame(foo, bar)
foo.bar
y <- -4:0
data.frame(foo, bar, y)
location <- c("New York", "Chicago", "Boston", "Boston", "New York")
salary <- c(70000, 80000, 60000, 50000, 45000)
title <- c("Office Manager", "Research Assistant", "Analyst", "Office Manager", "Analyst")
hours <- c(50, 56, 65, 40, 50)
jobsearch <- data.frame(location, salary, title, hours)
jobsearch
subset(jobsearch, location == 'New York')
subset(jobsearch, salary > 50000)
subset(jobsearch, hours <= 50)
head(EuStockMarkets)
tail(EuStockMarkets)
person <- c("Linus", "Snoopy", "Lucy", "Woodstock")
age <- c(5, 8, 6, 2)
weight <- c(40, 25, 50, 1)
my.dataframe <- data.frame(person, age, weight)
my.matrix <- cbind(age, weight)
my.dataframe
my.matrix
age[1:2]
age[c(1,3)]
my.matrix[1,2]
my.dataframe[1,3]
my.matrix[1:3,2]
my.dataframe[1:3,3]
my.matrix[,1:2]
my.dataframe[,2:3]
my.matrix[c(1,3),]
my.dataframe[c(1,3),]
cbind(my.matrix, person)
cbind(my.matrix, person)[,2] - 1
my.dataframe[,3] - 1
my.dataframe[["weight"]]
my.dataframe$weight
my.dataframe[,c("person", "weight")]
my.dataframe[,2]
my.dataframe[,c(1,2)]
my.dataframe[,1:2]
#Ex. 1-1
60 * 24 * 7
#Ex. 1-2
sum(1, 8, 4, 2, 9, 4, 8, 5)
#Ex. 1-3
help(rep)
#Ex. 1-4
x <- 5
y <- 7
z = x + y 
z + 3 == 15
#Ex. 1-5
list.files()  
## #Ex. 1-6
## source("binomial_example.R")
#Ex. 1-7
rep("Go Penn", times = 30)
#Ex. 2-1
x <- seq(-1, 1, 0.1)
x
#Ex. 2-2
wizards <- c("Harry", "Ron", "Fred", "George", "Sirius")
ranking <- c(4, 2, 5, 1, 3)
#Remember that the elements of character vectors need to be enclosed in quotation marks. Either single or double quotes will work.
#Ex. 2-3
wizards[2]
#Ex. 2-4
#There are several different ways to do this. Here are two possibilities.
wizards[c(3, 4, 5)] <- c("Hermione", "Ginny", "Malfoy")
wizards[3:5] <- c("Hermione", "Ginny", "Malfoy")
#Ex. 2-5
names(wizards) <- c("Lead", "Friend", "Friend", "Wife", "Rival")
wizards
#Ex. 2-6
names(wizards)[5] <- "Ex-Rival"
names(wizards)
#Ex. 2-7
barplot(ranking) 
#The wizards vector contains character data rather than numerical data so we can't plot it.
#Ex. 2-8
names(ranking) <- wizards
barplot(ranking)
#Ex. 2-9
years <- c(2009, 2010, 2011, 2012)
income <- c(50000, 52000, 52500, 48000)
expenses <- c(35000, 34000, 38000, 40000)
#Ex. 2-10
savings <- income - expenses
plot(years, savings)
#Ex. 2-11
sum(savings)
#Ex. 2-12
years <- c(2009, 2010, 2011, 2012, 2013)
income <- c(50000, 52000, 52500, 48000, NA)
#If we just use sum, we'll get NA
sum(income)
#To avoid this, we use the following option to ignore the NA
sum(income, na.rm = TRUE)
#Ex. 3-1
z <- 23:12
z.mat <- matrix(z, 3, 4)
#Ex. 3-2
z.mat[2,4]
#Ex. 3-3
z.mat[2,4] <- 7
z.mat
#Ex. 4-1
scores <- c(18, 95, 76, 90, 84, 83, 80, 79, 63, 76, 55, 78, 90, 81, 88, 89, 92, 73, 83, 72, 85, 66, 77, 82, 99, 87)
#Ex. 4-2
mean(scores)
median(scores)
sd(scores)
#Ex. 6-1
age <- c(21, 26, 51, 22, 160, 160, 160)
person <- c("Achilles", "Hector", "Priam", "Paris", "Apollo", "Athena", "Aphrodite")
description <- c("Aggressive", "Loyal", "Regal", "Cowardly", "Proud", "Wise", "Conniving")
#Ex. 6-2
trojan.war <- data.frame(person, age, description)
#Ex. 6-3
#There are many different ways to do this:
trojan.war[,3] 
trojan.war$description 
trojan.war["description"] 
#Ex. 6-4
#There are several ways to do this. Here are a few:
trojan.war[c(1,2),]
trojan.war[1:2,]
#Ex. 6-5
#There are many ways to do this. Here are a few:
trojan.war[c(5, 6, 7), c(1, 3)]
trojan.war[5:7, c("person", "description")]
#Ex. 6-6
#There are many different ways to do this. Here are a few:
trojan.war[3, 2] <- 72
trojan.war$age[3] <- 72
trojan.war
#Ex. 6-7
titanic <- read.csv("http://www.ditraglia.com/econ103/titanic3.csv")
#Ex. Additional-1
x <- seq(2, 18, 2)
x
prod(x)
#Ex. Additional-2
exp(sum(log(x)))
#Ex. Additional-3
numbers <- 1:10
square.roots <- sqrt(numbers)
cbind(numbers, square.roots)
#Ex. Additional-4
rbind(numbers, square.roots)
#Ex. Additional-5
head(titanic)
tail(titanic)
#Ex. Additional-6
survivors <- subset(titanic, survived == 1)
head(survivors)
#Ex. Additional-7
men <- subset(titanic, sex == 'male')
tail(men)
