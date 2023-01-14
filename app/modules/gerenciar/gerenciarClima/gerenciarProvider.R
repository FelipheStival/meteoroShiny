#================================================================
# Gerenciar Provider
#================================================================
inserirDadosClima = function(novosDados){
  
  # Abrindo conexao
  conn = banco.provider.openConnection(DB_DATABASE)
  
  # Percorrendo linhas e checando se cidade e estado existe
  nlinhas = nrow(novosDados)
  
  for(i in 1:nlinhas){
    
    linha = novosDados[i,]
    
    estado = linha$estado
    cidade = linha$cidade
    
    # Verificando se existe estado caso não exista irá inserir
    statment = sprintf("SELECT * FROM estados WHERE nome = '%s'", estado)
    dadosEstado = banco.provider.executeQuery(statment, DB_DATABASE)
    
    if(nrow(dadosEstado) == 0){
      statment = sprintf("INSERT INTO public.estados(nome) VALUES ('%s')", estado)
      dbSendQuery(conn, statment)
    }
    
    # Verificando se existe cidade caso não exista irá inserir
    statment =  sprintf("SELECT * FROM cidades WHERE nome = '%s'", cidade)
    dadosCidade = banco.provider.executeQuery(statment, DB_DATABASE)
    
    if(nrow(dadosCidade) == 0){
      statment = sprintf("INSERT INTO public.cidades(nome) VALUES ('%s')", cidade)
      dbSendQuery(conn, statment)
    }
    
    # Montando data.frame para ser inserido no banco
    dadosInsert = data.frame(
      data = linha$data,
      tmax = linha$tmax,
      tmin = linha$tmin,
      tmed = linha$tmed,
      urmed = linha$urmed,
      vento = linha$vento,
      vtmax = linha$vtmax,
      rad = linha$rad,
      precip = linha$precip,
      tsolo = linha$tsolo,
      id_cidade = dadosCidade$id
    )
    
    dadosInsert[dadosInsert == 'NULL'] = NA
    
    # Salvando tabela no banco
    statment = sqlAppendTable(conn, 'clima', dadosInsert)
    dbSendUpdate(conn, statment)
    
  }
  
  return(TRUE)
  
  
}

#========================================================
# Método para verificar as colunas do arquivo
#========================================================
verificarColunasGerenciarClima = function(arquivo){
  
  #selecionando colunas PROD e GENOTIPO
  requiredColumn = c("data","tmax", "tmin", "tmed", "urmed", "vento", "vtmax", "rad", "precip", "tsolo", "cidade", "estado")
  indexColumn = which(names(arquivo) %in% requiredColumn)
  
  if(length(indexColumn) >= 12){
    return(TRUE)
  }
  
  return(FALSE)
  
}