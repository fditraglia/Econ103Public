die <- 1:6
set.seed(3201)
small <- sample(die, size = 10, replace = TRUE)
medium <- sample(die, size = 50, replace = TRUE)
large <- sample(die, size = 1000, replace = TRUE)
huge <- sample(die, size = 1000000, replace = TRUE)

plot(table(small)/10, xlab = 'n = 10', ylab = 'Relative Frequency', type = 'h', main = 'Random Die Rolls')

plot(table(medium)/50, xlab = 'n = 50', ylab = 'Relative Frequency', type = 'h', main = 'Random Die Rolls')

plot(table(large)/1000, xlab = 'n = 1000', ylab = 'Relative Frequency', type = 'h', main = 'Random Die Rolls')

plot(table(huge)/1000000, xlab = 'n = 1,000,000', ylab = 'Relative Frequency', type = 'h', main = 'Random Die Rolls')