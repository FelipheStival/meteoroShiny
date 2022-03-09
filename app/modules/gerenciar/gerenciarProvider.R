#================================================================
# Gerenciar Provider
#================================================================
inserirNovosDados = function(novosDados){
  
  # Verificacoes 
  
  
  
  conexao = banco.provider.openConnection('ensaios')
  
  novosDados$tratamento = NULL
  novosDados$produtividade = as.numeric(novosDados$produtividade)
  novosDados$produtividade = round(novosDados$produtividade, 2)
  
  names(novosDados)[6] = 'produtividade'
  
  sql = sqlAppendTable(conexao, 'ensaios', novosDados)
  
  dbSendStatement(conexao,sql)
  
  dbDisconnect(sql)
}