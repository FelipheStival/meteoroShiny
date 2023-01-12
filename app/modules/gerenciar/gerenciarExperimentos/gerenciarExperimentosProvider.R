#================================================================
# Gerenciar Provider
#================================================================
inserirDadosExperimentos = function(novosDados){
  
  # Abrindo conexao
  conn = banco.provider.openConnection(DOENCA_DB_DATABASE)
  
  # Percorrendo linhas e checando se cidade e estado existe
  nlinhas = nrow(novosDados)
  
  for(i in 1:nlinhas){
    
    browser()
    linha = novosDados[i,]
    
    local = linha$local
    genotipo = linha$genotipo
    cultura = linha$cultura
    
    # Verificando se existe estado caso não exista irá inserir
    statment = sprintf("SELECT * FROM locais WHERE nome = '%s'", local)
    dadosLocal = banco.provider.executeQuery(statment, DOENCA_DB_DATABASE)
    
    if(nrow(dadosLocal) == 0){
      statment = sprintf("INSERT INTO public.locais(nome) VALUES ('%s')", local)
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
verificarColunasGerenciarExperimentos = function(arquivo){
  
  #selecionando colunas PROD e GENOTIPO
  requiredColumn = c("safra","irrigacao", "fungicida", "repeticao", "produtividade", "numero_de_plantas_na_parcela_util_vegetativo_linha_um", "data_semeadura", "data_emergencia", "data_emergencia", "data_inicio_floracao", "data_inicio_ponto_colheita", "data_inicio_colheita", "epoca", "local", "genotipo", "cultura")
  indexColumn = which(names(arquivo) %in% requiredColumn)
  
  if(length(indexColumn) >= 15){
    return(TRUE)
  }
  
  return(FALSE)
  
}