library(dplyr)
library(zoo)
library(summarytools)
library(ggplot2)
library("outbreaks")



# library(janitor)
# clean_names()
# library(lubridate)



ebolaOutbreak0 <- ebola_sierraleone_2014

view(dfSummary(ebolaOutbreak0))

# tidyverse filter rows based on condition
temp  <- filter(ebolaOutbreak0, status == "confirmed")    
temp2 <- ebolaOutbreak0 %>% filter(status == "confirmed") # same exact thing

# tidyverse select columns and rename a couple at the same time
temp  <- ebolaOutbreak0 %>% select(age, status, onset = date_of_onset, district )

temp <- ebolaOutbreak0 %>%
         mutate(onset_yr_mo = as.yearmon(date_of_onset))  # zoo package; make year_month variable

# "piping" the steps above into one unit with %>%
ebola_dat <- ebolaOutbreak0 %>% 
               filter(status == "confirmed") %>%
               select(age, status, onset = date_of_onset, district ) %>%
               mutate(onset_yr_mo = as.yearmon(onset))  



ebola_dat2 <- ebola_dat %>% 
               group_by(district) %>%
               summarize(N = n(),
                         age = round(mean(age, na.rm=TRUE),1)  )

barplot(ebola_dat2$N, names.arg= ebola_dat2$district)


ggplot(data=ebola_dat2, aes(x=district, y = N)) + # core ggplot set up
   geom_bar(stat="identity", fill="darkblue") +                    # geom = what type of plot
   coord_flip() +
   labs(y="Number of Confirmed Cases")







ebola_dat3 <- ebola_dat %>% 
  group_by(district, onset_yr_mo) %>%
  summarize(N = n(),
            age = round(mean(age, na.rm=TRUE), 1)  )

# core ggplot set up
ggplot(data=ebola_dat2, aes(x=onset_yr_mo, y = N, col=district )) + 
       geom_line(size=1.2)


pop_dat <- read.csv("sierra_leone.csv")


ebola_dat2 <- full_join(ebola_dat2, pop_dat, by= c("district" = "District")) %>%
                mutate(Rate = N*100000/Population)





install.packages("epikit")
library("epikit")
attack_rate(121, 555555, multiplier = 100000)


