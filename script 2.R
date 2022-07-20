

# PACKAGES 

how to load packages


load packages...


library("outbreaks")



# library(janitor)
# clean_names()
# library(lubridate)




# Reading in data:

# .Rdata files
# .csv files  - read.csv (base); read_csv (readr package)
# .xlsx
# .txt
# .sas7dat - haven package...

# also....some data are "already in R" or in R packages....

# Read in data ----
idData <- read.csv("https://bit.ly/cali-id") # Read in csv file

view....

# Get some data
library("outbreaks")
full_data <- ebola_sierraleone_2014  




# examine the data



head(full_data) # Print out first few rows
View(full_data) # View the data frame
#str(full_data) # View the structure
names(full_data) # View the column names

min(full_data$age)  # Minimum
table(full_data$district) # Frequency table






