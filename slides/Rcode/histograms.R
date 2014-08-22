setwd('~/Dropbox/Econ103/Slides/R Scripts')
student.data <- read.csv("survey_cleaned_fall_2012.csv")

attach(student.data)

hand.tab <- table(handspan)
t(round(as.matrix(rbind(hand.tab, prop.table(hand.tab))),2))


unique(handspan)
sum(!is.na(handspan))

plot(table(handspan), xlab = 'Handspan (cm)', ylab = 'Frequency', main = 'Barchart')

library(MASS)
truehist(handspan, xlab = 'Handspan (cm)', main = 'Histogram', ylab = 'Relative Frequency')


par(mfrow = c(2,2), mar = c(5.1, 4.1, 4.1, 2.1) - 1)
truehist(handspan, main = '4 Bins', ylab = '',xlab = '', nbins = 4)


truehist(handspan, main = '7 Bins (Auto)', xlab = '', ylab = '')

truehist(handspan, xlab = 'Handspan (cm)', main = '14 Bins', ylab = '', nbins = 14)


truehist(handspan, main = '100 Bins', ylab = '', xlab = 'Handspan (cm)', nbins = 100)

par(mfrow = c(1,1), mar = c(5.1, 4.1, 4.1, 2.1))

