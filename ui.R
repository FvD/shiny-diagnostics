######################################################################
# Copyright (c) 2014 SouthShield Productions BV
# Published on GitHub under GPLv3
######################################################################

require(shiny)
require(shinyBS)

shinyUI(
  navbarPage("R Diagnostics",
  tabPanel("Summary",
    fluidRow(
     column(12,
        h4("Current user"),
        htmlOutput("username")
      )
    ),
    fluidRow(       
     column(6, 
        h4("Server Components"),
            bsAlert(inputId = "DiagnosticsLeft")
            ),
     column(6,
        h4("Loaded R Packages"),
        bsAlert(inputId = "DiagnosticsRight")
        )
    )),
  tabPanel("Full Report",
    fluidRow(
      column(12,
        helpText("It may be useful to copy paste this entire page in an
                 email message to send to support"),
        h4("R Version"),
        htmlOutput("session.info1"),
        h4("System OS"),
        htmlOutput("session.info2"),
        h4("Locale Settings"),
        htmlOutput("session.info3"),
        h4("Base Packages"),
        htmlOutput("session.info4"),
        h4("Shiny Packages"),
        htmlOutput("session.info5"),
        h4("Other Packages"),
        htmlOutput("session.info6")
        )
   ))
#),
#  tabPanel("About",
#    fluidRow(
#     column(12,
#        helpText("Written by FvD/southshield Productions")
#      )
#    )
  )
)
