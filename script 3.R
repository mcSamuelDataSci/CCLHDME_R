

library(dplyr)


load packages...


library(zoo)
library(summarytools)
library(ggplot2)
library("outbreaks")



# library(janitor)
# clean_names()
# library(lubridate)

# Note: all data "wrangling here using tidyverse dplyr

full_data <- ebola_sierraleone_2014  # get "built-in" data set

view(dfSummary(full_data))

# filter rows based on condition
just_confirmed <- filter(ebolaOutbreak0, status == "confirmed")    
just_confirmed <- ebolaOutbreak0 %>% filter(status == "confirmed") # same exact thing

# select columns and rename a couple at the same time
just_some_variables <- full_data %>% 
                        select(age, status, onset = date_of_onset, district )

full_data_plus  <- full_data %>%
                    mutate(onset_yr_mo = as.yearmon(date_of_onset))  # zoo package; make year_month variable

# "piping" the steps above into one unit with %>%
good_data  <- ebolaOutbreak0 %>% 
                 filter(status == "confirmed") %>%
                 select(age, status, onset = date_of_onset, district ) %>%
                 mutate(onset_yr_mo = as.yearmon(onset))  

# grouping by district and then county cases in each district
district_data <- good_data  %>% 
                   group_by(district) %>%
                   summarize(N   = n(),
                             age = round(mean(age, na.rm=TRUE),1)  )

barplot(district_data$N, names.arg= district_data$district)


ggplot(data=district_data, aes(x=district, y = N)) + # core ggplot set up
   geom_bar(stat="identity", fill="darkblue") +                    # geom = what type of plot
   coord_flip() +
   labs(y="Number of Confirmed Cases")


district_time_data  <- good_data %>% 
  group_by(district, onset_yr_mo) %>%
  summarize(N = n() )

# core ggplot set up
ggplot(data=district_time_data, aes(x=onset_yr_mo, y = N, col=district )) + 
       geom_line(size=1.2)


pop_dat <- read.csv("sierra_leone.csv")

rate_data  <- full_join(district_data, pop_dat, by= c("district" = "District")) %>%
                mutate(Rate = N*100000/Population)





install.packages("epikit")
library("epikit")
attack_rate(121, 555555, multiplier = 100000)


