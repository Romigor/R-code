
ui <- fluidPage(

  
  titlePanel("Кальулятор промо"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Входные параметры для расчёта"),
      
      selectInput("model", 
                  label = "Выбор мат. модели",
                  choices = ListModel),
      
      selectInput("gear", 
                  label = "Выбор типа трансмиссии",
                  choices = c("Auto", 
                              "Manual"),
                  selected = "Auto"),
      
      sliderInput("range", 
                  label = "Кол-во цилиндров двигателя:",
                  min = 2, max = 12, value = 4)
      ),
    
    mainPanel(
      h3(textOutput("selected_var" ))
    )
  )
  )


server <- function(input, output) {

  dataInput <- reactive({ readRDS(file = input$model) })  

  output$selected_var <- renderText({ 
    
    prd <- predict( dataInput() , type = 'response',data.frame(hp = 150, cyl = input$range, am = ifelse( input$gear == 'Auto', 1,0)  ))
    paste("Оценка миль на галлон:", prd)
    
  })

  
}

shinyApp(ui, server)
