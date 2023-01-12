# Gerenciar server
gerenciarServer = function(input, output, session) {
  
  #===================entrada de dados===================
  
  dadosUpload = reactive({
    
    dados = NULL
    
    if(!is.null(input$arquivo)){
      
      dados = read.table(input$arquivo$datapath,
                         header = input$cabecalho,
                         sep = input$separador,
                         stringsAsFactors = F)
    }
    
    return(dados)
    
  }) 
  
  #=======================================================
  
  #=======================Criando output tabela=================
  
  observe({
    
    # Botao retornar
    observeEvent(input$btnRetonarGerenciarClima,
                 change_page('/')
    )
    
    
    if(!is.null(dadosUpload())){
      
      #Verificando separador
      if(ncol(dadosUpload()) <= 1){
        
        shinyalert(
          title = 'Erro separador',
          text = 'Selecione outro separador',
          type = "error"
        )
        
      }  else {
        
       # Verificando colunas PROD e parental
        if(!verificarColunasGerenciarClima(dadosUpload())){
          
          shinyalert(
            title = 'Colunas obrigatorias',
            text = 'A tabela não possui os campos obrigatórios para inserir novos dados',
            type = "error"
          )
          
        } else {
          
          # Redenizando UI para visualizacao da tabela
          output$UItabela = renderUI({
            
            dataTableOutput("tabelaUsuario")
            
          })
          
        }
        
      }
      
    } else{
      
      #Visualizacao tabela
      output$UItabela = renderUI({
        
        HTML('<center><h4>Escolha um arquivo para comecar</h4></center>')
        
      })
    }
    
  })
  
  #===================================================================
  
  #=======================Escrevendo tabela===========================
  
  output$tabelaUsuario = renderDataTable({
    dadosUpload()
  })
  
  #===================================================================
  
  
  #=======================Evento botao atualizar======================
  observeEvent(input$btnatualizarDadosClima, {
    
    if(!is.null(dadosUpload())){
      
      if(inserirDadosClima(dadosUpload())){
        
        shinyalert(
          title = 'Sucesso',
          text = 'Dados atualizados com sucesso',
          type = "success"
        )
        
      } else {
        
        shinyalert(
          title = 'Erro',
          text = 'Erro ao atualizar os dados',
          type = "error"
        )
        
      }
      
    }
    
  })
  
  return(output)
}