library(shiny)
library(ggplot2) 
library(reshape)

shinyServer(function(input, output ) {


  amortize = function(loan_amt = input$principal, term = input$duration*12, APR = input$interest/100) {
    # calculate simple monthly rate 
    monthly_rate = APR / 12

    r = (1 + monthly_rate) ^ term - 1
    payment = loan_amt * monthly_rate * (r + 1) / r
    
    output$paymentamount <- renderText({ 
      paste("The monthly payment will be $", format(round(payment,digits=2),nsmall=2), sep="")
    })
    

    # initialize output variables
    interest = principal = balance = vector("numeric", term)
    
    # calc amortization schedule
    outstanding_principal = loan_amt
    for (i in 1:term) {
      intr = outstanding_principal * monthly_rate
      prnp = payment - intr
      outstanding_principal = outstanding_principal - prnp
      
      interest[i]  = intr
      principal[i] = prnp
      balance[i] = outstanding_principal
    }
    
    data.frame(Month = 1:term, 
            Principal=principal,
            Interest=interest, 
            Balance = balance) 
  }
  
  
  output$amort <- DT::renderDataTable(
    DT::datatable(amortize(), options = list(searching = FALSE, pageLength = 12, ordering=FALSE), rownames= FALSE)
    %>% 
    formatCurrency(2:4, '')
  )

  
  output$lineplot <- renderPlot({
  df = amortize()[-c(4)]
  df2 <- melt(df , id.vars=(c("Month"))) 
  ggplot(df2 , aes(x=Month, y=value, group=variable, color=variable)) + 
  geom_line(size=2) +
  xlab("Months") +
  ylab("Dollar Amount") +
  labs(color='Meaures') 
  })
  
  
})