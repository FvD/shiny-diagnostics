######################################################################
# Author: H.J.F. van Dunné 
# Copyright 2014 SouthShield Productions BV
# Published on GitHub under GPLv3
######################################################################

require(shiny)
require(shinyBS)

shinyServer(function(input, output, session){
  shiny.version <- system("shiny-server --version", intern=TRUE)
  pdflatex.version <- system("pdflatex --version", intern=TRUE)
  r.version <- system("R --version", intern=TRUE)
  session.info <- sessionInfo()
  r.packages <- (.packages())
  
  observe({
    if(input$bsShowDiagnostics > 0) {
        createAlert(session, inputId = "DiagnosticsLeft",
                    message = shiny.version[1],
                    type = "warning", 
                    dismiss = TRUE, block = FALSE, append = TRUE )
        createAlert(session, inputId = "DiagnosticsLeft",
                    message = shiny.version[2],
                    type = "warning", 
                    dismiss = TRUE, block = FALSE, append = TRUE )
        createAlert(session, inputId = "DiagnosticsLeft",
                    message = pdflatex.version,
                    type = "warning", 
                    dismiss = TRUE, block = FALSE, append = TRUE )
        createAlert(session, inputId = "DiagnosticsLeft",
                    message = r.version,
                    type = "warning", 
                    dismiss = TRUE, block = FALSE, append = TRUE )
        for(package in r.packages){
          createAlert(session, inputId = "DiagnosticsRight",
                      message = package,
                      type = "danger", 
                      dismiss = TRUE, block = FALSE, append = TRUE )
        }
        
        
           }
  })
})
