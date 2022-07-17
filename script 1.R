# R Basics

# Mathematical operators ----
2 + 2 # Addition
8 - 7 # Subtraction
2 * 3 # Multiplication
4 / 3 # Division
4^2 # 4 to the power of 2
2 + 3 * 6
(2 + 3) * 6


# Objects ----
a <- 8 * 6
a
A # R is case sensitive
A <- 7 * 7

ratePer <- 100000

5 / 5000 * ratePer
3 / 4000 * ratePer
6 / 6000 * ratePer

# Rules for naming objects ----
1object <- 1
object1 <- 1
object! <- 1
object name <- 1
object.name <- 1
object_name <- 1
objectName <- 1 #camelCase

# Remove objects ----
rm(objectName)
objectName

# Data classes ----

# Numeric (numbers) ----
12.6
3
5.8

# Character (text) ----
"R Workshop"
'R Workshop'
'Welcome to the first CCLHDME "R Workshop" '

# Logical (TRUE, FALSE) ----
TRUE
FALSE
True
true
T # TRUE
F  # FALSE

# Data structures - Vectors ----
c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) # Numeric vector
c(1:10) # Shorter way to generate a sequence of values

c("Alpine", "Alameda", "Butte") # Character vector
c(Alpine, Alameda, Butte) # Error
c(object_name, object.name, object1) # Vectors of objects with single values of same type

c(TRUE, FALSE) # Logical vector

c(1, "Alpine", TRUE) # Converts elements to character type
c(1, TRUE, FALSE) # Converts to numeric type - Underlying integer for TRUE is 1, FALSE is 0

myVector <- c(2, 3, 4) # Store vectors as objects

myVector ^ 2 # Operations on a vector
myVector + 3
myVector + myVector

myVector <- c("Alameda", "Alpine", "Butte")
myVector + "County"
paste(myVector, "County")

# Subsetting vectors ----
myVector[1] # Return 1st value
myVector[4] # Returns NA (Not Available) since vector only has 3 values
myVector[-1] # Return all values except the first
myVector[c(1, 2)] # Return 1st and 2nd value

# Functions ----
values <- 1:50
values
length(values) # How many values are in the vector
sum(values) # Sums up all values in the vector
sum(values) / length(values) # Use two functions above to calculate mean
mean(values) # Or use mean function

?mean # View documentation of mean function

values <- c(1:50, NA) # Add missing value (NA) to vector
values

mean(values) # Returns NA due to one NA value
mean(values, na.rm = TRUE) # Specify na.rm argument to TRUE, which removes NA value, then computes mean

x_values <- 1:50
x_values
y_values <- x_values * 2
y_values

?plot
plot(x = x_values, y = y_values)
plot(x = x_values, y = y_values, type = "l")
plot(x = x_values, y = y_values, type = "p", 
     main = "Plot", xlab = "X values", ylab = "Y values")

# Data structures - Data frame ----
