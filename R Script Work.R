WAYYYYYYYYYYYYYYY to much ....



# the library() function loads needed packages for the current session
#  these packages must have already been installed 
#  there are several ways to do this including:  install.packages("readr") etc.

library(dplyr)   # core "tidyverse" package for data manipulation
library(ggplot2) # data visualization package
library(readr)   # tools for reading all sorts of data into R


#######################################################################################################
## GETTING SOME DATA AND SETTING IT UP ################################################################


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


