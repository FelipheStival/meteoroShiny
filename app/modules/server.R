# Global server
server = shinyServer(function(input, output, session) {
  
  # Autenticacao
  res_auth = secure_server(
    check_credentials = check_credentials(credenciais)
  )
  
  # Router
  router$server(input, output, session)
  
  # Botao retornar
  observeEvent(input$btnRetonar,
               change_page('/')
               )
  
  # Conexao com banco de dados
  
  
  # clima Service
  mapaServer(input,output,session)
  
  # Doenca Service
  doencaServer(input,output,session)
  
})
