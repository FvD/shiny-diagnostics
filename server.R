######################################################################
# Copyright (c) 2014 SouthShield Productions BV
# Published on GitHub under GPLv3
######################################################################

require(shiny)
require(shinyBS)

shinyServer(function(input, output, session){
  # Get diagnostic information  
  user <- try(system("whoami", intern=TRUE))          
  shiny.version <- try(system("shiny-server --version", intern=TRUE))
  pdflatex.version <- try(system("pdflatex --version", intern=TRUE))
  r.version <- try(system("R --version", intern=TRUE))
  session.info <- sessionInfo()
  r.packages <- (.packages())
  
  # Show diagnostic information
  createAlert(session, inputId = "DiagnosticsLeft",
              message = shiny.version[1],
              type = "info", 
              dismiss = TRUE, block = FALSE, append = TRUE )
  createAlert(session, inputId = "DiagnosticsLeft",
              message = shiny.version[2],
              type = "info", 
              dismiss = TRUE, block = FALSE, append = TRUE )
  createAlert(session, inputId = "DiagnosticsLeft",
              message = pdflatex.version[[1]],
              type = "info", 
              dismiss = TRUE, block = FALSE, append = TRUE )
  createAlert(session, inputId = "DiagnosticsLeft",
              message = r.version[[1]],
              type = "info", 
              dismiss = TRUE, block = FALSE, append = TRUE )
  # Loop package names
  for(package in r.packages){
    createAlert(session, inputId = "DiagnosticsRight",
                message = package,
                type = "danger", 
                dismiss = TRUE, block = FALSE, append = TRUE )
                }

  output$username <- renderPrint({
  cat("This app is run as user: <b> ", user, "</b>")
  })

  output$session.info1 <- renderTable({
    table <- as.data.frame(unlist(session.info[[1]]))
    colnames(table) <- c("Current Version")
    return(table)
  })
  output$session.info2 <- renderPrint({
   cat(session.info[[2]])
  })
  output$session.info3 <- renderPrint({
    cat(session.info[[3]])
  })
  output$session.info4 <- renderTable({
   table <- as.data.frame(unlist(session.info[[4]]))
    colnames(table) <- c("Installed")
   return(table)
  })
  output$session.info5 <- renderTable({
   table <- as.data.frame(unlist(session.info[[5]]))
    colnames(table) <- c("Shiny")
    return(table)
  })
  output$session.info6 <- renderTable({
   #gsub("\n", "<br/>", unlist(session.info[[6]]))
   table <- as.data.frame(unlist(session.info[[6]]))
    colnames(table) <- c("Package info")
    return(table)
  })

})
