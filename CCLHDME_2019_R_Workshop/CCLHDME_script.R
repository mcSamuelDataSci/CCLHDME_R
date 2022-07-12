
#title: "CCLHDME R Workshop"
#author: 
#- Rebecca Fisher, MPH MA,  rfisher@ci.berkeley.ca.us, 510-981-5278
#- Michael Samuel, DrPH, michael.samuel@cdph.ca.gov, 925-285-2926
#date: "May 16, 2019"

## Welcome to the CCLHDME R Workshop!
### Housekeeping
#### Ensure you have **both** R and R Studio installed!
#### Ensure you are connected to the WIFI network


# Introductions
## Overview of workshop
## What we will do...
## What we won't do...
## Flow of the workshop...

## Agenda
### Orientation to R Studio and R Programming
### Basic Data Management, Tidying and Transformation
### Mapping
### Plotting
### Census API and Mapping
### Shiny

## Workshop Setup
### 1. Download zip file that has been sent out/posted to pcloud
### 2. Open R Studio
### 3. Navigate to File and Click
### 4. Under File, Select **Open File**
### 5. When the file browser opens, Select **CCLHDME_R_workshop_script**
### 6. Click Open


## R Studio IDE
### Now you will see the R Studio IDE with the script open
### There are multiple windows in the IDE, all with important uses

## Object Oriented Programming
### *Everything* in R is an object, including character and numeric vectors, data "frames", lists, functions, charts and graphs, and everything else
### This is one of the beauties of R, allowing for simple and complex integration of data, analysis, and outputs
### Each object has a unique name and has a class
### In R, you assign objects with names with the operator " <- "  (you can also use " = ", but it is generally better to use " <- "  )

my_number <- 8
my_number
my_vector <- c(1,1,5,10,50)
my_vector
my_character <- "awesome"
my_character
my_boolean <- TRUE
my_boolean
my_dataframe <- cbind(my_vector,my_vector^2)
my_dataframe



## Classes
### R differentiates between different types of data
### you will likely only ever deal with five flavors of data in R, which are stored as three data types

class(my_number)
class(pi)
class(my_boolean)
class(FALSE)
class("This object is made of characters")
class(as.Date("2015-07-27"))  

### The "factor" class will be discussed later--there are other classes too



##  A note on dates in R
### R stores dates as the number of days since the epoch (1 Jan 1970)
### Regular arithmetic operations can be conducted on dates
### The lubridate package (part of tidyverse) has many date-related functions that make working with dates much easier
### The function as.Date() converts character representations of a date to an object of class "Date" representing calendar dates

class(as.Date("2015-07-27"))  



## Functions
### A function is a set of statements that perform a specific task (they can be much like "procs" in SAS)
### In R, there are many functions built in to base R and packages
### Functions are called by name 
### Data are explicitly passed to functions
### Functions all have the same basic structure: function(arguments) where the arguments are other objects (i.e. data)
### When you call a function, it looks at the classes of the things you are calling it on to figure out how to behave
### there are many simple and obvious functions like mean(), median(), min()  
### c() function is used to create a vector, which is an ordered group of the same kind of data

## Functions are used to do a lot of different things!
mean(my_vector)
max(my_vector)
paste0(my_character,"...", my_character)
sum(1,2,3,3,4,5)
mean(c(1,2,3,4,5))


### making your own functions is a more advanced topic, but ultimately is essential for using R beyound the basics

myHypotenuse <- function(side1,side2) {sqrt(side1^2 + side2^2)}

myHypotenuse(10,20)
myHypotenuse(20,35)


## Operators
### Operators are mathematical and logical tools that are used often for analysis and data processing
### Mathematical:
### such as '+', '-', '*', '/', '^' 
### Logical:
### such as '==' (equal),'>', '<', '<=', '>=', '%in%'
### and, any of the logical operators can be preceded with an "!" to be "NOT"...
### more information on operators in R HERE https://www.datamentor.io/r-programming/operator/

### In some cases, some operators will only work with specific classes (e.g. "bob"*"bill" does not make sense, and will generate an error)

20/5
my_number*my_number
2 > 3
5^2 == 25
"joe" %in% c("bill","sue","joe")


## Directories
### In R you are always in a directory
### Your actions are all relative to that directory
### When you work in "projects", the directory is always set to where your project is stored

getwd()

### BUT, you can also set your directory to some other location using setwd()

#setwd("C://your_pathway_here")


## Testing data types
### you can test data types (i.e. ask logical equivalency questions)
is.character(my_number)
is.numeric(my_number)


## Changing data types
### you can change data types (if it makes sense!!!)

my_number_as_character <- as.character(my_number)
my_character_as_number <- as.numeric(my_character)
print(my_number_as_character)
print(my_character_as_number)

###**trying to coerce types can lead to weird behavior**

##Data Structures
### there are five kinds of data structures in R, but you will probably only ever use three of these
### vector
### list
### dataframe (in Tidyverse=Tibble)
#### a vector is an ordered group of the same kind of data
#### a list is an ordered group of things that are not of the same type
#### a dataframe is just a list of equal-length vectors
#### **What we are all probably used to!** 
#### **Tabular data, i.e. columns and rows**


##Packages in R
### Availability of all sorts of "packages" beyond base R is one of the things the makes R so powerful and useful. There are many specialty packages for epidemiology, for surveillance, for data presentation, and for almost anything you might want to do with data 
### Open source software leads to a lot of package development
### Download from repositories (online and openly accessible)
### CRAN: Official repository---packages here need to pass several tests that ensure the package is following CRAN policies.
### Github: not R specific, but is very popular repository for open source projects.  No review process associated with this repository.


##Get Documentation on R packages
### Learn to read package documentation and find tutorials/use cases
### See resource list (not exhaustive so dig around the internet!)
### Can use a search engine to find documentation and examples
### https://cran.r-project.org/web/packages/available_packages_by_name.html
###	https://stackoverflow.com/questions/tagged/r
### From script/console:
help(package = "tidyverse")


##Installing packages
### Install packages using the manual installer
### Install in script/console using: install.packages("package_name") 

#install.packages("tidyverse") 


## Loading or Calling packages in R session
### Any package that is needed in an R session must be loaded in that session  
### Load into environment using: library(package_name)


library(tidyverse)


##Tidyverse
### Tidyverse is a set of packages that makes many aspects of data manipulation and analysis ("data wrangling" in tidy-speak) much easier
### Tidyverse includes many packages that you're likely to use in every day data analyses
### The tidyverse collection of packages "share an underlying design philosophy, grammar and data structures" of **tidy data**
#### Learn more at: https://www.tidyverse.org/packages/ 
#### And: https://www.tidyverse.org/
#### And: https://tidyverse.tidyverse.org/
#### And: https://r4ds.had.co.nz/



## What is Tidy data?
### <img src="images/tidyr_tidy.png" width=700)>
### Check out Rstudio Cheatsheets (there's one on Tidyr, other tidyverse packages and more): https://www.rstudio.com/resources/cheatsheets/     


##On to working with data!
### We will be working with data form the CHHS open data portal
### In your browser, navigate to: https://data.chhs.ca.gov/dataset/infectious-disease-cases-by-county-year-and-sex
  
##Download CSV File
### Select Download
### Save file in our data sub-directory
### <img src="images/chhs_download.png" width=800)>
  
  
##Import data from the CSV
### Can import data manually through the "import dataset" utility under **File Menu**
### We will import the CSV file using read_csv()
### Remember we want to name an object that we will store the data to using **<-**

ca_id_data <- read_csv("./data/infectious-disease-cases-by-county-year-and-sex-2-27-19.csv")


##Importing from other file types
### Read semi-colon delimited files using read_csv2()
### Read files with any delimiter using read_delim()
### Read tab-delimited files using read_tsv()
### Read fixed width files using read_fwf()
### Read SPSS, Stata and SAS files with Haven (part of "tidyverse") or foreign package
### Need to install and call
### Read excel files with Readxl package
### Need to install and call



##Import data directly from the Open Data Portal using the API (Application Program Interface)  
### We can also pull the data directly from CHHS through the API using the url

##Now we pull the data from the API

ca_id_data_api <- read_csv("https://data.chhs.ca.gov/dataset/391d75bf-00fc-4fd7-b00d-9bd16bbe01c0/resource/741f25e1-db50-436a-a6a9-7b840176edbf/download/infectious-disease-cases-by-county-year-and-sex-2-27-19.csv")
str(ca_id_data_api)



### A brief note on "Factors" in R (advanced topic)
#### Factors are variables that generally "look like" character string variables, but are actually stored internally as integers, with the character strings being just the 'labels'
#### Factors can be very useful, but for many basic "epi/data management" purposes (except multivariate regression), they can be easier to use if they are converted into "regular" character variables (e.g. my_string_variable <- as.character(my_factor_variable))  
#### when reading in .csv data using "read.csv()", all character sting variables are read in by default as factors. To avoid this, you can use the "as.is=TRUE" argument to the read.csv function, or you can use read_csv (from the tidyverse readr() package)
#### factor() function creates factors, which can be useful in a number of situations 


ca_id_data_api_FACTOR <- read.csv("https://data.chhs.ca.gov/dataset/391d75bf-00fc-4fd7-b00d-9bd16bbe01c0/resource/741f25e1-db50-436a-a6a9-7b840176edbf/download/infectious-disease-cases-by-county-year-and-sex-2-27-19.csv")
str(ca_id_data_api)


#### factor() function creates factors

class(factor(c('Salmonellosis', 'Campylobacteriosis', 'Amebiasis'))) 


##Exploring our data
### Now that we have our data loaded as a dataframe in R, we want to explore its features and characteristics
### We can view the dataframe by manualy clicking the data object in the global environment
### We can also use a function to open the dataframe: View()

View(ca_id_data_api)

##Explore data using str()

str(ca_id_data_api)

##Explore data using print()

print(ca_id_data)

##Explore data using head()

head(ca_id_data, 10)


##Explore data using tail()

tail(ca_id_data, 10)


##Explore data using summary()

summary(ca_id_data)




##Basic data management tasks using tidyr and dplyr
### Now we will cover some basic data management tasks and transformations using Tidyr and Dplyr packages
### We do not have to call in the package because it is a part of Tidyverse
### If we wanted to call it in as a standalone package we would use library(tidyr) and library(dplyr)

library(tidyr)
library(dplyr)

##Intro to the pipe operator: %>%
### Pipes are a way to chain commands together
### They help make code easier to write and read
### Interpret a pipe as "and then..."

##Select Observations
### We may want to select particular observations
### In this case we want to create a dataframe of 2015 data for all population in California

ca_id_data_filtered <- ca_id_data %>% filter(Sex == "Total", Year == 2015, County == "California")
head(ca_id_data_filtered, 15)


##Select Variables
### We may want to select particular variables
### In this case we want to create a dataframe of 2015 counts and population only for all population in California

ca_id_data_selected <- ca_id_data_filtered %>% select(Disease, Year, Count, Population)
head(ca_id_data_selected, 15)


##Create new variables
### Let's create a new variable called incidence_rate

ca_id_data_mutated <- ca_id_data_selected %>% mutate(incidence_rate = round(((Count/Population)*100000), digits = 2))
head(ca_id_data_mutated, 15)


##Sort
### We may want to sort by one or more variables
### In this case we want to sort our data by descending rate

ca_id_data_mutated <- ca_id_data_mutated %>% arrange(-incidence_rate)
head(ca_id_data_mutated, 15)


##Do it all together! This is the strength of dplyr and the pipe
### We can filter, select, mutate and arrange efficiently by connecting each "step" with the pipe
### Multiple (sort) steps can be on one line, or the can be on separate lines to make the code easier to read (and trouble-shoot)

ca_id_data_cleaned <- ca_id_data %>%
filter(Sex == "Total", Year == 2015, County == "California" ) %>%
select(Disease,Year,Count,Population) %>%
mutate(incidence_rate = round(((Count/Population)*100000), digits = 2)) %>%
arrange(-incidence_rate)


##Practice data management and using the pipe
### Start with the ca_id_data and create a new dataset called **ca_id_data_mydata**
### Practice modifying the code from above to make a dataset for your county, for all years, for one disease



##Making static tables with Kable
### There are several packages in R to make tables.  The Knitr package (part of tidyverse) has a function kable which is good in markdown and for static tables. We will install a package called kableExtra which can be used for stylistic improvement.
### install kable using install.packages("kableExtra")

#install.packages("kableExtra")
library(kableExtra)



##Make a Simple Static Table of top 20 diseases using Kable
### Use the function kable()

cols<-c(1:3,5) #This is creating an object to define which columns from our data we want to use
kable(ca_id_data_cleaned[1:20,cols]) #This is "old school indexing" in R which is largely replaced by subsetting in tidyverse, but is still really important to know



### A Brief Sidenote on "old school indexing"" in R
### important to understand the basics of indexing
### review "Selecting Vector Elements" and "Matrix subsetting" sections of https://www.rstudio.com/wp-content/uploads/2016/10/r-cheat-sheet-3.pdf

df <- data.frame(x = 1:3, y = c('a', 'b', 'c'))
df
df[,2]
df[3,1]




##Make a Fancy  Static Table of top 20 diseases using Kable

kable(ca_id_data_cleaned[1:20,cols],
      align = c('l','c','c','c'),
      col.names = c("Disease","Year","Number of Cases","Incidence Rate"),
      caption = "Top 20 Communicable Diseases  by Incidence Rate in California, 2015") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive","bordered"), full_width = T,position = "left", font_size = 12) %>%
  footnote(general = c("Data Retrieved on 5/16/19 from https://data.chhs.ca.gov/dataset/infectious-disease-cases-by-county-year-and-sex"))



##Making interactive tables with DT
### Package DT is great for shiny apps or html reports (exclusively interactive content).  
### install DT using install.packages("DT")

#install.packages("DT")
library(DT)


##Make simple interactive Table of top 20 diseases using DT
### Use the function datatable()

datatable(ca_id_data_cleaned[1:20,cols])


##Make a fancy interactive Table of top 20 diseases using DT

datatable(ca_id_data_cleaned[1:20,cols],
          options = list(columnDefs = list(list(className = 'dt-center', targets = c(1,2,3))),pageLength = 10), 
          class = 'compact stripe nowrap hover order-column row-border', 
          rownames = FALSE,
          colnames = c('Disease' = 1,'Year' = 2,'Number of Cases' = 3,'Incidence Rate' = 4),
          caption = htmltools::tags$caption(style = 'caption-side:top; text-align:left; color:red; font-weight:bold;font-size: 130%;','Top 20 Communicable Diseases  by Incidence Rate in California, 2015'))


##Practice making tables
### Create a new dataset called **ca_id_data_cleaned_count** that is arranged by descending case counts
### Using this new dataset, create a table using either kable (static) or DT (interactive)
### Copy and paste the code above and modify some elements such as the title


##Grouping data using group_by()
### Let's go back to the original dataset
### We want to summarize data across years for all of California for all sexes by Disease
### We have to filter our data first and then group the data by disease


ca_id_data_grouped <- ca_id_data %>%
                      filter(Sex == "Total", County == "California") %>%
                      group_by(Disease) 



##Summarize
### Now we can summarize and sort our data by descending rate

ca_id_data_summarized <- ca_id_data_grouped %>%
                        summarise(avg_count = mean(Count), 
                              total_count = sum(Count), 
                              avg_population = mean(Population), 
                               avg_rate = mean(Rate)) %>%
                        arrange(-avg_rate)       

head(ca_id_data_summarized,15)




## Practice Grouping and Summarizing
### Create a new dataset called **ca_id_data_group_sum_practice** that is:
###         filtered to Males and Females
###         grouped by disease and County
###         summarized across all years with average annual counts and average annual rates
###         arranged by descending average annual rates

## Practice Answer

ca_id_data_group_sum_practice <- ca_id_data %>%
                                filter(Sex == "Total") %>%
                                group_by(County, Disease) %>%
                                summarise(avg_count = mean(Count), 
                                                avg_rate = mean(Rate)) %>%
                                arrange(-avg_rate)       

head(ca_id_data_group_sum_practice,15)


##10 MINUTE BREAK
### Next up: We will move on to more advanced applications
### Mapping
### Plots
### Census Data



##Mapping
### There's so much more to dig into and we will go fast through much of this
### There are great tutorials and workshops online that will provide much more detail on geospatial science in R including
###       coordinate reference system transformation
###       geocoding
###       working with raster data

##Packages for Mapping
### "sp" package is for classes and methods for spatial data
### "tigris" package is used to download census geographic data 
### "tmap" is a great package for making maps and that we will use today -- there are many others
### install these packages using install.packages()

#install.packages("sp")
#install.packages("tigris")

library(sp)
library(tigris)

options(tigris_class = "sf")   # options are sp (spatial polygons) or sf (simple features)
options(tigris_use_cache = F)  # set to true to save locally


##Access census geographic boundary data
### https://cran.r-project.org/web/packages/tigris/tigris.pdf
### use cb=F for more detailed geographies and cb=T for prettier simpler geography
### State, census tract, "place", and other shape files are also available with this package
counties2010 <- counties(state = '06', cb = T, year = 2010)

##Visualize the boundaires and data quickly using the R plot function 
plot(counties2010)

##Explore structure of data
### data is in a "simple features" dataframe, and has a special "variable" which has all the shape information
str(counties2010)

##Explore the data 
head(counties2010)

##Mapping our Infectious Disease data
### Let's take another look at our Infectious Disease data
head(ca_id_data)

##Preparing data for a merge
### We can see that the variable County in our ID data matches the variable NAME
### It's easiest to create a new variable in our ID data to match
### We also have to subset our data to a single disease, year, and sex group

ca_id_data_formapping <- ca_id_data %>%
                          mutate(NAME = County) %>%
                          filter(Sex == "Total",Year == "2015", Disease == "Campylobacteriosis", NAME != "California")

##Join data
### Now we will join our data onto the existing data in the counties2010 SPD data slot
counties2010_id<-left_join(counties2010, ca_id_data_formapping, by="NAME")
head(counties2010_id)

## Package tmap
### tmap stands for thematic map
### It's a powerful toolkit for creating maps with `sp` objects yet, with less code than the alternatives
### Syntax should be familiar to ggplot2 users, but simpler. Relatively easy to create & save interactive maps
### Install package using install.packages("tmap")

#install.packages("tmap")
library(tmap)


## qtm mapping with tmap
### qtm() is a quick thematic map that can be made with one function call
qtm(counties2010_id)

## qtm with fills
### can use fills
qtm(counties2010_id,
    fill = "Rate")

## Colors!
### Use the RColorBrewer package to access some great color schemes
### install package using install.packages("RColorBrewer")

#install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()# show all ColorBrewer ramps


### And can use this 'Shiny App' that is part of tmap to explore the colors
#webshot::install_phantomjs()
#install.packages("shiny")
#install.packages("shinyjs")
library(shiny)
library(shinyjs)
tmaptools::palette_explorer()


## qtm with colors
### can use fills and colors
qtm(counties2010_id, 
    fill = "Rate", 
    fill.palette = "Greens")

## Can create a static map
### adjust tmap_mode()

tmap_mode("plot") # set tmap to static view mode
qtm(counties2010_id, 
    fill = "Rate", 
    fill.palette = "Greens") # Not Interactive

## Can create an interactive map
### adjust tmap_mode()

tmap_mode("view") # set tmap to interactive view mode
qtm(counties2010_id, 
    fill = "Rate", 
    fill.palette = "Greens") # interactive


## Can make a more complex map with customized popups
### We can make more complex maps using other tmap functions.  
### We want to see polygons so here we will use tm_shape()
### Here we will also save our map to an object (map1) so we can call it later

map1 <- tm_shape(counties2010_id) + 
  tm_polygons(col = "Rate",
              id="NAME",
              palette = "Greens",
              title = "Campylobacteriosis Rate 2015",
              popup.vars = c("Disease:" = "Disease", "Year:" = "Year", "Rate Per 100,000:" = "Rate"))
map1


## Basemaps
### Here are available basemaps http://leaflet-extras.github.io/leaflet-providers/preview/
### More documentation on leaflet for R: https://cran.r-project.org/web/packages/leaflet/leaflet.pdf
### And even more: https://rstudio.github.io/leaflet/
  
## Can change basemaps
###Here we will change the baselayer

map2 <- tm_basemap(leaflet::providers$Esri.WorldStreetMap)+
  tm_shape(counties2010_id) + 
  tm_polygons(col = "Rate",
              id="NAME",
              palette = "Greens",
              title = "Campylobacteriosis Rate 2015",
              popup.vars = c("Disease:" = "Disease", "Year:" = "Year", "Rate Per 100,000:" = "Rate"))
map2



## Practice Changing Colors and Basemaps
### Recreate the Campylobacteriosis Map and name the object **map3** 
###  Change the Colors and the basemap

## Practice Answer

map3 <- tm_basemap(leaflet::providers$Stamen.Watercolor) +
  tm_shape(counties2010_id) + 
  tm_polygons(col = "Rate",
              id="NAME",
              palette = "Purples",
              title = "Campylobacteriosis Rate 2015",
              popup.vars = c("Disease:" = "Disease", "Year:" = "Year", "Rate Per 100,000:" = "Rate"))
map3


## Can save the map as static image files/pdfs
tmap_save(map1, "California_Campylobacteriosis_Map_2015.pdf", height=10) # Static image file
tmap_save(map1, "California_Campylobacteriosis_Map_2015.png", height=6) # Static image file

## Can save the map as interactive html
tmap_save(map2, "California_Campylobacteriosis_Map_2015.html") # interactive web map


## Mapping with Leaflet!!
### Leaflet offers way more customization
### install package using install.packages("leaflet")

#install.packages("leaflet")
library(leaflet)

pal <- colorNumeric("Reds", counties2010_id$Rate)
lflt_map1 <- leaflet(counties2010_id) %>%
  addProviderTiles("Esri.WorldGrayCanvas") %>% 
  addPolygons(data=counties2010_id, 
              color = "white", 
              weight = 1, 
              opacity = 0.5,
              fillColor = ~pal(Rate),
              fillOpacity = 0.75, 
              popup = paste0("<b>County: </b>", counties2010_id$County,"<br>",
                             "<b>Disease: </b>", counties2010_id$Disease,"<br>",                             
                             "<b>Year: </b>", counties2010_id$Year,"<br>",
                             "<b>Rate: </b>", counties2010_id$Rate, " per 100,000")) %>%
  addLegend(position = "topright",
            pal = pal, 
            values = ~Rate,
            opacity = 0.75, 
            title="Rate per 100,000")

lflt_map1




## Moving on to Plotting
### The plot() function in baseR can do a lot
### That said, ggplot() from the ggplot2 package (part of tidyverse) is incredibly versatile and easy to learn: https://ggplot2.tidyverse.org/
  
  
##Simple bar chart
### Lets look at a bar chart of the top 10
### We can use the same dataset we created earlier 
top_plot <- ggplot((ca_id_data_cleaned[1:5,cols] %>% arrange(-incidence_rate)), aes(x = Disease, y = incidence_rate)) +
  geom_col() +
  ggtitle("Top 5 Diseases in California by Incidence Rate, 2015")
top_plot


##Simple line plot
### Let's look at Campylobacteriosis over time in all of California
### First we have to prepare our data
ca_id_data_campylobacteriosis_forplot <- ca_id_data %>%
filter(Sex == "Total", County == "California", Disease == "Campylobacteriosis") %>%
select(County, Sex, Year, Disease, Rate)

head(ca_id_data_campylobacteriosis_forplot, 5)

##Campylobacteriosis line plot
### Now we will use ggplot to create a simple line plot with a title
### Note that instead of using a pipe (%>%) ggplot uses a plus (+) to string lines of code/arguments together

campy_plot <- ggplot(ca_id_data_campylobacteriosis_forplot, aes(x = Year,  y = Rate)) +
geom_line(aes(), size = 1) +
ggtitle("California Campylobacteriosis Incidence Rate, 2001-2015")
campy_plot


##Compare with other Diseases
### Let's compare rates of multiple foodborne diseases over time in all of California
### First we have to prepare our data

ca_id_data_foodborne_forplot <- ca_id_data %>%
  filter(Sex == "Total", County == "California", Disease %in% c("Campylobacteriosis", "Salmonellosis", "Shigellosis", "Giardiasis", "Cryptosporidiosis", "E. coli O157"))%>%
  select(County, Sex, Year, Disease, Rate)

head(ca_id_data_foodborne_forplot, 5)


##Foodborne Disease line plot
### In the last plot, the X axis only had labels for 2004, 2008 and 2012 so we will add in breaks for every year.
### We will also adjust the angle of the X axis labels
### We will also add in axis labels

foodborne_plot <- ggplot(ca_id_data_foodborne_forplot, aes(x = Year, y = Rate)) +
  geom_line(aes(color = Disease), size = 1) +
  scale_x_continuous(breaks = seq(2001, 2015, 1)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
  labs(x = "Year", y = "Incidence Rate (Per 100,000)") +
  ggtitle("California Foodborne Disease Incidence Rates, 2001-2015")
foodborne_plot

##Interactive Foodborne Disease line plot!!
### Can use the plotly package to make the plot interactive
### Install the package using install.packages("plotly")

#install.packages("plotly")
library(plotly)
ggplotly(foodborne_plot)




##Can save the plot as static image files/pdfs
### Use the ggsave() function

ggsave(file = "Cal_Foodborne_2001-2015.pdf",
       plot = foodborne_plot, # or give ggplot object name as in myPlot,
       width = 5, 
       height = 5, 
       units = "in", # other options c("in", "cm", "mm"), 
       dpi = 300)

ggsave(file = "Cal_Foodborne_2001-2015.png",
       plot = foodborne_plot, # or give ggplot object name as in myPlot,
       width = 5, 
       height = 5, 
       units = "in", # other options c("in", "cm", "mm"), 
       dpi = 300)

##We can also save the interactive plotly-wrapped plot in html
### Need to use the htmlwidgets package.  Install the package using install.package("htmlwidgets")

#install.package("htmlwidgets")
library(htmlwidgets)
plotly_foodborne_plot <- ggplotly(foodborne_plot)
htmlwidgets::saveWidget(as_widget(plotly_foodborne_plot), "Cal_Foodborne_2001-2015.html")


##Dig in to the Viz!
### We see that Campylobacteriosis has increased dramatically.  Which counties are driving that?
### To answer that question, we might want to look at Campylobacteriosis by County for 2015
### In the past we have prepared a dataset to feed into ggplot, but we can use () to do the wrangling from **within** the function!

campy_2015_plot <- ggplot(data = (ca_id_data %>%
                                    filter(Sex == "Total", Year == "2015", Disease == "Campylobacteriosis", County != "California")),
                          aes(x = reorder(County,-Rate), y = Rate))+
  geom_col(aes())+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))+
  labs(x = "County", y = "Incidence Rate (Per 100,000)")+
  ggtitle("California Campylobacteriosis Rate by County, 2015")
campy_2015_plot
ggplotly(campy_2015_plot)


## There are many great resources for plotting in R.  
### This one is especailly valuable becuase of all the great theory and practice for making charts, and examples of R code for many many type of visualization https://www.data-to-viz.com/
 

 
## Advanced Topic--Accessing Census API with TidyCensus 
### Shift to accessing Census Data
### There are a few great packages for accessing Census API data.  
### The easiest one to use is the tidycensus package
### You can install using install.packages("tidycensus")

#install.packages("tidycensus")
library(tidycensus)

# Load census key - Get a key at https://api.census.gov/data/key_signup.html and change it below!
my_census_api_key <- "put_key_here"

# Make tidycensus aware of census key.  Also, To install your API key for use in future sessions, run this function with `install = TRUE`.
census_api_key(my_census_api_key) 

## Set up the API pull
### Now we have loaded our key we need to figure out which data we want to call
### We need to specify geography and the variables we want
### In this case, we want to get data at the County level, but it's also available at other census geographies (i.e. tract, block groups, etc.): https://walkerke.github.io/tidycensus/articles/basic-usage.html

#Identify state(s) and county(s) or place(s) of interest.  YOu can find all available geographies and calls here:https://walkerke.github.io/tidycensus/articles/basic-usage.html
my_states <- c("06") # CA

#load the variables table to find what you want to look at/fetch
cenvar_table <-load_variables(year=2017, dataset = "acs5", cache=T)
B17001 <- filter(cenvar_table, str_detect(name, "B17001"))

#Take a look at the data frame to find the names of census tables. This will give you the table and variable codes. Use "View(cenvar_table)" and filter within the table to get the codes for a specific variable
View(B17001) 


#now you can identify a single variable or create a vector of variables
pop_total <- "B17001_001E" #can specify a single variable to pull
pop_poverty <- "B17001_002E" #can specify a single variable to pull



### Pull Data from Census API using get_acs()
#Fetch Data of Interest.  Note some of the specifications here.  You specify the geometry.
## Please note: `get_acs()` now defaults to a year or endyear of 2017.

#here I pull County level data for only the two vars we specified above (B17001_001E and B17001_002E) for  CA 
county_poverty_acs5_2017 <- get_acs(geography = "county", 
                                    variables = c(pop_total,pop_poverty), 
                                    year=2017, survey="acs5",
                                    state = my_states,
                                    geometry = F)


#explore dataframe, it's long
head(county_poverty_acs5_2017, 3)


## Process our ACS data to join it with our map!
### Now we want a map of the % of the population that is in poverty by county
### We need to prepare our data and create a new variable with the percentage that we want to map
####  Select the columns of interest
county_poverty_acs5_2017_wide <- county_poverty_acs5_2017 %>%
  select("GEOID","variable","estimate") %>%
  spread(key = variable, value = estimate)


####  Rename columns
colnames(county_poverty_acs5_2017_wide) <- c("county", "pop_total", "pop_poverty")

county_poverty_acs5_2017_wide <- county_poverty_acs5_2017_wide %>%
  mutate(pct_poverty = round((pop_poverty / pop_total) * 100, 1)) #create a variable with the % of the population that is under 18.


## Create a Join Variable in our Map Data
###  Since we will want to join this with our county map data, we need to identify which variable to use to join.  Unfortunately there isn't a native variable that is common to both datasets
###  We need to use the substr() function to extract out the final 5 digits from the GEO_ID variable in our County level simple features dataframe

head(counties2010)
counties2010_acs <- counties2010 %>% 
mutate(county = substr(GEO_ID,10,14))

head(counties2010_acs)

### Join ACS data with the SF mapping data
counties2010_acs_joined<-left_join(counties2010_acs, county_poverty_acs5_2017_wide, by="county")

### Map it!
map_acs<-tm_shape(counties2010_acs_joined) + 
    tm_polygons(col = "pct_poverty",
    id="NAME",
    palette = "Reds",
    title = "2013-2017 Population Poverty Rate (%)",
    popup.vars = c("Percent of Population in Poverty" = "pct_poverty", "Total Population:" = "pop_total", "Population in Poverty" = "pop_poverty"))

map_acs



##Advanced Topic--Shiny Apps
### We've also developed a simple Shiny App for you to see
###  First we need to send some of our data objects to the app

saveRDS(ca_id_data, file = "CCLHDME_R_shiny_app/data/ca_id_data.rds")

## Now we need to open the app to run it
###  1. Navigate to File and Click
###  2. Under File, Select **Open File**
###  3. When the file browser opens, Open the folder **CCLHDME_R_shiny_app*
###  4. Select **app.R**
###  4. Click Open

## Note on publishing Shinyapps: 
###  In order to publish a shinyapp, you need to have: R Studio Connect, R Shiny Server (there is a free version or a Pro/Enterprise version) or cloud-hosting service such as shinyapps.io (there's a free version and paid versions)


## Other help resources
### Great cheatsheets, tutorials, documentation/manuals, entire books and Error Support online.  Here is a sampling of things we've used:
### Cheatsheets: 
### https://www.rstudio.com/resources/cheatsheets/
### Tutorials:
### https://www.rstudio.com/online-learning/
### https://stats.idre.ucla.edu/
### https://www.coursera.org/learn/r-programming
### https://www.lynda.com/R-training-tutorials/1570-0.html
### https://www.datacamp.com/
### https://www.datacamp.com/courses/free-introduction-to-r 
### https://campus.datacamp.com/courses/introduction-to-the-tidyverse/data-wrangling-1?ex=1
### https://www.datacamp.com/courses/data-visualization-with-ggplot2-1
### Documentation/Manuals:
### https://cran.r-project.org/doc/manuals/R-intro.pdf
### https://style.tidyverse.org/
### Books: 
### https://r4ds.had.co.nz/
### https://tbrieder.org/epidata/course_reading/e_aragon.pdf
### Error Support: 
### https://stackoverflow.com/questions/tagged/r


## Notes on Workshop Development
### Special thanks to UC Berkeley D-Lab for providing inspiration for this workhop and instructive style: https://dlab.berkeley.edu/
###    Also special thanks to the R Community for developing instructive tools that we drew upon heavily while designing this workshop


## That's it for now...
###  Thank you for your participation
###  We welcome your feedback about the workshop!
###  Let us know if you have any questions!
  

