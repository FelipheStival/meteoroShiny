#==================================================================
# Modulos da interface do clima
#==================================================================

#' Interface com mapa modulo clima
#' @param id id do modulo
#' @return tabitem
clima.Mapa <- function() {
  tabItem(tabName = "mapaTab",
          withSpinner(
            leafletOutput(outputId = "mapaEstacoes",width = "100%",height = "90vh")
          )
        )
}

#' Interface com modulo da tabeça clima
#' @param id id do modulo
#' @return tabitem
clima.Tabela <- function() {
  tabItem(tabName = "tabelaTab",
          tabBox(
            width = "100%",
            selected = 'Tabela',
            tabPanel(
              'Tabela',
              withSpinner(dataTableOutput('tabelaDados')),
              downloadButton("downloadDados", "Download")
            )
          )
        )
}

#' Interface com modulo grafico basico clima
#' @param id id do modulo
#' @return modulo grafico basico
clima.graficoBasico <- function() {
  
  # Dados perdidos
  tabItem(tabName = "graficosPerdidosPlot",
          box(
            width = 4,
            selectInput(
              inputId = "boxplotVariavel",
              label = "Selecione a variavel:",
              choices = c(
                "Temperatura mínima do ar(ºC)" = "tmin",
                "Temperatura máxima do ar(ºC)" = "tmax",
                "Temperatura média (ºC)" = "tmed",
                "Umidade relativa do ar média (%)" = "urmed",
                "Velocidade média do vento (m/s)" = "vento",
                "Velocidade máxima do vento (m/s)" = "vtmax",
                "Radiação solar global (MJ/m2.dia)" = "rad",
                "precipitação (mm)" = "precip",
                "temperatura do solo (ºC)" = "tsolo"
              )
            ),
            selectInput(
              inputId = "grupodiasBoxPlot",
              label = "Selecione o grupo de dias:",
              choices = c(
                "10 Dias" = 10,
                "21 Dias" = 21,
                "Mensal" = "Mon"
              )
            )
          ),
          box(width = 8,
              withSpinner(
                plotOutput(
                  "graficosPerdidosPlot",width = "100%",height = "80vh")
                )
            )
          )
}

#' Interface com modulo de grafico matriz
#' @param id id do modulo
#' @return modulo grafico basico
clima.grafico.matriz <- function() {
  #criando janela
  tabItem(tabName = "mapaMatrizplot",
          box(
            width = 4,
            selectInput(
              inputId = "variavelSelect",
              label = "Selecione a variavel:",
              choices = c(
                "Temperatura mínima do ar(ºC)" = "tmin",
                "Temperatura máxima do ar(ºC)" = "tmax",
                "Temperatura média (ºC)" = "tmed",
                "Umidade relativa do ar média (%)" = "urmed",
                "Velocidade média do vento (m/s)" = "vento",
                "Velocidade máxima do vento (m/s)" = "vtmax",
                "Radiação solar global (MJ/m2.dia)" = "rad",
                "precipitação (mm)" = "precip",
                "temperatura do solo (ºC)" = "tsolo"
              )
            ),
            selectInput(
              inputId = "grupoDiasSelect",
              label = "Selecione o grupo de dias:",
              choices = c(
                "10 dias" = 10,
                "21 dias" = 21,
                "Mensal" = "mon"
              )
            )
          ),
          box(width = 8,
              withSpinner(
                plotOutput("Matrizplot", width = "100%", height = "85vh")
              )
            )
          )
}

#' Interface com modulo de grafico precipitacao
#' @param id id do modulo
#' @return modulo grafico basico
clima.grafico.precipitacao <- function() {
  #criando janela
  tabItem(tabName = "Precipitacaoplot",
          box(
            width = 4,
            selectInput(
              inputId = "grupoDiasSelectPrec",
              label = "Selecione o grupo de dias:",
              choices = c(
                "10 dias" = 10,
                "21 dias" = 21,
                "Mensal" = "mon"
              )
            )
          ),
          box(width = 8,
              withSpinner(
                plotOutput("plotPrecipitacao", width = "100%", height = "85vh")
              )
            )
          )
}

#' Interface com modulo de grafico precipitacao cumulativa
#' @param id id do modulo
#' @return modulo grafico basico
clima.grafico.cumulativa <- function() {
  #criando janela
  tabItem(tabName = "PrecipitacaoCumulativa",
          box(width = 12,
              withSpinner(
                plotOutput("PrecipitacaoCumulativaPlot", width = '100%', height = "85vh")
              )
            )
          )
}

#' Interface com modulo de grafico seco e umido
#' @param id id do modulo
#' @return modulo grafico basico
clima.grafico.secoUmido <- function() {
  #criando janela
  tabItem(tabName = "diaSecoUmido",
          box(
            width = 4,
            selectInput(
              inputId = "secoUmidoGrupoDias",
              label = "Selecione o grupo de dias:",
              choices = c(
                "10 dias" = 10,
                "21 dias" = 21,
                "Mensal" = "mon"
              )
            )
          ),
          box(width = 8,
              withSpinner(
                plotOutput("secoUmidoPlot", width = "100%", height = "85vh")
              )
            )
          )
  
}

#' Interface com modulo de grafico periodo chuvoso
#' @param id id do modulo
#' @return modulo grafico basico
clima.grafico.periodoChuvoso <- function() {
  #criando janela
  tabItem(tabName = "periodoChuvosoPlot",
          box(
            width = 12,
            height = "85vh",
            withSpinner(
              plotOutput("periodoChuvosoPlot", width = "100%",height = "85vh")
            )
          )
        )
}

#' Interface com modulo de grafico temperatura
#' @param id id do modulo
#' @return modulo grafico basico
clima.grafico.Temperatura <- function() {
  #criando janela
  tabItem(tabName = "AnomaliaTemperaturaPlot",
          box(
            width = 3,
            selectInput(
              inputId = "safraGrupoInput",
              label = "Selecione o grupo de dias:",
              choices = c("Safra",
                          "Verao",
                          "Outono",
                          "Inverno",
                          "Primavera"),
              selected = "Safra"
            ),
          ),
          box(width = 9,
              withSpinner(
                plotOutput("AnomaliaTemperaturaPlot", width = "100%", height = "85vh")
              )
            )
          )
}

#' Interface com modulo de grafico anomalia da precipitacao
#' @param id id do modulo
#' @return modulo grafico basico
clima.grafico.anomaliaPrecipitacao = function() {
  tabItem(tabName = "AnomaliaPrecipitacaoplot",
          box(
            width = 3,
            selectInput(
              inputId = "anoSelectAnomalia",
              label = "Selecione o ano: ",
              choices = NULL
            )
          ),
          box(width = 9,
              withSpinner(
                plotOutput(
                  "anomaliaPrecipitacaoPlot",
                  width = "100%",
                  height = "85vh"
                )
              )
            )
          )
}
