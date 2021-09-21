#==============================================
# Aba "Dados Perdidos"
#==============================================
tabItem.dadosPerdidos = function() {
  
  tabItem(tabName = "dados-perdidos", 
          plotOutput("grafico_dadosPerdidos_Estatistica",width = "100%", height = "90vh") %>% withSpinner(color="#0dc5c1")
  )
}


#==============================================
# Aba "Diagnostico"
#==============================================
tabItem.diagnostico = function() {
  
  tabItem(tabName = "diagnostico",
          box(width = 12,scatterD3Output("grafico_diagnostico_Contagem")  %>% withSpinner(color="#0dc5c1")),
          box(width = 12 ,dataTableOutput("tabela_diagnostico_Exibir") %>% withSpinner(color="#0dc5c1")),
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
      menuSubItem("Dados Perdidos", tabName = "dados-perdidos", icon = icon("line-chart"), selected = T),
      menuSubItem("Diagnostico", tabName = "diagnostico", icon = icon("line-chart"))
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
        choices = c(
          "Sim" = "t",
          "Nao" = "f"
        ),
        selected = "Sim"
      ),
      selectInput(
        inputId = "fungicidaInputDoencas",
        label = "Selecione a fungicida: ",
        choices = c(
          "Sim" = "t",
          "Nao" = "f"
        ),
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
                  
                  dashboardHeader(title =  "Experimentos"),
                  
                  #=======================================================
                  
                  #=======================SiderBar========================
                  
                  dashboardSidebar(width = 260,
                                   sidebarMenu(doencas.sidebar())),
                  #========================================================
                  
                  #=======================body=============================
                  dashboardBody(
                    tabItems(
                      tabItem.diagnostico(),
                      tabItem.dadosPerdidos()
                    )
                  )
                  #========================================================
                ))
