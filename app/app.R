
#==============================================#
# Carregando pacotes a serem utilizados
app.LoadPackages = function()
{
    #=============================================#
    # Iniciando bibliotecas web
    
    require(shiny) 
    require(shinydashboard)
    require(shiny.router)
    require(leaflet)
    require(shinycssloaders)
    require(RJDBC)
    require(seas)
    require(ggplot2)
    require(reshape2)
    require(dplyr)
    require(lubridate)
    require(stringr)
    require(ggrepel)
    require(ggthemes)
    require(scatterD3)
    require(lme4)
    require(shinyWidgets)
    require(forcats)
    require(plyr)
    require(emmeans)
    require(gge)
    require(GGEBiplots)
    require(ape)
    
    #==============================================#
}


#==============================================#
# Carregando arquivos compilados
app.LoadModules = function() {
    modulos = list.files(pattern = ".R$",
                         recursive = T,
                         full.names = T)
    index = which(modulos %in% "./app.R")
    modulos = modulos[-index]
    log = sapply(modulos,source,encoding="utf-8")
}
#==============================================#

app.LoadPackages()
app.LoadModules()

shinyApp(ui, server)
