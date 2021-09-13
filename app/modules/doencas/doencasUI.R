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
      icon = icon("line-chart"),
      menuSubItem(
        "Diagnostico",
        tabName = "diagnostico",
        icon = icon("line-chart")
      )
    ),
    menuItem(
      text = "Variaveis",
      icon = icon("hand-point-up"),
      selectInput(
        inputId = "safraInputDoencas",
        label = "Selecione a safra:",
        choices = "13/14"
      ),
      selectInput(
        inputId = "estadoInputDoencas",
        label = "Selecione o estado:",
        choices = "SC"
      ),
      selectInput(
        inputId = "cidadeInputDoencas",
        label = "Selecione a cidade:",
        choices = "SC"
      ),
      selectInput(
        inputId = "irrigacaoInputDoencas",
        label = "irrigacao:",
        choices = c(
          "Nao" = "f",
          "Sim" = "t"
        )
      ),
      selectInput(
        inputId = "fungicidaInputDoencas",
        label = "Selecione a fungicida: ",
        choices = c(
          "Nao" = "f",
          "Sim" = "t"
        )
      ),
      selectInput(
        inputId = "tipodegraoInputDoencas",
        label = "Selecione o tipo de grao: ",
        choices = NULL
      )
    )
  )
}


# Pagina doencas
doencasUI = div(id = "clima-container",
                dashboardPage(
                  #========================header=========================
                  
                  dashboardHeader(title =  "Doencas"),
                  
                  #=======================================================
                  
                  #=======================SiderBar========================
                  
                  dashboardSidebar(width = 260,
                                   sidebarMenu(doencas.sidebar())),
                  #========================================================
                  
                  #=======================body=============================
                  dashboardBody(
                    tabItem.diagnostico()
                  )
                  #========================================================
                ))
