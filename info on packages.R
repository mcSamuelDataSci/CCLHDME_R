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

require()





