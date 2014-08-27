shiny-diagnostics
=================

The purpose of this app is to be able to quickly run some diagnostics on a 
remote machine, especially when support has to be done through telephone or 
email.

Please run the following in your R session for a quick overview of your
installation:

    runGitHub("FvD/shiny-diagnostics")

If necessary, download this folder as a zip, unzip and place the shiny-server
folder where your shiny server can find it. For example:

    /srv/shiny-server/shiny-diagnostics 

This will run the diagnostics with the "run_as" user that is running
shiny-server, possibly behind a password if you are running shiny-server pro.

Note that this will only work on a linux machine. 


