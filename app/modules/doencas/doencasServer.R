# Doenca service
doencaServer = function(input, output, session) {
  
  # dados doenca input service
  dadosEnsaios = reactive({
    dados = doencas.provider.dados()
    return(dados)
  })
  
  # Dados filtrados
  dadosFiltrados = reactive({
    dados = doencas.provider.dadosFiltrados(dadosEnsaios(), input)
    return(dados)
  })
  
  # Atualizando input safras
  observe({
    safras = sort(doencas.provider.unique(dadosEnsaios(), 'safra'))
    updateSelectInput(
      session = session,
      inputId = "safraInputDoencas",
      choices = safras,
      selected = safras[1]
    ) 
  })
  
  # Atualizando input estados
  observe({
    estados = doencas.provider.unique(dadosEnsaios(), 'estado')
    updateSelectInput(
      session = session,
      inputId = "estadoInputDoencas",
      choices = estados,
      selected = estados[1]
    ) 
  })
  
  # Atualizando input cidades
  observe({
    cidades = doencas.provider.unique(dadosEnsaios(), 'cidade')
    updateSelectInput(
      session = session,
      inputId = "cidadeInputDoencas",
      choices = c("Todos", cidades),
      selected = "Todos"
    ) 
  })
  
  # Atualizando input tipo de grao
  observe({
    tipoGraos = doencas.provider.unique(dadosEnsaios(), 'tipo_de_grao')
    updateSelectInput(
      session = session,
      inputId = "tipodegraoInputDoencas",
      choices = c("Todos", tipoGraos),
      selected = "Todos"
    ) 
  })
  
  # Atualizando input epoca
  observe({
    epocas =  doencas.provider.unique(dadosEnsaios(), 'epoca')
    updateSelectInput(
      session = session,
      inputId = "epocaInputDoencas",
      choices = c("Todos", epocas),
      selected = "Todos"
    ) 
  })
  
  output$grafico_diagnostico_Contagem = renderScatterD3({
    
    diagnostico = service.getDiagostico(dadosFiltrados())
    
    validate(
      need(!is.null(diagnostico), "Nao ha dados suficientes para exibicao do grafico.")
    )

    grafico.diagnostico_Contagem(diagnostico)
    
  })
  
  
  output$tabela_diagnostico_Exibir = renderDataTable({
    
    diagnostico = service.getDiagostico(dadosFiltrados())
    
    validate(
      need(!is.null(diagnostico), "Nao ha dados suficientes para exibicao da tabela.")
    )
    
    return(diagnostico)
    
  },options = list(lengthMenu = c(5,10, 25), pageLength = 5))
  #==============================================#
  
  #==============================================#
  output$botao_diagnostico_Download = downloadHandler(
    
    filename = function() {
      paste('diagnostico_', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      
      diagnostico = service.getDiagostico(dadosFiltrados())
      write.csv(diagnostico, con)
      
    }
  )
  
  output$grafico_dadosPerdidos_Estatistica = renderPlot({
    
    #====================================#
    # Validacao
    
    validate.ids_data = length(unique((dadosFiltrados()$id_ensaio)))
    
    validate(
      need(validate.ids_data > 0,
           "Nao ha dados suficientes para exibicao do grafico.")
    )
    
    #====================================#
    
    graphics.dadosPerdidos_Estatistica(dadosFiltrados())
    
  })
  
}