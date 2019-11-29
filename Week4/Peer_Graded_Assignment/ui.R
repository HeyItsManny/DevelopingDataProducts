## Setup
library(shiny)


## Specify layout
shinyUI(pageWithSidebar(
    
    headerPanel(h1("Amoritization Calculator", align = "center")),
    
    sidebarPanel(
        
        ## Enter mortgage information
        h4("Mortgage Parameters"),
        
        ## Loan amount
        numericInput("principal", "Loan Amount",  value=420000, min=10000, max=1000000, step=10000),
        helpText("The amount borrowed. Enter a value between $10,000 and $1,000,000"),
        
        ## Interest Rate
        numericInput("interest", "Annual interest rate", value=3.875, min=1, max=20, step=.005),
        helpText("The yearly interest rate. Min 1%, max 20%."),
        
        ## Loan Term
        numericInput("duration", "Length of the loan.", value=30, min=1, max=40, step=.5),
        helpText("Loan term in years. 1 year to 40 years."),
        
    ),
    
    mainPanel(
        h3(textOutput("paymentamount")),
        tags$head(tags$style(HTML("table.dataTable.hover tbody tr:hover, table.dataTable.display tbody tr:hover {
                                background-color: LightGreen  !important;
                                } "))),
       DT::dataTableOutput("amort"),
       plotOutput("lineplot")

    )
    
))