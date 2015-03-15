library(ggplot2)
library(lubridate)
library(data.table)
library(rCharts)
library(reshape2)

DT <-fread("data/data.csv") 
DT2 <-fread("data/data2.csv") 


shinyServer(function(input, output, session) {
    

    output$ouSize1 <- renderText({ 
        tmp <- DT[height==input$inHeight & weight==input$inWeight,  ]
          
        paste0("You have to choose a board with a length between ", tmp$low.range, " and ",tmp$high.range, " cm.")
        })
    

    
    
    output$Chart01 <- renderChart({
        
        data <-  DT2[Var == input$Radio01 & between(Season,input$Slider01[1], input$Slider01[2])]
         data [,Season := as.character(Season)]      
                
        p1 <-hPlot(x = "Season", y = "Value", data = data, type = input$Radio02, group = "Type")
        
        p1$xAxis(title = list(text = "Season"),categories = unique(data$Season))
        p1$yAxis(title = list(text = ""))
        p1$addParams(dom = 'Chart01')
        return(p1)
    })
    
        
})




