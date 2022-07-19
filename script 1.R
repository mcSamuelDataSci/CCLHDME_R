# Math operators ----
4 + 2
(2 + 5) * 4 / 3

# Objects ----
a <- 8 * 6
a
A # R is case-sensitive
A <- 7 * 7

ratePer <- 1000
5 / 5000 * ratePer
4 / 2000 * ratePer

# Data classes ----

# Numeric (numbers) ----
12.6
3
5.8

# Character (text) ----
"Workshop"
Workshop
'Workshop'

# Logical (TRUE, FALSE) ----
TRUE
FALSE
True
false
T
F

# Data structures - Vectors ----

vectorNum <- c(3, 7, 2, 9, 12) # Numeric vector
vectorNum

vectorChar <- c("Alpine", "Alameda", "Butte") # Character vector
vectorChar

vectorLogical <- c(TRUE, FALSE) # Logical vector
vectorLogical


vectorNum ^ 2 # Operations on a vector
vectorNum + vectorNum

# Functions ----
mean(vectorNum)


# Data structures - Data frames ----
sex <- c("Female", "Male", "Total")
n <- c(4000, 6000, 10000)
population <- c(800000, 700000, 1500000)

# Create data frame
myData <- data.frame(County = county,
                     Sex = sex,
                     N = n, 
                     Population = population)
myData # Print out data frame in the R console
View(myData) # View data frame in R Studio

myData$N # $ operator, select specific column
myData$Rate # rate column doesn't exist

# Create column that stores crude rates per 100k population
myData$Rate <- myData$N / myData$Population * ratePer
myData
View(myData)

barplot(myData$Rate)
?barplot
barplot(myData$Rate, names.arg = myData$Sex)
