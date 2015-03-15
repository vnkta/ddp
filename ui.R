require(rCharts)

shinyUI(
    

    
    tabsetPanel(
        
        tabPanel("Documentation",
                 fluidPage(
                     fluidRow(
                         column(8, offset =3,
                                br(),
                                h2("How to Choose Your Snowboard Size"),
                                br(),
                                p("Head to a rental shop and the standard advice you'll be 
                                 given about choosing the right length snowboard is to 
                                'pick something that's somewhere between your nose and your chin'"),
                                
                                p("While this might work, it’s pretty much the broadest possible 
                                  guideline you could ever be given. It’s a bit like if you were to 
                                  choose trousers by holding them up somewhere between your balls  
                                  and your belly-button and seeing if they hit the floor."),
                                
                                p("Basically, finding the'right' length board for you depends on two 
                                  factors – your height and your weight. However it’s also 
                                  worth considering what snow conditions you’re most likely to encounter, 
                                  and your terrain  and style preferences."),
                                br(),
                                p ("Head to the ",code("Size Calculator"), "tab on this web application to get a 
                                   recommended size of the snowboard given your weight and height."),
                                br(),
                        
                                p ("Please, note that the output can only be used as a starting point for your 
                                   quest for the right size. Further details could and should be considered 
                                   before buying a board."),
                                
                                h5("More information you can find", a("here", href="http://whitelines.com/snowboard-gear/buying-guides/how-to-choose-your-snowboard-size.html#IfqllOyV0OGAvbYE.99")),
                                
                                p("An additonal tab", code("Stats"),'shows some basic statistics about the snowboard industry.')
                                
                     ))
                     )
                 ),
      
        # Tab 1 ----           
     tabPanel( strong(div("Size Calculator", style = "color:red")), 
        fluidPage(    
            fluidRow(
                column(4,
                       br(),br(),
                       selectInput("inHeight", label = "Choose your height in cm",
                                     choices = list("< 152",
                                                    "155 - 168",
                                                    "170 - 183",
                                                    "185 - 196",
                                                    "> 198"),
                                     selected = "170 - 183"), 

                    selectInput("inWeight", label = "Choose your weight in lb",
                                     choices = list("< 49",
                                                    "50 - 59",
                                                    "60 - 69",
                                                    "70 - 79",
                                                    "80 - 89",
                                                    "90 - 95",
                                                    "96 +"),
                                     selected = "80 - 89")),
          
                column(4,  br(), br(), img(src = "main.jpg", height = 450, width = 317)),
                column(4,  br(), br(), br(), br(), br(), br(), br(), br(),  br(), br(), br(),
                       h3(div(textOutput("ouSize1"), style = "color:red")))
            )           
             
        )    
             ) ,
    
    
   # Tab 2 ---- 
    tabPanel(
        # Tab Title
        "Stats", 
        # Content
        fluidPage(
            # Content on the left
            fluidRow(
                column(4, sliderInput("Slider01", label = h6("Select Season"), 
                            min = 2010, max = 2014, sep="", value = c(2012,2013))),

                column(4, radioButtons("Radio01","Choose type of statistics",
                                      c("Snow Sports Participants By Type" = "sp", 
                                        "USA Snow Sport Visits By Region (In Millions)" = "ssv"), 
                                      selected = "sp")),
                column(4, radioButtons("Radio02", label="Chart Type", c("line", "column", "bar"), selected = "column", inline=TRUE))
                ),
            
            br(), hr(),
            # Content on the right
            fluidRow(column(8,offset=2, showOutput("Chart01", "highcharts")))
        )
        
    )
   
           
    
  )
)
