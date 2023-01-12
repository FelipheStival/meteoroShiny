# Gerenciar doencas Server
gerenciarDoencasServer = function(input, output, session) {
  
  #===================entrada de dados===================
  
  dadosUploadDoencas = reactive({
    
    dados = NULL
    
    if(!is.null(input$arquivoDoencas)){
      
      dados = read.table(input$arquivoDoencas$datapath,
                         header = input$cabecalhoDoencas,
                         sep = input$separadorDoencas,
                         stringsAsFactors = F)
      
    }
    
    return(dados)
    
  }) 
  
  #=======================================================
  
  #=======================Criando output tabela=================
  
  observe({
    
    # Botao retornar
    observeEvent(input$btnRetonarGerenciarDoencas,
                 change_page('/')
    )
    
    
    if(!is.null(dadosUploadDoencas())){
      
      #Verificando separador
      if(ncol(dadosUploadDoencas()) <= 1){
        
        shinyalert(
          title = 'Erro separador',
          text = 'Selecione outro separador',
          type = "error"
        )
        
      } 
      else
      {
        
        #Verificando colunas PROD e parental
        if(!verificarColunasGerenciarDoencas(dadosUploadDoencas())){
          
          shinyalert(
            title = 'Colunas obrigatorias',
            text = 'A tabela deve conter as colunas PARENTAL E PROD',
            type = "error"
          )
          
        } else {
          
          #Visualizacao tabela
          output$UItabelaGerenciarDoencas = renderUI({
            
            dataTableOutput("tabelaDoencasUpload")
            
          })
          
        }
        
      }
      
    } else{
      
      #Visualizacao tabela
      output$UItabelaGerenciarDoencas = renderUI({
        
        HTML('<center><h4>Escolha um arquivo para comecar</h4></center>')
        
      })
    }
    
  })
  
  #=======================Evento botao atualizar======================
  observeEvent(input$btnatualizarDadosDoencas, {
    
    if(!is.null(dadosUploadDoencas())){
      
      if(inserirDadosGerenciarDoencas(dadosUploadDoencas())){
        
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
  
  output$tabelaDoencasUpload = renderDataTable({
    datatable(dadosUploadDoencas(),options = list(scrollY = '500px'))
  })
  
  #===================================================================
  
  return(output)
}