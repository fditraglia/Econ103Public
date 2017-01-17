library(data.table)
setwd("~/Econ103Public/AppliedExamples")
resume <- fread("resume.csv")

dim(resume)
head(resume)
tail(resume)
summary(resume)

race_table <- table(race = resume$race, call = resume$call)
race_table
addmargins(race_table)

resume_black <- resume[race == 'black']
resume_black
mean(resume_black$call)

resume_white <- resume[race == 'white']
resume_white
mean(resume_white$call)

resume_black_male <- resume[race == 'black' & sex == 'male']
resume_black_male
resume_white_male <- resume[race == 'white' & sex == 'male']
resume_white_male
mean(resume_white_male$call) - mean(resume_black_male$call)

resume_black_female <- resume[race == 'black' & sex == 'female']
resume_black_female
resume_white_female <- resume[race == 'white' & sex == 'female']
resume_white_female
mean(resume_white_female$call) - mean(resume_black_female$call)