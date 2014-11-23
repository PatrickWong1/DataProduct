#Stock Analysis
shinyUI(pageWithSidebar(
  headerPanel("Enter 5 stock ticker symbols and get the optimal portfolio allocation!"),
  
  sidebarPanel(
    h4('Enter 5 stock ticker symbols and click "Submit"'),
    h4(' '),
    h4(' '),
    textInput('ticker1', 'Ticker Symbol 1', value="BA"),
    textInput('ticker2', 'Ticker Symbol 2', value="IBM"),
    textInput('ticker3', 'Ticker Symbol 3', value="JNJ"),
    textInput('ticker4', 'Ticker Symbol 4', value="PG"),
    textInput('ticker5', 'Ticker Symbol 5', value="XOM"),
    submitButton("Submit")
    ),
  mainPanel(
    h4('Mean monthly returns for these comapnies'),
    verbatimTextOutput("tickers"),
    h4("are"),
    verbatimTextOutput("returns"),
    h4('The optimal portfolio allocation is'),
    verbatimTextOutput("optimalPortfolio")
    )
  ))

