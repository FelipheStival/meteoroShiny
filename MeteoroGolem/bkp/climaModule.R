#' Module UI clima
#' @param id id do modulo
#' 
climaUI <- function(){
  div(
    id = 'clima-container',
    dashboardPage(
       # Header aplicacao
      dashboardHeader(
        title =  "Clima",
        tags$li(class = "dropdown",actionLink(inputId = "btnRetonarClima",label = "Voltar",icon = icon("sign-out"),style = "font-size: 1.5em;" ))
        ),
      
      # Sidebar page
      dashboardSidebar(
        width = 260,
        sidebarMenu(
          menuItem(
            text = "Mapa",
            tabName = "mapaTab",
            icon = icon("map"),
            selected = T
          ),
          menuItem(
            text = "Tabela",
            tabName = "tabelaTab",
            icon = icon("table")
          ),
          menuItem(
            text = "Gráficos",
            tabName = "analiseUI",
            icon = icon("line-chart"),
            menuSubItem(
              text = "Gráfico básico",
              tabName = "graficosPerdidosPlot",
              icon = icon("bar-chart")
            ),
            menuSubItem(
              text = "Mapa matriz",
              tabName = "mapaMatrizplot",
              icon = icon("bar-chart")
            ),
            menuSubItem(
              text = "Precipitação",
              tabName = "Precipitacaoplot",
              icon = icon("bar-chart")
            ),
            menuSubItem(
              text = "Anomalia Precipitação",
              tabName = "AnomaliaPrecipitacaoplot",
              icon = icon("bar-chart")
            ),
            menuSubItem(
              text = "Anomalia Temperatura Precipitação",
              tabName = "AnomaliaTemperaturaPlot",
              icon = icon("bar-chart")
            ),
            menuSubItem(
              text = "Precipitação cumulativa",
              tabName = "PrecipitacaoCumulativa",
              icon = icon("bar-chart")
            ),
            menuSubItem(
              text = "Dia seco e umido",
              tabName = "diaSecoUmido",
              icon = icon("bar-chart")
            ),
            menuSubItem(
              text = "Periodo Chuvoso",
              tabName = "periodoChuvosoPlot",
              icon = icon("bar-chart")
            )
          ),
          menuItem(
            text = "Selecione a estação",
            icon = icon("street-view"),
            selectInput(
              inputId = "estadoInput",
              label = "Selecione o estado:",
              choices = "SC"
            ),
            selectInput(
              inputId = "cidadeInput",
              label = "Selecione a cidade: ",
              choices = NULL
            ),
            dateRangeInput(
              inputId = "periodoInput",
              label = "Selecione o período:",
              start = '2000-02-11',
              end = '2021-02-15'
            )
          )
        )
      ),
      # End sidebar
      
      # Body aplication
      dashboardBody(
         
      )
    )
  )
}

#' Module Server clima
#' @param id id do modulo
#' 
climaServer <- function(input, output, session){
  
}