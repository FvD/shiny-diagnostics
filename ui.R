######################################################################
# Author: H.J.F. van Dunné 
# Copyright 2014 SouthShield Productions BV
# Published on GitHub under GPLv3
######################################################################

require(shiny)
require(shinyBS)

shinyUI(
  fluidPage(
    fluidRow(
           column(12,
                  h3("Shiny Diagnostics"),
                  helpText("The idea behind this page is that you can either set 
                           up this app as-is or
                           copy paste this fluidPage in your own app. Make sure that
                           you either have only trusted users or that you place this
                           behind a password in shiny-server-pro.")
                  ),
             column(12,
                    tags$div(class="center", style="padding-top: 5px;", 
                             bsActionButton("bsShowDiagnostics", 
                                            label = "Show Diagnostics", 
                                            style = "primary"))
             )
),
      fluidRow(       
             column(6,  
                   h4("Server Components"),
                    bsAlert(inputId = "DiagnosticsLeft")
                    ),
             column(6,
                   h4("R Packages"),
                   bsAlert(inputId = "DiagnosticsRight")
             )
             )
    )
  )
