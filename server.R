#devtools::install_github('shinyapps', 'rstudio')

#shinyapps::setAccountInfo(name='dkmckinney', 
#                          token='2382F5619BCE87C06A0A9399506425EA', 
#                          secret='/UhSqO+rTI49BZ2JiH+XkGEbmEW7I4KuZUV4L9aG')

library(shiny)
library(sqldf)

# Define server logic required to ...
shinyServer(function(input, output) {
  
  output$newHist <- renderPlot({
    data <- read.csv("hsb2.csv")
    sql <- paste("select read, write, math, science, socst from data",
                 "where female = ", input$female,
                 "and race = ", input$race,
                 "and ses = ", input$ses,
                 "and schtyp = ", input$schtyp,
                 "and prog = ", input$prog,
                 sep=" ")

    ret <- sqldf(sql)
    
    par(mfrow = c(3, 2))
    color <- "lightblue"; color2 <- "red"
    hist(ret$read,col=color,main="Reading Score",xlab="Score (standardized)")
    abline(v=median(ret$read),col=color2)
    hist(ret$write,col=color,main="Writing Score",xlab="Score (standardized)")
    abline(v=median(ret$write),col=color2)
    hist(ret$math,col=color,main="Math Score",xlab="Score (standardized)")
    abline(v=median(ret$math),col=color2)
    hist(ret$science,col=color,main="Science Score",xlab="Score (standardized)")
    abline(v=median(ret$science),col=color2)
    hist(ret$socst,col=color,main="Social Studies Score",xlab="Score (standardized)")
    abline(v=median(ret$socst),col=color2)
    par(mfrow = c(1, 1))

 }, height=800)    
})