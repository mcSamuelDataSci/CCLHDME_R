
# load some packages we will need

library(dplyr) # data wrangling
library(zoo)  # date manipulation
library(summarytools) # frequencies, cross tabs, summaries
library(ggplot2) # visualization


# library(janitor) # many useful functions (e.g. clean_names()
# library(lubridate) # working with dates
# library(stringr) # working with strings



# Note: all "data wrangling" below here using tidyverse dplyr


# library("outbreaks") # outbreak data sets
# get "built-in" data set from outbreak package
full_data <- ebola_sierraleone_2014  



view(dfSummary(full_data)) # from summarytools package




# *filter* rows based on condition
just_confirmed <- filter(ebolaOutbreak0, status == "confirmed")    
just_confirmed <- ebolaOutbreak0 %>% filter(status == "confirmed") 

# *select* columns and rename a couple at the same time
just_some_variables <- full_data %>% 
                        select(age, status, onset = date_of_onset, district )


# *mutate* to create new variables
# as.yearmon() function from zoo package
full_data_plus  <- full_data %>%
                    mutate(onset_yr_mo = as.yearmon(date_of_onset))  



# "piping" the steps above into one step with %>%
good_data  <- ebolaOutbreak0 %>% 
                 filter(status == "confirmed") %>%
                 select(age, status, onset = date_of_onset, district ) %>%
                 mutate(onset_yr_mo = as.yearmon(onset))  



# grouping by (group_by) district 
# count cases in each district with summarize
district_data <- good_data  %>% 
                   group_by(district) %>%
                   summarize(N   = n())

# simple chart with base R
barplot(district_data$N, names.arg= district_data$district)

# pretty simple bar chart with ggplot
ggplot(data=district_data, aes(x=district, y = N)) + # core ggplot set up
   geom_bar(stat="identity", fill="darkblue") +      # geom = what type of plot
   coord_flip() +                                    # "horizontal" bar chart
   labs(y="Number of Confirmed Cases")               # axis label







# grouping by (group_by) district and year-month 
district_time_data  <- good_data %>% 
  group_by(district, onset_yr_mo) %>%
  summarize(N = n() )

# line chart...
ggplot(data=district_time_data, aes(x=onset_yr_mo, y = N, col=district )) + 
       geom_line(size=1.2)








# read in Sierra Leone population data
pop_dat <- read.csv("sierra_leone.csv")

# join (merge) case data with population data 
# calculate rate with mutate
rate_data  <- full_join(district_data, pop_dat, by= c("district" = "District")) %>%
                mutate(Rate = N*100000/Population)


