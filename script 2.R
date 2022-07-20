
# Almost any type of data can be read into R 

# .csv files  - read.csv (base); read_csv (readr package)
# .xlsx       - read_xlsx (readxl package)   
# .txt        - read.table (base)  
# .sas7dat    - read_sas (haven package) 


# Read in data ----
idData <- read.csv("https://bit.ly/cali-id") # Read in csv file

View(idData) # View the dataset in RStudio

# Installing and loading in packages ----

# Two ways to install a package:
# 1) Go to 'Packages' tab in bottom-right pane -> Install -> Type package name
# 2) use `install.packages()` function

# ONLY NEED TO RUN ONCE
install.packages("outbreaks")

# Must run this every time a new session is created. Loads package
library(outbreaks)

# Dataset from outbreaks packages - Learn more about this dataset here:
# https://www.reconverse.org/outbreaks/reference/ebola_sierraleone_2014.html
full_data <- ebola_sierraleone_2014  

# Common functions for examining the data ----

head(full_data) # Print out first few rows
View(full_data) # View the data frame
#str(full_data) # View the structure
names(full_data) # View the column names

min(full_data$age, na.rm = TRUE)  # Minimum
table(full_data$district) # Frequency table






