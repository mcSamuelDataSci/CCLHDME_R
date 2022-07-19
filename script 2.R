# junk <- read.csv("https://data.chhs.ca.gov/dataset/7a456555-87b9-4830-817c-72d72e628745/resource/f8bb67bf-923d-4d74-8714-dc2bcf5609b7/download/2021-11-29_deaths_final_2014_2020_state_year_sup.csv")
# county_deaths <- read.csv("https://data.chhs.ca.gov/dataset/58619b69-b3cb-41a7-8bfc-fc3a524a9dd4/resource/579cc04a-52d6-4c4c-b2df-ad901c9049b7/download/2021-11-29_deaths_final_2014_2020_county_year_sup.csv")

# Reading in data ----
# .Rdata files
# .RDS files
# .csv files
# .xlsx
# .txt
# .sas7dat
# .json
# ....

# Read in data ----
idData <- read.csv("https://bit.ly/cali-id") # Read in csv file

# Functions to explore data ----
head(idData) # Print out first few rows
View(idData) # View the data frame
str(idData) # View the structure
names(idData) # View the column names

min(idData$Year)  # Minimum
max(idData$Year) #  Maximum
table(idData$Year) # Frequency table




# Install packages ----
install.packages("ggplot2") # Popular visualization package
library(ggplot2)

install.packages("dplyr") # Popular data wrangling package, part of tidyverse suite
library(dplyr)


