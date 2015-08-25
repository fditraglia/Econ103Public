marbles <- c('red', 'blue', 'green')
sample(x = marbles, size = 2, replace = FALSE)
sample(x = 1:10, size = 5, replace = FALSE)
numbers <- 1:10
sample(x = numbers, size = 20, replace = TRUE)
sample(x = numbers, size = 20, replace = TRUE)
sample(x = numbers, size = 20, replace = TRUE)
#Exercise 1
students <- c("Alice", "Bob", "Charlotte", "Dan", "Emily")
sample(x = students, size = 2, replace = FALSE) 
#Exercise 2
random.numbers <- sample(x = 1:10, size = 5, replace = TRUE)
sum(random.numbers)
sample(1:6, size = 1, replace = TRUE)
sample(1:6, size = 1, replace = TRUE) + sample(1:6, size = 1, replace = TRUE)
dice.roll <- sample(1:6, size = 2, replace = TRUE)
dice.roll
sum(dice.roll)
sum(sample(1:6, size = 2, replace = TRUE))
#Exercise 3
sum(sample(x = 1:6, size = 10, replace = TRUE))
die.rolls <- sample(x = 1:6, size = 20, replace = TRUE)
die.rolls
two.dice <- function(){
  
  dice <- sample(1:6, size = 2, replace = TRUE)
  return(sum(dice))
}
#This command actually runs two.dice
two.dice()
#While this one merely lists the function code!
two.dice
replicate(n = 20, expr = two.dice())
replicate(20, two.dice())
replicate(10, sample(1:10, 1, replace = FALSE))
replicate(10, sample(1:10, 5, replace = FALSE))
dice.sum <- function(n.dice){
  dice <- sample(1:6, size = n.dice, replace = TRUE)
  return(sum(dice))
}
replicate(50, dice.sum(3))
#Exercise 4
my.dice.sum <- function(n.dice, n.sides){
  dice <- sample(1:n.sides, size = n.dice, replace = TRUE)
  return(sum(dice))
}
replicate(100, my.dice.sum(5,4))
sim <- sample(1:10, 10, FALSE)
sim
sim
sample(1:10, 10, FALSE)
replicate(50, sample(1:5, 1, TRUE))
foo <- sample(1:5, 1, TRUE)
replicate(50, foo)
sims <- replicate(100, two.dice())
table(sims)
table(sims)/length(sims)
plot(table(sims), xlab = 'Sum', ylab = 'Frequency', main = '100 Rolls of 2 Fair Dice')
plot(table(sims)/length(sims), xlab = 'Sum', ylab = 'Relative Frequency', main = '100 Rolls of 2 Fair Dice')
more.sims <- replicate(1000, two.dice())
table(more.sims)/length(more.sims)
plot(table(more.sims)/length(more.sims), xlab = 'Sum', ylab = 'Relative Frequency', main = '1000 Rolls of 2 Fair Dice')
even.more.sims <- replicate(100000, two.dice())
table(even.more.sims)/length(even.more.sims)
plot(table(even.more.sims)/length(even.more.sims), xlab = 'Sum', ylab = 'Relative Frequency', main = '100000 Rolls of 2 Fair Dice')
z <- c(12, 6, 3, 7, 10, 9, 3)
z >= 9
TRUE + TRUE
FALSE * 6
sum(z >= 9)
sum(z >= 9)/length(z)
#Exercise 5
sum(z == 3)/length(z)
sum(z < 7)/length(z)
head(even.more.sims)
sum(even.more.sims >= 9)/length(even.more.sims)
#Exercise 6
sum(even.more.sims <= 4)/length(even.more.sims)
(7 <= z) & (z <= 10)
sum((7 <= z) & (z <= 10))/length(z)
sum((z > 10) | (z < 7))/length(z)
sum((6 <= even.more.sims) & (even.more.sims <= 8))/length(even.more.sims)
sum((even.more.sims < 6) | (even.more.sims > 8))/length(even.more.sims)
passadieci <- replicate(100000, my.dice.sum(n.dice = 3, n.sides = 6))
sum(passadieci >= 11)/length(passadieci)
sum(passadieci == 11)/length(passadieci)
sum(passadieci == 12)/length(passadieci)
sum((passadieci <= 7) | (passadieci >= 15))/length(passadieci)
plot(table(passadieci)/length(passadieci), xlab = 'Sum', ylab = 'Relative Frequency', main = 'Passadieci Simulation: 100000 Throws')
#Exercise 8
experimentA <- function(){
  rolls <- sample(1:6, size = 4, replace = TRUE)
  condition <- sum(rolls == 6) > 0
  return(condition)
}

experimentB <- function(){
  first.die <- sample(1:6, size = 24, replace = TRUE)
  second.die <- sample(1:6, size = 24, replace = TRUE)
  condition <- sum((first.die == second.die) & (first.die == 6)) > 0
  return(condition)
}

simsA <- replicate(100000, experimentA())
sum(simsA)/length(simsA)
simsB <- replicate(100000, experimentB())
sum(simsB)/length(simsB) 
