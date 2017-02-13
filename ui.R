#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(titlePanel("Rent Calculator"), br(), "Find", em("how much"), 
                  "you could rent a place", "in", strong("Brest, France"),"!", br(), br(),
                  sidebarLayout(sidebarPanel(img(src = "http://florianchemin.com/wp-content/uploads/2017/02/buildings-498198_640.jpg"), 
                                             sliderInput("areaInput", "Area of the place to rent", min = 0, 
                                                         max = 200, value = 100, post = "m²"), 
                                             numericInput("roomsInput", "Number of rooms at the place", 
                                                          value = 4, min = 1, max = 8, step = 1)), 
                                mainPanel(tableOutput("Inputvals"),tableOutput("Results")))))
