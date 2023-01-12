#========================================================
# Método para verificar as colunas do arquivo
#========================================================
verificarColunasGerenciarDoencas = function(arquivo){
  
  #selecionando colunas PROD e GENOTIPO
  requiredColumn = c("valor_fo", "valor_fs", "genotipo", "tipo_de_grao")
  indexColumn = which(names(arquivo) %in% requiredColumn)
  
  if(length(indexColumn) == 4){
    return(TRUE)
  }
  
  return(FALSE)
  
}

#========================================================
# Método para realizar a persistencia dos dados
#========================================================
inserirDadosGerenciarDoencas = function(arquivo){
  
  # Abrindo conexao
  conn = banco.provider.openConnection(DOENCA_DB_DATABASE)
  
  #selecionando colunas PROD e GENOTIPO
  requiredColumn = c("valor_fo", "valor_fs", "genotipo", "tipo_de_grao")
  indexColumn = which(names(arquivo) %in% requiredColumn)
  
  # Percorrendo linhas e checando se cidade e estado existe
  nlinhas = nrow(arquivo)
  
  for(i in 1:nlinhas){
    
    linha = arquivo[i,]
    
    genotipo = linha$genotipo
    sigla = linha$tipo_de_grao
    
    # Verificando se existe a sigla do genotipo caso nao exista irá inserir
    statment = sprintf("SELECT * FROM tipos_de_graos WHERE sigla = '%s'", sigla)
    tiposDeGraoDate = banco.provider.executeQuery(statment, DOENCA_DB_DATABASE)
    
    if(nrow(tiposDeGraoDate) == 0){
      statment = sprintf("INSERT INTO public.tipos_de_graos(sigla) VALUES ('%s');", sigla)
      dbSendQuery(conn, statment)
    }
    
    # Verificando se existe o genotipo caso nao exita ira inserir
    statment = sprintf("SELECT * FROM genotipos WHERE nome = '%s'", genotipo)
    genotipoDate = banco.provider.executeQuery(statment, DOENCA_DB_DATABASE)
    
    if(nrow(genotipoDate) == 0){
      statment = sprintf("INSERT INTO public.estados(nome) VALUES ('%s')", estado)
      dbSendQuery(conn, statment)
    }
    
    # dados insert
    dadosInsert = data.frame(
      valor_fo = linha$valor_fo,
      valor_fs = linha$valor_fs,
      id_genotipo = 1 
    )
    
    # Salvando tabela no banco
    statment = sqlAppendTable(conn, 'genotipos_doencas', dadosInsert)
    dbSendUpdate(conn, statment)
    
  }
  
  return(TRUE)
  
}