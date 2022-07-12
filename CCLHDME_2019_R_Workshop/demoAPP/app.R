##############################################################################################################
##############################################################################################################
#####################################        CCLHDME R WORKSHOP           ####################################
#####################################         Sample Shiny App            ####################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
library(shiny)
library(leaflet)
library(sp)
# library(tigris)
library(ggplot2)
library(plotly)
library(DT)
library(dplyr)
library(tidyr)


# https://phdataviz.shinyapps.io/demoAPP/




#options(tigris_class = "sp")   # options are sp or sf
# options(tigris_use_cache = F)  # set to true to save locally
# counties2010 <- counties(state = '06', cb = T, year = 2010)
# saveRDS(counties2010,"data/counties2010.RDS")

counties2010 <- readRDS("data/counties2010.RDS")


#ca_id_data <- readRDS("data/ca_id_data.rds")
ca_id_data <- read.csv("data/infectious-disease-cases-by-county-year-and-sex-2-27-19.csv",as.is=TRUE)



ui <- fluidPage(
  
  
  titlePanel("CCLHDME R APP"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("disease",
                "Disease:",
                c(sort(unique(ca_id_data$Disease))),
                selected = "Amebiasis"),
      selectInput("sex",
                  "Sex:",
                  c(sort(unique(ca_id_data$Sex))),
                  selected = "Total"),
      selectInput("year",
                  "Year:",
                  c(sort(unique(ca_id_data$Year))),
                  selected = "2015"),
      width = 2
      ),
  
  
  mainPanel(
    tabsetPanel(type="tabs",
                tabPanel("Table",DT::dataTableOutput("table")),
                tabPanel("Plot",plotlyOutput("plot",width = "100%", height = 800)),
                tabPanel("Map",leafletOutput("map", width = "100%", height = 800))
                )
            )
  )
)

server <- function(input, output) {
  ca_id_data_use <- reactive(ca_id_data %>% 
                               subset(Disease == input$disease & Sex == input$sex & Year == input$year & County!="California") %>% 
                               arrange(-Rate))
  ca_id_data_formap <- reactive(ca_id_data %>% 
                               subset(Disease == input$disease & Sex == input$sex & Year == input$year & County!="California") %>% 
                               mutate(NAME = County))
  counties2010_id <- reactive(merge(counties2010, ca_id_data_formap(), by="NAME"))


  output$table <-DT::renderDataTable(ca_id_data_use(),
                                            options = list(lengthMenu = list(c(10, 20, -1), c('10', '20', '30', 'All')),
                                                           pageLength = 20,
                                                           AutoWidth = TRUE,
                                                           columnDefs = list(list(className='dt-center')),
                                            class = 'compact stripe nowrap hover order-column row-border',
                                            rownames = FALSE
                                            ))
  output$plot <- renderPlotly({
    print(ggplotly(ggplot(ca_id_data_use(),aes(x = reorder(County,-Rate), y = Rate))+
            geom_col(aes())+
            theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))+
            labs(x = "County", y = "Incidence Rate (Per 100,000)")+
            ggtitle("California Communicable Disease Incidence Rate by County")))
  })
    
  output$map <-renderLeaflet({
    pal <- colorNumeric("Purples", counties2010_id()$Rate)
    lflt_map1 <- leaflet(counties2010_id()) %>%
      addProviderTiles("Esri.WorldGrayCanvas") %>% 
      addPolygons(data=counties2010_id(), 
                  color = "white", 
                  weight = 1, 
                  opacity = 0.5,
                  fillColor = ~pal(counties2010_id()$Rate),
                  fillOpacity = 0.75, 
                  popup = paste0("<b>County: </b>", counties2010_id()$NAME,"<br>",
                                 "<b>Disease: </b>", counties2010_id()$Disease,"<br>",                             
                                 "<b>Year: </b>", counties2010_id()$Year,"<br>",
                                 "<b>Sex: </b>", counties2010_id()$Sex,"<br>",
                                 "<b>Rate: </b>", counties2010_id()$Rate, " per 100,000","<br>",
                                 "<b>Unstable: </b>", counties2010_id()$Unstable)) %>%
      leaflet::addLegend(position = "topright",
                         pal = pal, 
                         values = ~Rate,
                         opacity = 0.75, 
                         title="Rate per 100,000")
    print(lflt_map1)
    
  })
  
  
}

shinyApp(ui = ui, server = server)




