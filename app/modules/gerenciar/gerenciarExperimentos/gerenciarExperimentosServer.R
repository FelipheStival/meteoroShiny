# Gerenciar server
gerenciarExperimentosServer = function(input, output, session) {
  
  #===================entrada de dados===================
  
  dadosUpload = reactive({
    
    dados = NULL
    
    if(!is.null(input$arquivo)){
      dados = read.table(input$arquivo$datapath,
                         header = input$header,
                         sep = input$sep,
                         stringsAsFactors = F)
    }
    
    return(dados)
  }) 
  
  #=======================================================
  
  #=======================Criando output tabela=================
  
  observe({
    
    if(!is.null(dadosUpload())){
      
      #Verificando separador
      if(ncol(dadosUpload()) <= 1){
        
        shinyalert(
          title = 'Erro separador',
          text = 'Selecione outro separador',
          type = "error"
        )
        
      } 
      else
      {
        
        #Verificando colunas PROD e parental
        if(!verificarColunas(dadosUpload())){
          
          shinyalert(
            title = 'Colunas obrigatorias',
            text = 'A tabela deve conter as colunas PARENTAL E PROD',
            type = "error"
          )
        }
        
        #Verificando se existe NA na tabela
        if(verificarColunas(dadosUpload()) & !VerificarNAColunas(dadosUpload())){
          
          shinyalert(
            title = 'Valores nulos',
            text = 'A tabela possui valores nulos',
            type = "error"
          )
          
        }
        
      }
      
    } else{
      
      #Visualizacao tabela
      output$UItabelaGerenciarExperimentos = renderUI({
        
        HTML('<center><h4>Escolha um arquivo para comecar</h4></center>')
        
      })
    }
    
  })
  
  #===================================================================
  
  #=======================Escrevendo tabela===========================
  
  output$tabelaUsuario = renderDataTable({
    datatable(globalData(),options = list(scrollY = '500px'))
  })
  
  #===================================================================
  
  return(output)
}