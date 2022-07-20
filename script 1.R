# Math operators ----
4 + 2
2 + 3 * 4

# Objects ----
a <- 8 * 6
a
A # R is case-sensitive

a * 2
a * a 
a <- 57

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
T # Equivalent to TRUE
F # Equivalent to FALSE

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
mean(vectorNum) # Compute the mean

vectorNum <- c(3, 7, 2, 9, 12, NA) # NA = Not Available
vectorNum

mean(vectorNum) # Returns NA
?mean # View Documentation
mean(vectorNum, na.rm = TRUE) # Set `na.rm` argument to TRUE to remove NA values before computing the mean
