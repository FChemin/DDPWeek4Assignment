#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
df <- read.csv("apt_full_dataset.csv", stringsAsFactors = FALSE)
df <- df[,-2]
m <- lm(Monthly.Rent~Area+Number.of.Rooms, df)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    Area <- reactive({Area <- input$areaInput})
    
    Number.of.Rooms <- reactive({Number.of.Rooms <- input$roomsInput})
    
    output$Inputvals <- renderTable({data.frame(Area = Area(), Number.of.Rooms = Number.of.Rooms())
    })
    
    output$Results <- renderTable({newdata <- data.frame(Area = Area(), Number.of.Rooms = Number.of.Rooms())
        
    prediction <- predict(m, newdata, interval = "confidence")
    
    data.frame(round(prediction, 0))})
    
})
