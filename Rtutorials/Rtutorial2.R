## ----fread---------------------------------------------------------------
#You should have data.table installed from the first R tutorial.
#  if not, run the following line of code before library:
#  install.packages("data.table")
library(data.table)
survey = fread("http://www.ditraglia.com/econ103/old_survey.csv")

## ----add_column, results = 'hide'----------------------------------------
survey[ , height_handspan_ratio := height/handspan]

## ----remove_column, results = 'hide'-------------------------------------
survey[ , 7:10 := NULL]

## ----head_tail-----------------------------------------------------------
head(survey)
tail(survey)

## ----hist_plain, results = 'hide'----------------------------------------
survey[ , hist(handedness)]

## ----hist_dressed, results = 'hide'--------------------------------------
survey[ , hist(handedness, xlab = 'Handedness Score',
               main = 'Histogram of Handedness Scores',
               ylab = '# of Students')]

## ----hist_breaks, results = 'hide'---------------------------------------
survey[ , hist(handedness, breaks = 20, xlab = 'Handedness Score',
               main = 'Histogram of Handedness Scores')]

## ----hist_freq, results = 'hide'-----------------------------------------
survey[ , hist(handedness, breaks = 20, freq = FALSE,
               xlab = 'Handedness Score', main = 'Histogram of Handedness')]

## ----plot_basic, results = 'hide'----------------------------------------
survey[ , plot(height, handspan)]

## ----plot_rev, results = 'hide'------------------------------------------
survey[ , plot(handspan, height)]

## ----plot_ornament, results = 'hide'-------------------------------------
survey[ , plot(height, handspan, xlab = "height (in)", ylab = "handspan (cm)")]

## ----plot_col, results = 'hide'------------------------------------------
survey[ , plot(height, handspan, xlab = "height (in)",
               ylab = "handspan (cm)", col = "red")]

## ----plot_pch, results = 'hide'------------------------------------------
survey[ , plot(height, handspan, xlab = "height (in)",
               ylab = "handspan (cm)", col = "red", pch = 3)]

## ----plot_type_l, results = 'hide'---------------------------------------
survey[ , plot(height, handspan, xlab = "height (in)",
               ylab = "handspan (cm)", col = "red", pch = 3, type = 'l')]

## ----pairs---------------------------------------------------------------
pairs(survey[ , c("handedness", "handspan", "height")])

## ----boxplot, results = 'hide'-------------------------------------------
boxplot(survey$handspan, ylab = "Handspan(cm)")

## ----boxplot_comparison--------------------------------------------------
boxplot(handspan ~ sex, data = survey, 
        ylab= "Handspan (cm)", main = "Handspan by Sex")

## ----two_way_table-------------------------------------------------------
survey[ , table(eye.color, sex)]

## ----one_way_table-------------------------------------------------------
survey[ , table(eye.color)]

## ----addmargins----------------------------------------------------------
my.table = survey[ , table(eye.color, sex)]
addmargins(my.table)

## ----prop.table----------------------------------------------------------
my.table = survey[ , table(eye.color, sex)]
prop.table(my.table)

## ----prop.table_pct------------------------------------------------------
100 * prop.table(my.table)

## ----prob.table_round----------------------------------------------------
round(100 * prop.table(my.table), digits = 1)
round(100 * prop.table(my.table), digits = 0)

## ----summary-------------------------------------------------------------
summary(survey)

## ----sum_missing---------------------------------------------------------
sum(survey$height)

## ----sum_na.rm-----------------------------------------------------------
sum(survey$height, na.rm = TRUE)

## ----mean_na.rm_1--------------------------------------------------------
mean(survey$height, na.rm = TRUE)

## ----mean_na.rm_2--------------------------------------------------------
#3 observations
mean(1:3)
#3 observations, but one missing observation --
#  so the denominator in the mean is 2
mean(c(1, 2, NA), na.rm = TRUE)

## ----var_na.rm-----------------------------------------------------------
var(survey$height, na.rm = TRUE)

## ----sd_na.rm------------------------------------------------------------
sd(survey$height, na.rm = TRUE)

## ------------------------------------------------------------------------
sqrt(var(survey$height, na.rm = TRUE))

## ----median_na.rm--------------------------------------------------------
median(survey$height, na.rm = TRUE)

## ----quantile_5no--------------------------------------------------------
quantile(survey$height, na.rm = TRUE)

## ----quantile_probs------------------------------------------------------
quantile(survey$height, na.rm = TRUE, probs = 0.3)

## ----quantile_many_probs-------------------------------------------------
quantile(survey$height, na.rm = TRUE, probs = c(0.1, 0.3, 0.7, 0.9))

## ----iqr-----------------------------------------------------------------
IQR(survey$height, na.rm = TRUE)

## ----iqr_w_quantile------------------------------------------------------
x = quantile(survey$height, na.rm = TRUE, probs = c(.25, .75))
x[2] - x[1]

## ----max_min-------------------------------------------------------------
max(survey$height, na.rm = TRUE)
min(survey$height, na.rm = TRUE)

## ----range_by_hand-------------------------------------------------------
max(survey$height, na.rm = TRUE) - min(survey$height, na.rm = TRUE)

## ----range---------------------------------------------------------------
range(survey$height, na.rm = TRUE)

## ----which.max_min-------------------------------------------------------
which.max(survey$height)
survey[which.max(height)]
survey[which.min(height)]

## ----factors_basics------------------------------------------------------
school = c("SAS", "Wharton", "Wharton", "SEAS", "SAS", "Nursing", "SAS")
school_factor = factor(school)
class(school)
class(school_factor)
school
school_factor

## ----factor_dput---------------------------------------------------------
dput(school_factor)

## ----factor_levels-------------------------------------------------------
levels(school_factor)

## ----factor_convert------------------------------------------------------
summary(survey$eye.color)
survey[ , eye.color := factor(eye.color)]
summary(survey$eye.color)

## ----by_mean-------------------------------------------------------------
survey[ , mean(height, na.rm = TRUE), by = sex]

## ----by_var--------------------------------------------------------------
survey[ , var(height, na.rm = TRUE), by = sex]

## ----by_var_named--------------------------------------------------------
survey[ , .(variance = var(height, na.rm = TRUE)), by = sex]

## ----by_eye.color--------------------------------------------------------
survey[ , mean(height, na.rm = TRUE), by = eye.color]

## ----by_multiple---------------------------------------------------------
survey[ , .(avg_height = mean(height, na.rm = TRUE)), by = .(sex, credits)]

## ----is_na---------------------------------------------------------------
x = c(1, 2, NA, 3, NA, 4)
is.na(x)

## ----not-----------------------------------------------------------------
!is.na(x)

## ----and-----------------------------------------------------------------
y = c(NA, 1, NA, 2, 3, NA)
is.na(y)
!is.na(y)
!is.na(x) & !is.na(y)

## ----not_is_na-----------------------------------------------------------
survey[!is.na(sex) & !is.na(credits),
       .(avg_height = mean(height, na.rm = TRUE)),
       by = .(sex, credits)]

## ----keyby---------------------------------------------------------------
survey[!is.na(sex) & !is.na(credits),
       .(avg_height = mean(height, na.rm = TRUE)),
       keyby = .(sex, credits)]

## ----cut_1---------------------------------------------------------------
grades = c(67, 93, 85, 82, 88, 86, 78, 97, 74, 77, 81)

## ----cut_2---------------------------------------------------------------
cut(grades, c(60, 70, 80, 90, 100))

## ----cut_right_false-----------------------------------------------------
cut(grades, c(60, 70, 80, 90, 100), right = FALSE)

## ----cut_labels----------------------------------------------------------
cut(grades, c(60, 70, 80, 90, 100), 
    labels = c("D", "C", "B", "A"), right = FALSE)

## ----exercise_2_ti-------------------------------------------------------
library(data.table)
titanic = fread("http://www.ditraglia.com/econ103/titanic3.csv")
head(titanic)

## ----exercise_3_ti-------------------------------------------------------
titanic[ , c("name", "sibsp", "parch", "ticket", "cabin",
             "embarked", "boat", "body", "home.dest") := NULL]
head(titanic)

## ----exercise_4_ti-------------------------------------------------------
titanic[ , sex := factor(sex)]
titanic[ , pclass := factor(pclass)]

## ----exercise_5_ti-------------------------------------------------------
summary(titanic)

## ----exercise_6_ti-------------------------------------------------------
titanic[ , sd(fare, na.rm = TRUE)]
titanic[ , quantile(fare, .9, na.rm = TRUE)]
titanic[ , hist(fare, col = 'red')]

## ----exercise_7_ti-------------------------------------------------------
boxplot(fare ~ pclass, data = titanic, horizontal = TRUE, las = 1L,
        main = "Boxplots of Fare by Passenger Class")

## ----exercise_8_ti-------------------------------------------------------
summary(titanic[survived == 1])

## ----exercise_9_ti-------------------------------------------------------
titanic[ , mean(fare, na.rm = TRUE), by = sex]

## ----exercise_10_ti------------------------------------------------------
titanic[ , mean(fare, na.rm = TRUE), keyby = .(sex, pclass)]

## ----exercise_11_ti------------------------------------------------------
titanic[ , mean(survived), keyby = .(sex, pclass)]

## ----exercise_12_ti------------------------------------------------------
titanic[ , age.group := cut(titanic$age, c(0, 15, 25, 65, 200), 
                            c("Child", "Youth", "Adult", "Senior"), 
                            right = FALSE)]

## ----exercise_13_ti------------------------------------------------------
titanic[!is.na(age), mean(survived), keyby = .(sex, pclass, age.group)]

## ----exercise_1_ph-------------------------------------------------------
wages = fread('https://data.phila.gov/api/views/ihvw-4zq5/rows.csv')
wages

## ----exercise_2_ph-------------------------------------------------------
wages[ , salary := as.numeric(gsub("$", "", `Annual Salary`, fixed = TRUE))]
summary(wages$salary)

## ----exercise_3_ph-------------------------------------------------------
wages[which.max(salary)]

## ----exercise_4_ph-------------------------------------------------------
wages[order(-salary)]

