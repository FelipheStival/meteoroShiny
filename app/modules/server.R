# Global server
server = shinyServer(function(input, output, session) {
  
  # Router
  router$server(input, output, session)
  
  # Conexao com banco de dados
  
  
  # clima Service
  mapaServer(input,output,session)
  
})
