# Math operators ----
4 + 2
2 + 3 * 4

# Objects ----
a <- 8 * 6
a
A # R is case-sensitive

ratePer <- 1000
(5 / 5000) * ratePer
(4 / 2000) * ratePer

# Data classes ----

# Numeric (numbers) ----
12.6
3

# Character (text) ----
"Workshop"
Workshop

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

vectorNum <- c(3, 7, 2, 9, 12, NA) # Numeric vector
vectorNum

mean(vectorNum)
?mean
mean(vectorNum, na.rm = TRUE)
