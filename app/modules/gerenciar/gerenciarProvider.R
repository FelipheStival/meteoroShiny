#================================================================
# Gerenciar Provider
#================================================================
inserirNovosDados = function(novosDados){
  
  # Verificacoes 
  conexao = banco.provider.openConnection('ensaios')
  
  # Selecionando colunas para inserir
  nomesColunas  = c(
    'id_ensaio',
    'safra',
    'irrigacao',
    'fungicida',
    'repeticao',
    'produtividade',
    'data_semeadura',
    'data_emergencia',
    'data_inicio_floracao',
    'data_inicio_ponto_colheita',
    'data_inicio_colheita',
    'epoca'
  )
  dadosInserir = novosDados[,nomesColunas]
  NumeroLinhas = nrow(dadosInserir)
  
  # Lendo linha e transformando em Query
  for(i in 1:NumeroLinhas){
    linha = dadosInserir[i,]
    
    # Transformando em query e inserindo dados
    query = sqlAppendTable(conexao, 'ensaios', linha)
    dbSendUpdate(conexao, query)
  }
  
  dbDisconnect(conexao)
  
  return(true)
}