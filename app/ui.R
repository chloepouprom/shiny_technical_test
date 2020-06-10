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
                label = "Date Range",
                start = "2019-05-01",
                end = "2020-06-10"
            )
        ),

        mainPanel(
            plotOutput("plot")
        )
    )
))
