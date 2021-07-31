
#==============================================#
# Carregando pacotes a serem utilizados
app.LoadPackages = function()
{
    #=============================================#
    # Iniciando bibliotecas web
    
    require(shiny) 
    require(shinydashboard)
    require(shiny.router)
    
    #==============================================#
    
    
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
