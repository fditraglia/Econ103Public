library(data.table)
star <- fread("http://ditraglia.com/Econ103Public/AppliedExamples/STAR.csv")

# race        student’s race (White = 1, Black = 2, Asian = 3, Hispanic = 4, 
#                             Native American = 5, Others = 6)
# classtype   type of kindergarten class (small = 1, regular = 2, 
#                                         regular with aid = 3)
# g4math      total scaled score for math portion of 4th grade standardized test
# g4reading   total scaled score for reading portion of 4th grade standardized test
# yearssmall  number of years in small classes
# hsgrad      high school graduation (did graduate = 1, did not graduate = 0)

# compare math scores across small vs regular size class
# make a table of graduation rates for black vs with across class sizes

small <- star[classtype == 1]
regular <- star[classtype == 2]
regular[, mean(g4math, na.rm = TRUE)]
small[, mean(g4math, na.rm = TRUE)]

star[, .(mean_g4math = mean(g4math, na.rm = TRUE)), keyby = classtype]
star[, sd(g4math, na.rm = TRUE)]
star[, mean(g4math, na.rm = TRUE)]

star[, .(mean_g4reading = mean(g4reading, na.rm = TRUE)), keyby = classtype]
star[, sd(g4reading, na.rm = TRUE)]
star[, mean(g4reading, na.rm = TRUE)]

star[, mean(hsgrad, na.rm = TRUE), by = classtype]
star[, .(grad_rate = mean(hsgrad, na.rm = TRUE)), keyby = .(classtype, race)]
star[, .(grad_rate = mean(hsgrad, na.rm = TRUE)), keyby = race]

lm(g4reading ~ g4math, data = star)

star[, hist(g4math)]

star[, mean(g4math, na.rm = TRUE)]