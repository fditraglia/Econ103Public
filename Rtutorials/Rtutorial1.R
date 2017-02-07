## ----initial_test, results='hide'----------------------------------------
x = 5
x == 5

## ----arithmetic----------------------------------------------------------
#add numbers
1 + 1
#subtract them
8 - 4
#divide
13/2
#multiply
4*pi
#exponentiate
2^10

## ----logicals------------------------------------------------------------
3 < 4
3 > 4
#contrast with 3 = 4; see section about variables below
3 == 4
#!= means "not equal to"
3 != 4
4 >= 5
4 <= 5
2 + 2 == 5
10 - 6 == 4

## ----strings-------------------------------------------------------------
'Econometrics is awesome'
#R delimits strings with EITHER double or single quotes.
#  There is only a very minimal difference
"Econometrics is still awesome"

## ----variables-----------------------------------------------------------
x = 42
x / 2
#if we assign something else to x,
#  the old value is deleted
x = "Melody to Funkytown!"
x
x = 5
x == 5
foo = 3
bar = 5
foo.bar = foo + bar
foo.bar
foo.bar2 = 2 * foo.bar
foo.bar2
foo_bar = foo - bar
foo_bar

## ----vectors_1-----------------------------------------------------------
x = c(4, 7, 9)
x
y = c('a', 'b', 'c')
y

## ----vectors_2-----------------------------------------------------------
x = c(1, TRUE, "three")
x

## ----vector_arithmetic---------------------------------------------------
x = c(1, 2, 3)
x + 4
x/3
-x
x^3
y = c(3, 2, 1)
x - y
x * y
x/y
x > 2
x >= 2

## ----functions-----------------------------------------------------------
x = c(1, 2, 3)
#sum: add up the elements of a vector
sum(x)
#Just like you can use the command sum to add up the
#  elements of a numeric vector, you can use
#  prod to take their product:
prod(x)
sqrt(x)
y = c(-1, 2, 4)
#abs: absolute value
abs(y)
#exp: exponential. exp(x) is e^x
exp(y)
#log: _natural_ logarithm (base e)
log(x)
#Note that these functions interpret their input 
#  as *radians* rather than degrees.
sin(x) + cos(y)
max(y)
min(y)
range(y)
mean(x)
median(x)

## ----sequences-----------------------------------------------------------
x = 1:10
x
y = 10:1
y
#some times the gap is not 1
z = seq(0, 1, by = .02)
z
#other times we care less about the gap and more
#  more about how many points we get out
w = seq(0, 1, length.out = 20)

## ----programming_functions-----------------------------------------------
x = 99:32
#length: how many elements (items) are there in x?
length(x)
y = c("hey you!", "out there in the cold")
#what TYPE of variable does R think this is?
class(y)
#rep: repeat/reproduce
rep(y, 4)
#head/tail: display only the beginning/end
#  of an object -- very useful for very
#  large objects
x = 1:100000
head(x)
tail(x)

## ----vector_extraction_1-------------------------------------------------
x = c(5, 4, 1)
x[1]
x[3]
x[1:2]
x[2:3]

## ----vector_extraction_2-------------------------------------------------
x = 20:30
x
x[c(1, 3, 5)]
x[c(5, 9)]
x[seq(1, 10, by = 2)]

## ----vector_extraction_3-------------------------------------------------
x = c(5, 6, 7)
x[c(TRUE, TRUE, FALSE)]
x[c(FALSE, TRUE, FALSE)]
x[c(FALSE, FALSE, TRUE)]

## ----vector_extraction_4-------------------------------------------------
x = c(-1, 0, 1)
x > 0
x[x > 0]
x[x <= 0]

## ----vector_replacement--------------------------------------------------
x = c(-1, 5, 10)
x[3] = 4
x
x[x < 0] = 0

## ----vector_names_1------------------------------------------------------
trump_ages = c(70, 46, 38, 34, 32, 22, 9)

## ----vector_names_2------------------------------------------------------
trump_ages = c(Donald = 70, Melania = 46, Donald_Jr = 38, Ivanka = 34,
               Eric = 32, Tiffany = 22, Barron = 9)
trump_ages

## ----vector_names_3------------------------------------------------------
names(trump_ages) = c("Donald", "Melania", "Donald, Jr.", "Ivanka", "Eric", "Tiffany", "Barron")
trump_ages

## ----vector_names_4------------------------------------------------------
trump_ages["Donald"]
trump_ages[c("Donald", "Barron")]

## ----documentation-------------------------------------------------------
?sum
?cos
?"="

## ----lists_1-------------------------------------------------------------
x = list(TRUE, 1, "Frank")
x

## ----lists_2-------------------------------------------------------------
x = list(c(1, 2), c("a", "b"), c(TRUE, FALSE), c(5L, 6L))
x
y = list(list(1, 2, 3), list(4:5), 6)
y

## ----packages_1, eval = FALSE--------------------------------------------
## install.packages("data.table")

## ----packages_2----------------------------------------------------------
library(data.table)

## ----data.table_1--------------------------------------------------------
foo = 1:5
bar = 2 * foo
foo.bar = data.table(foo, bar)
foo.bar

## ----data.table_2--------------------------------------------------------
y = -4:0
data.table(foo, bar, y)

## ----subsetting_1--------------------------------------------------------
location = c("New York", "Chicago", "Boston", "Boston", "New York")
salary = c(70000, 80000, 60000, 50000, 45000)
title = c("Office Manager", "Research Assistant", "Analyst", "Office Manager", "Analyst")
hours = c(50, 56, 65, 40, 50)
jobsearch = data.table(location, salary, title, hours)
jobsearch

## ----subsetting_2--------------------------------------------------------
jobsearch[location == 'New York']

## ----subsetting_3--------------------------------------------------------
jobsearch[salary > 50000]

## ----subsetting_4--------------------------------------------------------
jobsearch[hours <= 50]

## ----data_import---------------------------------------------------------
weather = fread('http://michaelchirico.github.io/philly_weather_data.csv')
weather
summary(weather)
names(weather)

## ----data.table_extra_1--------------------------------------------------
person = c("Linus", "Snoopy", "Lucy", "Woodstock")
age = c(5, 8, 6, 2)
weight = c(40, 25, 50, 1)
my.data.table = data.table(person, age, weight)
my.data.table

## ----data.table_extra_2--------------------------------------------------
age[1:2]
age[c(1,3)]

## ----data.table_extra_3--------------------------------------------------
my.data.table[1:2]
my.data.table[c(1, 3)]

## ----data.table_extra_4--------------------------------------------------
#what is the first row of the third column?
my.data.table[1, 3]
#what are the first three rows of the third column?
my.data.table[1:3, 3]

## ----data.table_extra_5--------------------------------------------------
my.data.table[ , 2:3]

## ----data.table_extra_6--------------------------------------------------
my.data.table[c(1,3), ]
my.data.table[c(2,4)]

## ----data.table_extra_7--------------------------------------------------
my.data.table[["weight"]]

## ----data.table_extra_8--------------------------------------------------
my.data.table$weight

## ----data.table_extra_9--------------------------------------------------
my.data.table[ , c("person", "weight")]

## ----data.table_extra_10-------------------------------------------------
my.data.table[ , 2]
my.data.table[ , c(1,2)]
my.data.table[ , 1:2]

## ----exercise_1----------------------------------------------------------
60 * 24 * 7 * 31

## ----exercise_2----------------------------------------------------------
sum(c(3,1,4,1,5,9,2,6))

## ----exercise_3----------------------------------------------------------
?summary
summary(iris)

## ----exercise_4----------------------------------------------------------
x = 5
y = 7
z = x + y 
z + 3 == 15

## ----exercise_5----------------------------------------------------------
rep("Go Penn", times = 30)

## ----exercise_6----------------------------------------------------------
x = seq(-1, 1, 0.1)
x

## ----exercise_7----------------------------------------------------------
#Remember that the elements of character vectors need to be enclosed in quotation marks. Either single or double quotes will work.
wizards = c("Harry", "Ron", "Fred", "George", "Sirius")
ranking = c(4, 2, 5, 1, 3)

## ----exercise_8----------------------------------------------------------
wizards[2]

## ----exercise_9----------------------------------------------------------
#There are several different ways to do this. Here are two possibilities.
wizards[c(3, 4, 5)] = c("Hermione", "Ginny", "Malfoy")
wizards[3:5] = c("Hermione", "Ginny", "Malfoy")

## ----exercise_10---------------------------------------------------------
names(wizards) = c("Lead", "Friend", "Friend", "Wife", "Rival")
wizards

## ----exercise_11---------------------------------------------------------
names(wizards)[5] = "Ex-Rival"
names(wizards)

## ----exercise_12---------------------------------------------------------
years = c(2009, 2010, 2011, 2012)
income = c(50000, 52000, 52500, 48000)
expenses = c(35000, 34000, 38000, 40000)

## ----exercise_13---------------------------------------------------------
savings = income - expenses

## ----exercise_14---------------------------------------------------------
sum(savings)

## ----exercise_15---------------------------------------------------------
z = 23:12
z

## ----exercise_16---------------------------------------------------------
z[z == 13] = 7
z

## ----exercise_17---------------------------------------------------------
scores = c(18, 95, 76, 90, 84, 83, 80, 79, 63, 76, 55, 78, 90, 81, 88, 89, 92, 73, 83, 72, 85, 66, 77, 82, 99, 87)

## ----exercise_18---------------------------------------------------------
mean(scores)
median(scores)
range(scores)

## ----exercise_19---------------------------------------------------------
age = c(21, 26, 51, 22, 160, 160, 160)
person = c("Achilles", "Hector", "Priam", "Paris", "Apollo", "Athena", "Aphrodite")
description = c("Aggressive", "Loyal", "Regal", "Cowardly", "Proud", "Wise", "Conniving")

## ----exercise_20---------------------------------------------------------
trojan.war = data.table(person, age, description)

## ----exercise_21---------------------------------------------------------
#There are many different ways to do this:
trojan.war[, 3] 
trojan.war$description 
trojan.war[ , "description"]
trojan.war[["description"]]

## ----exercise_22---------------------------------------------------------
#There are several ways to do this. Here are a few:
trojan.war[c(1,2)]
trojan.war[1:2]
#A more advanced way that doesn't require knowing the order of the rows:
trojan.war[person %in% c("Achilles", "Hector")]

## ----exercise_23---------------------------------------------------------
#There are many ways to do this. Here are a few:
trojan.war[c(5, 6, 7), c(1, 3)]
trojan.war[5:7, c("person", "description")]
#advanced method
trojan.war[person %in% c("Apollo", "Athena", "Aphrodite"),
           c("person", "description")]

## ----exercise_24---------------------------------------------------------
titanic = fread("http://www.ditraglia.com/econ103/titanic3.csv")

## ----exercise_25---------------------------------------------------------
x = seq(2, 18, 2)
x
prod(x)

## ----exercise_26---------------------------------------------------------
titanic[survived == 1]

## ----exercise_27---------------------------------------------------------
titanic[sex == 'male']

