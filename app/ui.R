library(shiny)

shinyUI(fluidPage(

    # Application title
    titlePanel("Ad Clicks Visualizer"),

    sidebarLayout(
        sidebarPanel(
            radioButtons(
                inputId = "plot_type",
                label = "Plot Type",
                choices = c("line", "scatter", "both"),
                selected = c("both"),
                inline = TRUE
            ),
            dateRangeInput(
                inputId = "date_range",
                label = "Date Range"
            )
        ),

        mainPanel(
            plotOutput("plot")
        )
    )
))
