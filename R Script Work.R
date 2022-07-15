WAYYYYYYYYYYYYYYY to much ....



# the library() function loads needed packages for the current session
#  these packages must have already been installed 
#  there are several ways to do this including:  install.packages("readr") etc.

library(dplyr)   # core "tidyverse" package for data manipulation
library(ggplot2) # data visualization package
library(readr)   # tools for reading all sorts of data into R


#######################################################################################################
## GETTING SOME DATA AND SETTING IT UP ################################################################



cases       <- 232
pop         <- 47233
died        <- FALSE
died_again  <- FALSEIFY
some_county <- "Mono"
some_cases  <- c(2343,434,43423)
some_pops   <- c(434343,43432423,434334)



https://r4epi.github.io/epikit/
install.packages("epikit")
library("epikit")

attack_rate()
case_fatality_rate()
mortality_rate()
attack_rate(10, 50)
#>   cases population ar    lower    upper
#> 1    10         50 20 11.24375 33.03711
case_fatality_rate(2, 50)
#>   deaths population cfr    lower    upper
#> 1      2         50   4 1.103888 13.46009
mortality_rate(40, 50000)
#>   deaths population mortality per 10 000   lower    upper
#> 1     40      50000                    8 5.87591 10.89109
In addition, it’s possible to rapidly calculate Case fatality rate from a linelist, stratified by different groups (e.g. gender):
  
  library("outbreaks")
case_fatality_rate_df(ebola_sim_clean$linelist, 
                      outcome == "Death", 
                      group = gender,
                      add_total = TRUE,
                      mergeCI = TRUE
)
#> # A tibble: 3 x 5
#>   gender deaths population   cfr ci            
#>   <fct>   <int>      <int> <dbl> <chr>         
#> 1 f        1291       2280  56.6 (54.58--58.64)
#> 2 m        1273       2247  56.7 (54.59--58.69)
#> 3 Total    2564       4527  56.6 (55.19--58.08)






junk <- read.csv("https://data.chhs.ca.gov/dataset/7a456555-87b9-4830-817c-72d72e628745/resource/f8bb67bf-923d-4d74-8714-dc2bcf5609b7/download/2021-11-29_deaths_final_2014_2020_state_year_sup.csv")



county_deaths <- read.csv("https://data.chhs.ca.gov/dataset/58619b69-b3cb-41a7-8bfc-fc3a524a9dd4/resource/579cc04a-52d6-4c4c-b2df-ad901c9049b7/download/2021-11-29_deaths_final_2014_2020_county_year_sup.csv")


county_deaths <- junk


myCounty <- "Mono"


county_deaths_work <- county_deaths %>%
                        filter(Year == 2020,
                               Geography_Type == "Residence",
                               Cause == "ALL")
https://github.com/reconverse/outbreaks
library("outbreaks")
junk <- ebola_sim$linelist
library(summarytools)
view(dfSummary(junk))

names(county_deaths)



idData <- read.csv("https://data.chhs.ca.gov/dataset/03e61434-7db8-4a53-a3e2-1d4d36d6848d/resource/75019f89-b349-4d5e-825d-8b5960fc028c/download/odp_idb_2020_ddg_compliant.csv")

idData <- read.csv("https://bit.ly/cali-id")

library(dplyr)







https://data.chhs.ca.gov/dataset/mssa-detail3

hchi_mssa <- read.csv("https://oshpd-chhsagency.opendata.arcgis.com/datasets/CHHSAgency::mssa-detail.csv")


read GeoJSON?
library(geojsonR)

# INPUT IS A PATH TO A FILE
file_js = FROM_GeoJson(url_file_string = "feature_collection.geojson")



library(geojsonsf)
mySF <- geojson_sf("https://oshpd-chhsagency.opendata.arcgis.com/datasets/CHHSAgency::mssa-detail.geojson")




# URL for California COVID-19 data on the CHHS Open Data Portal. NOTE: This data reflects past 30 days
covid_re_url <- "https://data.chhs.ca.gov/dataset/f88f9d7f-635d-4334-9dac-4ce773afe4e5/resource/b500dae2-9e58-428e-b125-82c7e9b07abb/download/covid19demographicratecumulative.csv"

# Read the Covid data directly from the Open Data Portal. 
# Filter on race/ethnicity COVID data in California, and "clean up" the dataset a bit using "tidyverse" approach

covid_dat  <- read_csv(covid_re_url) %>%  
  filter(county == "California", 
         demographic_set == "race_ethnicity", 
         !demographic_set_category %in% c("Other", "Unknown"))  # Filter out 'Other' and 'Unknown' race groups 
              
covid_dat_cases <- covid_dat %>% filter(metric == "cases") %>% # Filter on cases
                    select(race      = demographic_set_category,
                           cases     = metric_value,
                           case_rate = metric_value_per_100k)      
  
  
########################################################################################################  
## Some simple plotting using **BASE R** ############################################################### 


# Produce simple bar chart of case rate per 100k population by race/ethnicity
barplot(covid_dat_cases$case_rate)


# Add race/ethnicity labels
barplot(covid_dat_cases$case_rate, 
        names.arg = covid_dat_cases$race)

# Add titles for each axis, and the plot
barplot(covid_dat_cases$case_rate, 
        names.arg = covid_dat_cases$race, 
        main = "COVID-19 Rate by Race/Ethnicity Past 30 Days", 
        xlab = "Race/Ethnicity", 
        ylab = "Case Rate per 100k Population")



####################################################
####################################################


ggplot(data = covid_dat_cases, aes(x = race, y = case_rate)) +
       geom_bar(stat = 'identity', fill = "blue") 



# Charts below are creating using 'ggplot2', a popular and powerful open-sourced data visualization R package

# Simple bar chart of case rate per 100k population by race/ethnicity, using ggplot2
ggplot(data = covid_dat_cases, aes(x = race, y = case_rate)) +
  geom_bar(stat = 'identity') +
  labs(title = "COVID-19 Rate by Race/Ethnicity Past 30 Days", 
       x = "Race/Ethnicity", 
       y = "Case Rate per 100k Population")


# Same chart, but as a horizontal bar chart
ggplot(data = covid_dat_cases, aes(x = race, y = case_rate)) +
  geom_bar(stat = 'identity') +
  coord_flip() + # This rotates the chart
  labs(title = "COVID-19 Rate by Race/Ethnicity Past 30 Days", 
       x = "Race/Ethnicity", 
       y = "Case Rate per 100k Population")



# Customizing appearance of chart
# 1) Add text labels (# of COVID-19 cases) inside each bar
# 2) Wrap Race/Ethnicity labels
# 3) Change bar color
# 4) Change ggplot2 theme
# 5) Change font attributes of plot and axis titles, axis text

library(stringr) # package needed for character string manipulation (e.g. for wrapping text)

ggplot(data = covid_dat_cases, aes(x = race, y = case_rate)) +
  geom_bar(stat = 'identity', fill = "darkblue", colour = 'black') + # Add bars; Specify bar color and border color
  geom_text(aes(label = paste0("N = ", scales::comma(cases))), vjust = 1, color = 'white') + # Add bar text labels
  scale_x_discrete(labels = function(x) str_wrap(x, width = 15)) + # Wrap Race/Ethnic labels
  labs(title = "COVID-19 Rate by Race/Ethnicity Past 30 Days", 
       x = "Race/Ethnicity", 
       y = "Case Rate per 100k Population") +
  theme_bw() + # Specify ggplot theme
  theme(plot.title = element_text(face = "bold", colour = "darkblue", size = 18), # Plot title font properties
        axis.title = element_text(face = "bold", size = 16), # Axis title font properties
        axis.text = element_text(size = 14)) # Axis text font properties


# COVID-19 Case, Death, and Test Rates by Race/Ethnicity in one chart using 'facet_grid'
ggplot(data = covid_dat, aes(x = demographic_set_category, y = metric_value_per_100k)) + 
  geom_bar(stat = 'identity', fill = "darkblue", colour = 'black') +
  geom_text(aes(label = paste0("N = ", scales::comma(metric_value, accuracy = 1))), vjust = 1, color = 'white') +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 15)) +
  labs(title = "COVID-19 Rate by Race/Ethnicity Past 30 Days", 
       x = "Race/Ethnicity", 
       y = "Rate per 100k Population") +
  facet_grid(rows = vars(metric), scales = "free") + # Forms a matrix of panels defined by faceting variable (in this case, by metric variable)
  theme_bw() + 
  theme(plot.title = element_text(face = "bold", colour = "darkblue", size = 18), 
        axis.title = element_text(face = "bold", size = 16),
        axis.text = element_text(size = 14), 
        strip.text = element_text(face = "bold", size = 12)) 


