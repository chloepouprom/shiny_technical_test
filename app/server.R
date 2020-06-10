library(shiny)
library(here)
library(dplyr)

source(here("ggplot.R"))

shinyServer(function(input, output) {

    options(stringsAsFactors = FALSE)
    
    # Import data
    ad_clicks <- read.csv(here("ad_clicks.csv")) %>%
        mutate(day = as.Date(day)) 
    
    print(input)
    # Create plot output object
    output$plot <- renderPlot({
        plot_clicks(ad_clicks, plot_type = input$plot_type, date_range = input$date_range)
    })

})
