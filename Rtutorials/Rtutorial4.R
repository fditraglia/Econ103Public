## ----marble_sample-------------------------------------------------------
marbles = c('red', 'blue', 'green')
sample(x = marbles, size = 2, replace = FALSE)

## ----sample_1.10---------------------------------------------------------
sample(x = 1:10, size = 5, replace = FALSE)

## ----sample_replace------------------------------------------------------
numbers = 1:10
sample(x = numbers, size = 20, replace = TRUE)

## ----sample_resample-----------------------------------------------------
sample(x = numbers, size = 20, replace = TRUE)
sample(x = numbers, size = 20, replace = TRUE)

## ----exercise_1----------------------------------------------------------
students = c("Alice", "Bob", "Charlotte", "Dan", "Emily")
sample(x = students, size = 2, replace = FALSE) 

## ----exercise_2----------------------------------------------------------
random.numbers = sample(x = 1:10, size = 5, replace = TRUE)
sum(random.numbers)

## ----dice_roll-----------------------------------------------------------
sample(1:6, size = 1, replace = TRUE)

## ----two_dice_long-------------------------------------------------------
sample(1:6, size = 1, replace = TRUE) + sample(1:6, size = 1, replace = TRUE)

## ----two_dice_medium-----------------------------------------------------
dice.roll <- sample(1:6, size = 2, replace = TRUE)
dice.roll
sum(dice.roll)

## ----two_dice_short------------------------------------------------------
sum(sample(1:6, size = 2, replace = TRUE))

## ----exercise_3----------------------------------------------------------
sum(sample(x = 1:6, size = 10, replace = TRUE))

## ----sample_20-----------------------------------------------------------
die.rolls <- sample(x = 1:6, size = 20, replace = TRUE)
die.rolls

## ----two_dice_function---------------------------------------------------
two.dice <- function(){
  dice <- sample(1:6, size = 2, replace = TRUE)
  return(sum(dice))
}

## ----function_no_arguments-----------------------------------------------
#This command actually runs two.dice
two.dice()
#While this one merely lists the function code!
two.dice

## ----replicate_args------------------------------------------------------
replicate(n = 20, expr = two.dice())

## ----replicate_unnamed_args----------------------------------------------
replicate(20, two.dice())

## ----replicate_output_format---------------------------------------------
replicate(10, sample(1:10, 1, replace = FALSE))
replicate(10, sample(1:10, 5, replace = FALSE))

## ----dice_roll_function--------------------------------------------------
dice.sum <- function(n.dice){
  dice <- sample(1:6, size = n.dice, replace = TRUE)
  return(sum(dice))
}

## ----replicate_dice_roll-------------------------------------------------
replicate(50, dice.sum(3))

## ----exercise_4----------------------------------------------------------
my.dice.sum <- function(n.dice, n.sides){
  dice <- sample(1:n.sides, size = n.dice, replace = TRUE)
  return(sum(dice))
}
replicate(100, my.dice.sum(5,4))

## ----storing_random------------------------------------------------------
sim <- sample(1:10, 10, FALSE)

## ----print_stored_random-------------------------------------------------
sim

## ----reprint_stored_random-----------------------------------------------
sim

## ----rerun_sample--------------------------------------------------------
sample(1:10, 10, FALSE)

## ----do_do---------------------------------------------------------------
replicate(50, sample(1:5, 1, TRUE))

## ----dont_do-------------------------------------------------------------
foo <- sample(1:5, 1, TRUE)
replicate(50, foo)

## ----roll_100------------------------------------------------------------
sims <- replicate(100, two.dice())

## ----summarize_rolls-----------------------------------------------------
table(sims)

## ----relative_frequencies------------------------------------------------
table(sims)/length(sims)

## ----plot_table----------------------------------------------------------
plot(table(sims), xlab = 'Sum', ylab = 'Frequency', main = '100 Rolls of 2 Fair Dice')

## ----plot_relative_table-------------------------------------------------
plot(table(sims)/length(sims), xlab = 'Sum', ylab = 'Relative Frequency', main = '100 Rolls of 2 Fair Dice')

## ----roll_1000-----------------------------------------------------------
more.sims <- replicate(1000, two.dice())
table(more.sims)/length(more.sims)
plot(table(more.sims)/length(more.sims), 
     xlab = 'Sum', ylab = 'Relative Frequency', main = '1000 Rolls of 2 Fair Dice')

## ----roll_100000---------------------------------------------------------
even.more.sims <- replicate(100000, two.dice())
table(even.more.sims)/length(even.more.sims)
plot(table(even.more.sims)/length(even.more.sims), 
     xlab = 'Sum', ylab = 'Relative Frequency', main = '100000 Rolls of 2 Fair Dice')

## ----logical_refresh-----------------------------------------------------
z <- c(12, 6, 3, 7, 10, 9, 3)
z >= 9

## ----logical_arithmetic--------------------------------------------------
TRUE + TRUE
FALSE * 6

## ----count_beyond_threshold----------------------------------------------
sum(z >= 9)

## ----logical_proportion--------------------------------------------------
sum(z >= 9)/length(z)

## ----exercise_5----------------------------------------------------------
sum(z == 3)/length(z)
sum(z < 7)/length(z)

## ----many_rolls_head-----------------------------------------------------
head(even.more.sims)

## ----many_rolls_proportion-----------------------------------------------
sum(even.more.sims >= 9)/length(even.more.sims)

## ----exercise_6----------------------------------------------------------
sum(even.more.sims <= 4)/length(even.more.sims)

## ----compound_condition--------------------------------------------------
(7 <= z) & (z <= 10)

## ----compound_condition_rel_freq-----------------------------------------
sum((7 <= z) & (z <= 10))/length(z)

## ----or_condition--------------------------------------------------------
sum((z > 10) | (z < 7))/length(z)

## ----dice_between--------------------------------------------------------
sum((6 <= even.more.sims) & (even.more.sims <= 8))/length(even.more.sims)

## ----dice_beyond---------------------------------------------------------
sum((even.more.sims < 6) | (even.more.sims > 8))/length(even.more.sims)

## ----advanced_conditions-------------------------------------------------
#same as between 6 & 8 inclusive
mean(abs(even.more.sims - 7) <= 1)
#same as below 6 or above 8 -- the logical opposite of between 6 & 8 inclusive:
mean(!abs(even.more.sims - 7) <= 1)

## ----exercise_7----------------------------------------------------------
passadieci <- replicate(100000, my.dice.sum(n.dice = 3, n.sides = 6))
sum(passadieci >= 11)/length(passadieci)
sum(passadieci == 11)/length(passadieci)
sum(passadieci == 12)/length(passadieci)
sum((passadieci <= 7) | (passadieci >= 15))/length(passadieci)
plot(table(passadieci)/length(passadieci), xlab = 'Sum', 
     ylab = 'Relative Frequency', main = 'Passadieci Simulation: 100000 Throws')

## ----exercise_8----------------------------------------------------------
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

