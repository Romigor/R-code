library(shiny)

ListModel <-  dir('cars', pattern = '.rds' )
runApp('cars', port = 6666,  launch.browser = F, host = "0.0.0.0")
