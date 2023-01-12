# Gerenciar server
gerenciarExperimentosServer = function(input, output, session) {
  
  #===================entrada de dados===================
  
  dadosUploadExperimentos = reactive({
    
    dados = NULL
    
    if(!is.null(input$arquivoExperimentos)){
      
      dados = read.table(input$arquivoExperimentos$datapath,
                         header = input$cabecalhoExperimentos,
                         sep = input$separadorExperimentos,
                         stringsAsFactors = F)
      
    }
    
    return(dados)
    
  }) 
  
  #=======================================================
  
  #=======================Criando output tabela=================
  
  observe({
    
    # Botao retornar
    observeEvent(input$btnRetonarGerenciarExperimentos,
                 change_page('/')
    )
    
    
    if(!is.null(dadosUploadExperimentos())){
      
      #Verificando separador
      if(ncol(dadosUploadExperimentos()) <= 1){
        
        shinyalert(
          title = 'Erro separador',
          text = 'Selecione outro separador',
          type = "error"
        )
        
      } 
      else
      {
        
        #Verificando colunas PROD e parental
        if(!verificarColunasGerenciarExperimentos(dadosUploadExperimentos())){
          
          shinyalert(
            title = 'Colunas obrigatorias',
            text = 'A tabela deve conter as colunas PARENTAL E PROD',
            type = "error"
          )
          
        } else {
          
          #Visualizacao tabela
          output$UItabelaGerenciarExperimentos = renderUI({
            
            dataTableOutput("tabelaExperimentosUpload")
            
          })
          
        }
        
      }
      
    } else{
      
      #Visualizacao tabela
      output$UItabelaGerenciarExperimentos = renderUI({
        
        HTML('<center><h4>Escolha um arquivo para comecar</h4></center>')
        
      })
    }
    
  })
  
  #=======================Evento botao atualizar======================
  observeEvent(input$btnatualizarDadosExperimentos, {
    
    if(!is.null(dadosUploadExperimentos())){
      
      if(inserirDadosExperimentos(dadosUploadExperimentos())){
        
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
  
  #===================================================================
  
  #=======================Escrevendo tabela===========================
  
  output$tabelaExperimentosUpload = renderDataTable({
    datatable(dadosUploadExperimentos(),options = list(scrollY = '500px'))
  })
  
  #===================================================================
  
  return(output)
}