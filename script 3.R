
# https://github.com/reconverse/outbreaks

library(dplyr)
library(lubridate)
library(zoo)
library("outbreaks")
library(summarytools)
library(ggplot2)

ebola <- ebola_sierraleone_2014

view(dfSummary(ebola))

junk <- fluH7N9_china_2013
view(dfSummary(rabies))



ebola <- ebola %>%
           mutate(good_date = as.Date(date_of_onset),
                  good_year = year(date_of_onset),
                  good_q = as.yearmon(date_of_onset))

ebola1 <- ebola %>% 
  group_by(district, good_q) %>%
  summarize(N = n())


ebola2 <- ebola %>% 
           group_by(district, good_q) %>%
           summarize(N = n())




barplot(ebola2$N, names.arg= ebola2$good_q)




ggplot(data=ebola1, aes(x=good_q, y = N)) + geom_col()
ggplot(data=ebola2, aes(x=good_q, y = N)) + geom_col()

ggplot(data=ebola1, aes(x=good_q, y = N)) + geom_bar(stat="identity")
ggplot(data=ebola2, aes(x=good_q, y = N)) + geom_bar(stat="identity")


ggplot(data=ebola, aes(x=good_q)) + geom_bar(stat="count") + facet_grid(rows = vars(district))





ggplot(data=ebola2, aes(x=good_q, y = N)) + geom_bar(stat="sum")
ggplot(data=ebola2, aes(x=good_q, y = N)) + geom_bar(stat="mean")





install.packages("epikit")
library("epikit")
attack_rate(121, 555555, multiplier = 100000)



data wrangling include summraizing N; probalby calcualte a Rate or something

dply (tidyverse)

pipe!!!
  
  
lubridate  to month/year




  
gpplot  ....  
