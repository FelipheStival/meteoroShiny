#==============================================
# Aba "Grafico linhas"
#==============================================
tabItem.graficoLinhas = function(){
  tabItem(tabName = "grafico-linhas",
          box(width = 2,
              selectInput("GenotipoSelectDoencas","Escolha os genotipos",selected = NULL,choices = NULL,multiple = T,selectize = T)
          ),
          box(width = 10,
              plotOutput("graficolinha",width = "100%",height = "80vh")  %>% withSpinner(color="#0dc5c1")
          )
  )
}

#==============================================
# Aba "Analise estatistica"
#==============================================
tabItem.analiseEstatistica = function(){
  
  labelsName = c("tempMaxima_Maxima" ,"tempMaxima_Minima" ,"tempMaxima_Media" ,"tempMaxima_FLO_E" ,"tempMaxima_V" ,"tempMaxima_ACC_V" ,"tempMaxima_R" ,"tempMaxima_ACC_R" ,
                 "tempMinima_Maxima" ,"tempMinima_Minima" ,"tempMinima_Media" ,"tempMinima_FLO_E" ,"tempMinima_V" ,"tempMinima_ACC_V" ,"tempMinima_R" ,"tempMinima_ACC_R" ,
                 "precipitacao_ACC" ,"precipitacao_ACC_V" ,"precipitacao_ACC_R" ,
                 "radiacao_ACC" ,"radiacao_ACC_V" ,"radiacao_ACC_R" ,
                 "umidade_FLO_E", "umidade_Media", "umidade_V", "umidade_R",
                 "vento_FLO_E", "vento_Media", "vento_V", "vento_R",
                 "Acamamento" ,"Arquitetura" ,"Produtividade" ,"Antraquinose" ,"Crestamento bacteriano comum" ,"Mancha angular" ,"Mancha de curtobacterium")
  
  tabItem(tabName = "analise-estatistica",
          fluidRow(
            
            box( width = 2, status = "warning",
                 
                 # Seletor "Experimento"
                 selectInput("select_analiseEstatistica_local", "selecione o local:", c("AL_TRA"), selected = "AL_TRA")
            ),
            
            box( width = 10,height = "45vh",
                 plotOutput("grafico_analiseEstatistica_Heatmap",width = "100%",height = "40vh") %>% withSpinner(color="#0dc5c1")
            ),
            
            box( width = 6,height = "45vh",
                 plotOutput("grafico_analiseEstatistica_Resumo",width = "100%",height = "40vh") %>% withSpinner(color="#0dc5c1")
            ),
            
            box( width = 6,height = "45vh",
                 plotOutput("grafico_analiseEstatistica_Unitario",width = "100%",height = "40vh") %>% withSpinner(color="#0dc5c1")
            )    
            
          )
  )
}

#==============================================
# Aba "Dados Perdidos"
#==============================================
tabItem.dadosPerdidos = function() {
  tabItem(
    tabName = "dados-perdidos",
    plotOutput(
      "grafico_dadosPerdidos_Estatistica",
      width = "100%",
      height = "90vh"
    ) %>% withSpinner(color = "#0dc5c1")
  )
}


#==============================================
# Aba "Diagnostico"
#==============================================
tabItem.diagnostico = function() {
  tabItem(
    tabName = "diagnostico",
    box(
      width = 12,
      scatterD3Output("grafico_diagnostico_Contagem")  %>% withSpinner(color =
                                                                         "#0dc5c1")
    ),
    box(
      width = 12 ,
      dataTableOutput("tabela_diagnostico_Exibir") %>% withSpinner(color = "#0dc5c1")
    ),
    downloadButton("botao_diagnostico_Download", 'Download (csv)')
  )
}

#==============================================
# Aba "Diagnostico"
#==============================================
doencas.sidebar = function() {
  sidebarMenu(
    menuItem(
      "Gráficos",
      tabName = "dados-perdidos",
      icon = icon("line-chart"),
      menuSubItem(
        "Dados Perdidos",
        tabName = "dados-perdidos",
        icon = icon("line-chart"),
        selected = T
      ),
      menuSubItem(
        "Diagnostico",
        tabName = "diagnostico",
        icon = icon("line-chart")
      ),
      menuItem(
        "Analise Estatistica",
        tabName = "Container-analise-estatistica",
        icon = icon("line-chart"),
        menuSubItem("Heatmap", tabName = "analise-estatistica"),
        menuSubItem("Grafico Linhas", tabName = "grafico-linhas")
      )
    ),
    menuItem(
      text = "Variaveis",
      icon = icon("hand-point-up"),
      selectInput(
        inputId = "safraInputDoencas",
        label = "Selecione a safra:",
        choices = "Todos",
        multiple = T,
        selectize = T
      ),
      selectInput(
        inputId = "culturaInputDoencas",
        label = "Selecione a cultura:",
        choices = "Todos"
      ),
      selectInput(
        inputId = "estadoInputDoencas",
        label = "Selecione o estado:",
        choices = "Todos",
        multiple = T,
        selectize = T
      ),
      selectInput(
        inputId = "cidadeInputDoencas",
        label = "Selecione a cidade:",
        choices = "Todos",
        multiple = T,
        selectize = T
      ),
      selectInput(
        inputId = "irrigacaoInputDoencas",
        label = "irrigacao:",
        choices = c("Sim" = "t",
                    "Nao" = "f"),
        selected = "Sim"
      ),
      selectInput(
        inputId = "fungicidaInputDoencas",
        label = "Selecione a fungicida: ",
        choices = c("Sim" = "t",
                    "Nao" = "f"),
        selected = "Sim"
      ),
      selectInput(
        inputId = "tipodegraoInputDoencas",
        label = "Selecione o tipo de grao: ",
        choices = "Todos",
        multiple = T,
        selectize = T
      ),
      selectInput(
        inputId = "epocaInputDoencas",
        label = "Selecione a epoca: ",
        choices = "Todos",
        multiple = T,
        selectize = T
      )
    )
  )
}


# Pagina doencas
doencasUI = div(id = "clima-container",
                dashboardPage(
                  #========================header=========================
                  
                  dashboardHeader(title =  "Experimentos",
                                  tags$li(
                                    class = "dropdown",
                                    actionLink(
                                      inputId = "btnRetonarExperimentos",
                                      label = "Voltar",
                                      icon = icon("sign-out"),
                                      style = "font-size: 1.5em;"
                                    )
                                  )),
                  
                  #=======================================================
                  
                  #=======================SiderBar========================
                  
                  dashboardSidebar(width = 260,
                                   sidebarMenu(doencas.sidebar())),
                  #========================================================
                  
                  #=======================body=============================
                  dashboardBody(tabItems(
                    tabItem.diagnostico(),
                    tabItem.dadosPerdidos(),
                    tabItem.analiseEstatistica(),
                    tabItem.graficoLinhas()
                  ))
                  #========================================================
                ))