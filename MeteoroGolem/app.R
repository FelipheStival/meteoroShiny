#========================================================================
# Arquivo que faz o start
#========================================================================


source("init//boot.R") # Arquivo boot

# Carregando pacotes a serem utilizados
boot.loadPackages()

source("server.R")  # Server principal
source("globals.R") # Variaveis globais

# Carregando labels da tela de login
boot.loadLabels()

# Carregando modulos da aplicacao
boot.LoadModules()

# Configuracao de rotas do aplicacao
router = make_router(
  route("/", bemVindoUI()),
  route("clima", climaUI()),
  route("experimentos",doencasUI),
  route("gerenciar", gerenciarUI)
  
)

# Pagina principal com o roteamente
ui <- secure_app(fluidPage(router$ui))

shinyApp(ui, server)
