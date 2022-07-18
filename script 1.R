# Math operators ----
(2 + 5) * 4 / 3

# Objects ----
a <- 8 * 6
a
A # R is case-sensitive
A <- 7 * 7

ratePer <- 1000
5 / 5000 * ratePer
4 / 2000 * ratePer
6 / 7000 * ratePer

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

c(3, 7, 2, 9, 12) # Numeric vector
c(a, A, ratePer)

c("Alpine", "Alameda", "Butte") # Character vector

c(TRUE, FALSE) # Logical vector

c(1, "Alpine", TRUE) # Converts elements to character type
c(1, TRUE, FALSE) # Converts to numeric type - Underlying integer for TRUE is 1, FALSE is 0

myVector <- c(4, 10, 8) # Store vectors as objects

myVector ^ 2 # Operations on a vector
myVector + 3
myVector + myVector

# Subsetting vectors ----
# myVector[1] # Return 1st value
# myVector[4] # Returns NA (Not Available) since vector only has 3 values
# myVector[-1] # Return all values except the first
# myVector[c(1, 2)] # Return 1st and 2nd value

# Functions ----
values <- c(1, 2, 3, 4, 5)
values
length(values) # How many values are in the vector
sum(values) # Sums up all values in the vector
sum(values) / length(values) # Use two functions above to calculate mean
mean(values) # Or use mean function

NA # Not available

values <- c(1, 2, 3, 4, 5, NA) # Add missing value (NA) to vector
values

mean(values) # Returns NA due to one NA value

?mean # View documentation of mean function

mean(values, na.rm = TRUE) # Specify na.rm argument to TRUE, which removes NA value, then computes mean

x_values <- 1:5
x_values
y_values <- x_values * 2
y_values

plot(x = x_values, y = y_values)
?plot
plot(x = x_values, y = y_values, type = "l", 
     main = "Plot", xlab = "X values", ylab = "Y values")

# Data structures - Data frames ----
county <- rep("Alameda", 3)
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
myData$rate # rate column doesn't exist

# Create column that stores crude rates per 100k population
myData$Rate <- myData$N / myData$Population * ratePer
myData
View(myData)

str(myData)

