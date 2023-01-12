#==================================================================
# Página gerencia clima
#==================================================================

#==================================================================
# Interface carregar arquivo
#==================================================================
carregarDoencasUI = function(){
  fluidRow(
    
    box(width = 3,
        title = 'Escolha um arquivo CSV',
        solidHeader = TRUE,
        status = "primary",
        #===================Escolher arquivo=======================
        
        fileInput(inputId = 'arquivoDoencas',
                  label = 'Escolha um arquivo CSV',
                  accept = c(
                    "text/csv",
                    "text/comma-separated-values,text/plain",
                    ".csv")),
        
        #===========================================================
        
        tags$hr(),
        
        #===================Header arquivo==========================
        
        checkboxInput(inputId = 'cabecalhoDoencas',
                      label = 'Cabecalho',
                      value = TRUE),
        
        #===========================================================
        
        #===================Separador arquivo=======================
        
        radioButtons(inputId = 'separadorDoencas',
                     label = 'Separador',
                     choices = c("," = ",",
                                 ";" = ";",
                                 "t" = "\t"),
                     selected = ","),
        
        #===================Realizar Upload=======================
        
        actionButton(inputId = 'btnatualizarDadosDoencas',
                     label = 'Atualizar dados')
    ),
    
    #===========================================================
    
    
    
    #==================Saida tabela==============================
    
    box(width = 9,
        title = 'Tabela',
        solidHeader = TRUE,
        align="center",
        status = "primary",
        uiOutput("UItabelaGerenciarDoencas") %>% withSpinner(color="#0dc5c1")
    )
  )
}


#==================================================================
# Gerenciar UI
#==================================================================
gerenciarDoencasUI = function(){
  div(id = "clima-container",
      dashboardPage(
        #========================header=========================
        
        dashboardHeader(title =  "Atualizar dados módulo clima",
                        tags$li(
                          class = "dropdown",
                          actionLink(
                            inputId = "btnRetonarGerenciarDoencas",
                            label = "Voltar",
                            icon = icon("sign-out"),
                            style = "font-size: 1.5em;"
                          )
                        )),
        
        #=======================================================
        
        #=======================SiderBar========================
        
        dashboardSidebar(width = 260,
                         sidebarMenu(
                           menuItem(
                             text = "Atualizar dados",
                             tabName = "atualizarDadosDoencas",
                             icon = icon("upload"),
                             selected = T
                           )
                         )),
        #========================================================
        
        #=======================body=============================
        dashboardBody(tabItems(
          tabItem(tabName = "atualizarDadosDoencas",
              carregarDoencasUI()
          )
        )
      )
    )
  )
}