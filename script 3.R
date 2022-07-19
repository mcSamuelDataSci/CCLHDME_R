library(dplyr)
library(lubridate)
library(zoo)
library(summarytools)
library(ggplot2)
library("outbreaks")

library(janitor)
clean_names()

ebola <- ebola_sierraleone_2014

view(dfSummary(ebola))


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


