
library(shiny)

shinyUI(pageWithSidebar(

  headerPanel("Place Title Here"),
  
  sidebarPanel(
    h3('Selection Criteria'),
    
    fluidRow(
    column(4, # female = 1, male = 0
           checkboxGroupInput("female", label = h3("Gender"),
                        choices = list("Female" = 1,
                                       "Male" = 0),selected = 1)),
    
    column(1, # 1=hispanic, 2=asian, 3=black, 4=white
           radioButtons("race", label = h3("Race"), 
                        choices = list("Hispanic" = 1, 
                                       "Asian" = 2, 
                                       "Black" = 3,
                                       "White" = 4),selected = 1))
    ),
    
    fluidRow(
      
      column(4, # 1=public 2=private
             radioButtons("schtyp", label = h3("School Type"),
                          choices = list("Public" = 1,
                                         "Private" = 2),selected = 1)),
      column(1, # 1=low 2=medium 3=high
             radioButtons("ses", label = h3("Economic Status"),
                          choices = list("Low" = 1,
                                         "Medium" = 2,
                                         "High" = 3),selected = 1))     
    ),
    
    fluidRow(
      
      column(1, # 1=general 2=academic prepartory 3=vocational/technical
             radioButtons("prog", label = h3("Program Type"),
                          choices = list("General" = 1,
                                         "Academic" = 2,
                                         "Vocational" = 3),selected = 1))
      
    ),
    
    fluidRow(
      
      column(3,
             h3(""),
             #actionButton("action", label = "Action"),
             br(),
             br(), 
             submitButton("Submit"))    
    )
    
  ),
  
  mainPanel(
    #plotOutput('newHist')
    plotOutput(outputId="newHist", width="100%")
  )
))