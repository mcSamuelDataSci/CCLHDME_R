# One approach -- install desired packages as needed and then load them with library() each session

# once installed the package does not need to be installed again
#  these "install.packages" lines could also be done using the "Packages Tab" and selected the desired package
install.packages("epitools")
install.packages("dplyr")
install.packages("summarytools")

# library need to be run each session to make that package available during that session
library(epitools)
library(dplyr)
library(summarytools)


#----------------------------------------------------------------------------------

#  Another approach

# make a vector of need packages name
# run something like below to check to see if installed; if not it will install
# then it will load the packages like using library()



## 1.1  packages
.pkg	<- c("data.table","readr","readstata13","stringr","tidyr") 
.inst   <- .pkg %in% installed.packages() 
if(length(.pkg[!.inst]) > 0) install.packages(.pkg[!.inst]) 
lapply(.pkg, require, character.only=TRUE)           


#----------------------------------------------------------------------------------


# Checks if package is installed, installs if necessary, and loads package for current session

pacman::p_load(
  lubridate,  # general package for handling and converting dates  
  linelist,   # has function to "guess" messy dates
  aweek,      # another option for converting dates to weeks, and weeks to dates
  zoo,        # additional date/time functions
  tidyverse,  # data management and visualization  
  rio)        # data import/export



