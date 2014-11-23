#Stock Analysis

library(shiny)
library("stockPortfolio")

#Calculation of individual stock returns 
return<-function(x) {
 get_returns_output=getReturns(x,freq="month",start='2013-1-1')
 returns_summary=summary(get_returns_output)
}

#Calculation of a stock model
model<-function(x) {
  stockModel(x)
}

#Calculation of the optimal portfolio
optimalPortfolio<-function(x) {
  opMgm<-optimalPort(x)
  allocation=opMgm[2]$X
  paste(round(100*allocation, 2), "%", sep="")
}

shinyServer(
  function(input,output){
    
    #Calculating returns of the individual stocks since 2013-1-1 
    output$tickers<-renderPrint(c(input$ticker1,input$ticker2,input$ticker3,input$ticker4,input$ticker5))
    output$returns<-renderPrint(return(c(input$ticker1,input$ticker2,input$ticker3,input$ticker4,input$ticker5)))
    
    #Calculating the optimal portfolio
    output$optimalPortfolio<-renderPrint(optimalPortfolio(model(c(input$ticker1,input$ticker2,input$ticker3,input$ticker4,input$ticker5))))
    
  }
  )

