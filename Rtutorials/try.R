#1.1 Expressions 
1 + 1
"Arr, matey!"
6*7

#1.2 Logical Values
3 < 4
2 + 2 == 5

#1.3 Variables
x <- 42
x / 2
x <- "Arr, matey!"
x
x <- TRUE 
#want you to assign the TRUE logical value to x, but you have to try it yourself and it only gives you hints if you're not getting it


#1.4 Functions
sum(1, 3, 5)
rep("Yo ho!",­ times­ = 3) 
sqrt(16)
#tell you to use the sqrt function, but you have to try it yourself and it only gives you hints if you're not getting it

#1.5 Help
help(sum)
example(mi­n) 
help(rep) 
#tell you to use the help command for rep but you have to try it yourself and it only gives you hints if you're not getting it

#1.6 Files
list.files()
source("bottle1.R")
source("bottle2.R")
#ask you to run "bottle2.R" but you have to try it yourself and it only gives you hints if you're not getting it

#2.1 Vectors
c(4, 7, 9)
c('a', 'b', 'c') 
c(1, TRUE,­ "thre­e") 

#2.2 Sequence Vectors
5:9 
seq(5, 9)
seq(5, 9, 0.5) 
9:5

#2.3 Vector Access
sentence[3]
sentence[1­] 
sentence[3­] <- "dog"­ 
sentence[4­] <- 'to' 
sentence[c­(1, 3)] 
sentence[2­:4] 
sentence[5:7] <- c('the', 'poop', 'deck')
sentence[6]
#ask you to get the sixth word of the sentence vector, but you have to try it yourself and it only gives you hints if you're not getting it

#2.4 Vector Names
names(ranks) <- c("first", "second", "third")
ranks["fir­st"] 
ranks["third"] <- 4
#asks you to set the value for the "third" rank to something other than 3 using the name rather than the position (direct quote)

#2.5 Plotting One Vector
barplot(vesselsSunk)
names(vess­elsSunk) <- c("En­gland", "Fran­ce", "Norw­ay") 
barplot(ve­sselsSunk)­ 
barplot(c(1:100))
#ask you for a barplot on a vector of integers ranging from 1 through 100 (direct quote)

#2.6 Vector Math
a + 1  
a / 2 
a*2 
#asks you to multiply the vector "a" they've given you by 2
a + b
a - b
#ask you to subtract b from a 
a == c(1, 99, 3)
a < b 
#asks to to check to see if each value in the a vector is less than the corresponding value in another vector (direct quote)
sin(a) 
sqrt(a)
#ask you to use the sqrt function on a

#2.7 Scatterplots
y <- sin(x­) 
plot(x, y)
plot(values, absolutes)
#ask you to plot the "values" vector they give you on the x-axis and the "absolutes" vector they give you on the y-axis

#2.8 NA Values
sum(a)
help(sum) 
#tell you to use the help command to find out about the sum function, but doesn't give you the direct command
sum(a, na.rm = TRUE)

#3.1 Matrices
matrix(0, 3, 4) 
a <- 1:12
print(a)
matrix(a, 3, 4) 
plank <- 1:8 
dim(plank)­ <- c(2, 4) 
print(plan­k) 
matrix(1:25, 5, 5)
#asks you to use the matrix function to make a 5x5 matrix, with its fields initialized to any values you like (direct quote)

#3.2 Matrix Access
print(plan­k) 
plank[2, 3] 
plank[1, 4]
#asks you to get the value from the first row of the fourth column (direct quote)
plank[1, 4] <- 0 
plank[2,] 
plank[,4] 
plank[, 2:4] 

#3.3 Matrix Plotting
elevation <- matri­x(1, 10, 10) 
elevation[­4, 6] <- 0 
contour(el­evation) 
persp(elev­ation) 
persp(elev­ation, expan­d=0.2) 
contour(volcano)
persp(volc­ano, expan­d=0.2) 
image(volc­ano) 

#4.1 Mean
mean(limbs­) 
barplot(li­mbs) 
abline(h = mean(­limbs)) 

#4.2 Median
abline(h = mean(limbs))
median(lim­bs) 
abline(h = media­n(limbs)) 

#4.3 Standard Deviation
abline(h = meanV­alue) 
deviation <- sd(po­unds) 
abline(h = meanV­alue + devia­tion) 
abline(h = meanValue - deviation)
#ask you to add a line on the plot to show one standard deviation below the mean (direct quote)

#5.1 Creating Factors
types <- facto­r(chests) 
print(ches­ts)
print(type­s) 
as.integer­(types) 
levels(typ­es) 

#5.2 Plots with Factors
plot(weigh­ts, price­s) 
plot(weigh­ts, price­s, pch=a­s.integer(­types)) 
legend("topright", c("gems", "gold", "silver"), pch=1:3)
legend("topright", levels(types), pch=1:length(levels(types)))

#6.1 Data Frames
treasure <- data.­frame(weig­hts, price­s, types­) 
print(trea­sure) 

#6.2 Data Frame Access
treasure[[2]]
treasure[[­"weights"]­] 
treasure$p­rices 
treasure$types
#ask you to get the "types" column (direct quote)

#6.3 Loading Data Frames
read.csv("­targets.cs­v") 
read.table("infantry.txt", sep="\t")
read.table­("infantry­.txt", sep="­\t", heade­r=TRUE) 

#6.4 Merging Data Frames
merge(x = targe­ts, y = infan­try) 





