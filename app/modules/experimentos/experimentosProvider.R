#================================================
# Metodo para obter os dados dos genotipos
#================================================
experimentos.provider.dados = function() {
  statement = "SELECT ensaios.id,
     id_ensaio,
	   estados.nome as estado,
	   cidades.nome as cidade,
	   locais.nome as local,
	   tipos_de_graos.sigla as tipo_de_grao,
	   genotipos.nome as genotipo,
     parcela,
	   safra,
	   irrigacao,
	   fungicida,
	   populacao_planejada,
	   populacao_medida,
	   tratamento,
	   repeticao,
	   alteracao_genotipo,
	   numero_linhas_parcelas,
	   comprimento_linhas_parcelas,
	   numero_linhas_parcela_util,
	   comprimento_linhas_parcela_util,
	   espacamento_linhas_parcela_util,
	   area_colhida,
	   gramas_na_parcela_util,
	   umidade, produtividade,
	   peso_250_graos,
	   massa_cem_sementes,
	   numero_de_plantas_na_parcela_util_vegetativo_linha_um,
	   numero_de_plantas_na_parcela_util_vegetativo_linha_dois,
	   numero_medio_plantas_parcela_util_vegetativo,
	   numero_de_plantas_na_parcela_util_reprodutivo_linha_um,
	   numero_de_plantas_na_parcela_util_reprodutivo_linha_dois,
	   numero_medio_plantas_parcela_util_reprodutivo,
	   plantasm2fin,
	   data_semeadura,
	   replantio,
	   data_emergencia,
	   data_debaste,
	   data_inicio_floracao,
	   data_inicio_ponto_colheita,
	   data_inicio_colheita,
	   data_entrada_amostra,
	   data_processamento_amostra,
	   data_leitura_cor_do_grao,
	   cor_do_grao, numero_de_plantas_sclerotinia,
	   antraquinose_severidade,
	   mancha_angular_severidade,
	   mancha_alternaria_severidade,
	   ferrugem_folha_severidade,
	   oidio_severidade,
	   xantamonas_severidade,
	   fusarium_oxysporum_severidade,
	   fusarium_solani_severidade,
	   curto_bacterium_severidade,
	   mosaico_dourado_severidade,
	   mosaico_comum_severidade,
	   rhizoctonia_solani_severidade,
	   fitotoxicidade_hebicida_inseticida_oleo_severidade,
	   bronzeado_causado_por_acaro,
	   estatura_planta_um,
	   estatura_planta_dois,
	   estatura_planta_tres,
	   acamamento,
	   planta_adaptada,
	   dano_geada_severidade,
	   largata_elasmo,
	   dano_spodopte,
	   granizo_sem_debulha,
	   data_verificacao_granizo_sem_debulha,
	   granizo_com_debulha,
	   estadio_granizo_sem_debulha,
	   data_verificacao_granizo_com_debulha,
	   estadio_granizo_com_debulha,
	   folhas_rendilhadas_idem_sintoma_psudomonas,
	   haste_verde_severidade,
	   retencao_foliar_severidade,
	   lebre_severidade,
	   antracnose_colheita,
	   seca_pos_floracao,
	   tecnica, validacao,
	   epoca,
	   cultura.nome as cultura,
	   flor_das,
	   flor_dae,
	   ciclo_das,
	   ciclo_dae,
	   id_local,
	   id_genotipo,
	   id_cultura
	FROM public.ensaios
	JOIN genotipos ON ensaios.id_genotipo = genotipos.id
	JOIN locais ON ensaios.id_local = locais.id
	JOIN cidades ON locais.id_cidade = cidades.id
	JOIN estados ON cidades.id_estado = estados.id
	JOIN tipos_de_graos ON genotipos.id_tipo_grao = tipos_de_graos.id
	JOIN cultura ON ensaios.id_cultura = cultura.id"
  dados = banco.provider.executeQuery(statement, DOENCA_DB_DATABASE)
  return(dados)
}

#================================================
# Metodo para obter dados unicos de uma coluna
#================================================
experimentos.provider.unique = function(dados, coluna) {

  dados = unique(dados[, coluna])
  return(dados)
}

#================================================
# Metodo para filtrar o data.frame
#================================================
experimentos.provider.dadosFiltrados = function(dados, input) {
  
  # Criando data.frame a ser filtrado
  filtrado = dados
  
  # Checando todos
  indexCultura = which(input[['culturaInputDoencas']] == "Todos")
  indexCidade = which(input[['cidadeInputDoencas']] == "Todos")
  indexEstado = which(input[['estadoInputDoencas']] == "Todos")
  indexTipoGrao = which(input[['tipodegraoInputDoencas']] == "Todos")
  indexEpoca = which(input[['epocaInputDoencas']] == "Todos")
  indexSafra = which(input[['safraInputDoencas']] == "Todos")
  
  
  # Filtrando cultura
  if(length(indexCultura) == 0 & !is.null(input$culturaInputDoencas)){
    filtrado = filtrado[filtrado$cultura %in% input$culturaInputDoencas,]
  }
  
  # Filtrando cidade
  if(length(indexCidade) == 0 & !is.null(input$cidadeInputDoencas)){
    filtrado = filtrado[filtrado$cidade %in% input$cidadeInputDoencas,]
  }
  
  # Filtrando estado
  if(length(indexEstado) == 0 & !is.null(input$estadoInputDoencas)){
    filtrado = filtrado[filtrado$estado %in% input$estadoInputDoencas, ]
  }
  
  # Filtrando tipo de grao
  if(length(indexTipoGrao) == 0 & !is.null(input$tipodegraoInputDoencas)){
    filtrado = filtrado[filtrado$tipo_de_grao %in% input$tipodegraoInputDoencas, ]
  }
  
  # Filtrando epoca
  if(length(indexEpoca) == 0 & !is.null(input$epocaInputDoencas)){
    filtrado = filtrado[filtrado$epoca %in% input$epocaInputDoencas, ]
  }
  
  # Filtrando safra
  if(length(indexSafra) == 0 & !is.null(input$safraInputDoencas)){
    filtrado = filtrado[filtrado$safra %in% input$safraInputDoencas, ]
  } 
  
  # Filtrando irrigacao e fungicida
  filtrado = filtrado[filtrado$irrigacao %in% input$irrigacaoInputDoencas &
                      filtrado$fungicida %in% input$fungicidaInputDoencas &
                      filtrado$cultura   %in% input$culturaInputDoencas, ]
  
  return(filtrado)
}



TE1 = function(df, y, rep, gen, trials, accuracy) {
  tryCatch(
    expr = {
      
      dfa = df[, c(y, gen, rep, trials)]
      names(dfa) = c("y", "g", "r", "e")
      
      Ntrials = length(unique(dfa$e))
      results = matrix(nrow = Ntrials, ncol = 13)
      colnames(results) = c(
        "CodigodoExperimento",
        "mean",
        "BLUE",
        "MEDIA_ARITMETICA",
        "Vg",
        "Vres",
        "Vf",
        "h2",
        "rgg",
        "CVg",
        "CVe",
        "CV",
        "Diagnostico"
      )
      
      for (index in 1:Ntrials) {
        
        id = unique(dfa$e)[index]
        subsetIndex = which(dfa$e == id)
        subsetTable = dfa[subsetIndex, ]
        
        index.validade = mean(subsetTable$y)
        
        r = length(unique(subsetTable$r))
        MEDIA_ARITMETICA =  mean(subsetTable$y, na.rm = TRUE)
        
        if(r > 1){
          
          modelo = lmer(y ~ 1 + r + (1|g), subsetTable)
          vg = VarCorr(modelo)[[1]][1]
          
          vres = sigma(modelo) ^ 2
          vf = vg + vres
          h2 = vg / (vg + (vres / r))
          m = fixef(modelo)[[1]]
          CV = 100 * attr(VarCorr(modelo), "sc") / m
          cvg = 100 * (sqrt(vg) / m)
          cve = 100 * (sqrt(vf) / m)
          rgg = sqrt(1 - (1 / (1 + r * (cvg / cve) ^ 2)))
          BLUE = summary(modelo)$coefficients[1,1]
          
          
          res.row = c(as.character(id), m, BLUE, MEDIA_ARITMETICA, vg, vres, vf, h2, rgg, cvg, cve, CV, NA)
          results[index, ] = res.row 
          
        } else {
          res.row = c(as.character(id),NA, NA, MEDIA_ARITMETICA, NA, NA, NA, NA, NA, NA, NA, NA, NA)
          results[index, ] = res.row 
        }
      }
      
      r7 = as.numeric(results[, 7])
      acc = r7 < accuracy
      splitRate = as.vector(table(acc))
      splitRate = round(splitRate / sum(splitRate), 2)
      splitRate = sprintf("%s (%s", c("remover", "manter"), splitRate[2:1] * 100)
      splitRate = paste0(splitRate, "%)")
      
      valid = ifelse(acc, splitRate[1], splitRate[2])
      
      results[, 13] = valid
      results = data.frame(results)
      results[, 12] = as.numeric(as.character(results[, 12]))
      results[, 12] = ifelse(results[, 12] > 100 |
                               results[, 12] < 0, NA, results[, 12])
      
      return(results)
    },
    error = function(e) {
      return(NULL)
    }
  )
}

service.getDiagostico = function(tabela) {
  
  tabela$repeticao = as.factor(tabela$repeticao)
  diagnostico = TE1(
    y = "produtividade",
    trials = "id_ensaio",
    gen = "genotipo",
    rep = "repeticao",
    accuracy = 0.3,
    df = tabela
  )
  
  if (!is.null(diagnostico)) {
    
    diagnostico$BLUE = round(as.numeric(diagnostico$BLUE),0)
    diagnostico$MEDIA_ARITMETICA = round(as.numeric(diagnostico$MEDIA_ARITMETICA),0)
    diagnostico$mean = round(as.numeric(as.character(diagnostico$mean)),0)
    diagnostico$Vg = round(as.numeric(as.character(diagnostico$Vg)),0)
    diagnostico$Vres = round(as.numeric(as.character(diagnostico$Vres)),0)
    diagnostico$Vf = round(as.numeric(as.character(diagnostico$Vf)),2)
    diagnostico$h2 = round(as.numeric(as.character(diagnostico$h2)),2)
    diagnostico$rgg = round(as.numeric(as.character(diagnostico$rgg)),2)
    diagnostico$CVg = round(as.numeric(as.character(diagnostico$CVg)),2)
    diagnostico$CVe = round(as.numeric(as.character(diagnostico$CVe)),2)
    diagnostico$CV = round(as.numeric(as.character(diagnostico$CV)),2)
    diagnostico$CV = round(diagnostico$CV, 2)
    
    # Ordenando colunas
    diagnostico = diagnostico[,c(
      "CodigodoExperimento",
      "mean",
      "BLUE",
      "MEDIA_ARITMETICA",
      "Vg",
      "Vres",
      "Vf",
      "h2",
      "rgg",
      "CVg",
      "CVe",
      "CV",
      "Diagnostico"
    )]
    
    # Renomeando colunas
    names(diagnostico)[2] = "BLUP"
    
    # Ordenando colunas
    diagnostico = diagnostico[order(diagnostico$Diagnostico),]
    
    return(diagnostico)
    
  } else {
    return(NULL)
  }
}

service.getY = function(tabela, relatorio = FALSE) {
  tryCatch(
    expr = {
      
      tabela$ano = as.Date(tabela$data_semeadura)
      tabela$ano = format(tabela$ano, "%Y")
      Y = y.matrix.2(
        trait = "produtividade",
        gid = "genotipo",
        rep = "repeticao",
        year = "safra",
        site = "local",
        df = tabela
      )
      if(relatorio){
        Y = Y$Adjusted.Means.df
      }
        
      return(Y)
    },
    error = function(e){ 
      msg = paste("Erro",e,sep = ":")
      cat(msg)
      return(NULL)
    }
  )
}

service.getMean = function(tabela, input) {
  
  Y = service.getY(tabela)
  Y1 = as.data.frame(Y[[1]])
  
  t1 = Y1 %>%
    group_by(gid, site) %>%
    dplyr::summarize(mean = mean(y, na.rm = TRUE))
  
  t1 = data.frame(t1)
  
  indexSelecionados = which(!input$GenotipoSelectDoencas %in% "Todos")
  
  if (!is.null(input$GenotipoSelectDoencas) &&
      length(indexSelecionados) > 0) {
    GenNames = input$GenotipoSelectDoencas[indexSelecionados]
    t1 = t1[t1$gid %in% GenNames, ]
  }
  
  
  return(t1)
}
#==============================================#
naCounter = function(values) {
  index = which(is.na(values))
  rate = length(index) / length(values)
  return(rate * 100)
}
#==============================================#

#==============================================#
y.matrix.2 = function(df,trait,rep,site, gid, year){
  
  dataset = df[,c(trait, rep, site, gid, year)]
  names(dataset) = c("trait","rep", "site", "gid", "year")
  yearBackup = unique(dataset$year)
  siteBackup = unique(dataset$site)
  
  r = length(unique(dataset$rep))
  y = length(unique(dataset$year))
  s = length(unique(dataset$site))
  
  
  if(length(unique(dataset$site)) > 1){
    
    if(length(unique(dataset$year)) > 1){
      
      
      mix.model.an = lmer(trait~rep:site:year+(1|gid)+(1|gid:site) + (1|gid:year) + (1|gid:site:year),data= dataset)
      
      rn = ranef(mix.model.an)
      
      g = convertModel(rn$"gid", c("gid", "g.hat"))
      gy = convertModel(rn$"gid:year", c("gid","year", "gy.hat"))
      gl = convertModel(rn$"gid:site", c("gid","site", "gl.hat"))
      gly = convertModel(rn$"gid:site:year", c("gid","site","year", "gly.hat"))
      
      resposta = merge(g, gy, by = c("gid"))
      resposta = merge(resposta, gl, by = c("gid"))
      resposta = merge(resposta, gly, by = c("gid","site","year")) 
      
    } else {
      
      mix.model.an = lmer(trait~rep:site + (1|gid)+(1|gid:site),data= dataset)
      
      rn = ranef(mix.model.an)
      
      g = convertModel(rn$"gid", c("gid", "g.hat"))
      gy = convertModel(rn$"gid", c("gid", "gy.hat"))
      gl = convertModel(rn$"gid:site", c("gid","site", "gl.hat"))
      gly = convertModel(rn$"gid:site", c("gid","site", "gly.hat"))
      
      resposta = merge(g, gy, by = c("gid"))
      resposta = merge(resposta, gl, by = c("gid"))
      resposta = merge(resposta, gly, by = c("gid","site")) 
      resposta$year = yearBackup
    }
    
  } else {
    
    if(length(unique(dataset$year)) > 1){
      
      mix.model.an = lmer(trait~rep:year+(1|gid) + (1|gid:year) + (1|gid:year),data= dataset)
      
      rn = ranef(mix.model.an)
      
      g = convertModel(rn$"gid", c("gid", "g.hat"))
      gy = convertModel(rn$"gid:year", c("gid","year", "gy.hat"))
      gl = convertModel(rn$"gid", c("gid", "gl.hat"))
      gly = convertModel(rn$"gid:year", c("gid","year", "gly.hat"))
      
      resposta = merge(g, gy, by = c("gid"))
      resposta = merge(resposta, gl, by = c("gid"))
      resposta = merge(resposta, gly, by = c("gid","year")) 
      resposta$site = siteBackup
      
    } else {
      
      mix.model.an = lmer(trait~rep +(1|gid),data= dataset)
      
      rn = ranef(mix.model.an)
      
      g = convertModel(rn$"gid", c("gid", "g.hat"))
      gy = convertModel(rn$"gid", c("gid", "gy.hat"))
      gl = convertModel(rn$"gid", c("gid", "gl.hat"))
      gly = convertModel(rn$"gid", c("gid", "gly.hat"))
      
      resposta = merge(g, gy, by = c("gid"))
      resposta = merge(resposta, gl, by = c("gid"))
      resposta = merge(resposta, gly, by = c("gid"))
      resposta$site = siteBackup
      resposta$year = yearBackup
      
    }
    
  }
  
  fn = fixef(mix.model.an)[1]
  resposta$y = resposta$g.hat + resposta$gl.hat + resposta$gy.hat + resposta$gly.hat + fn
  resposta = resposta[,c('gid','site','year','g.hat','gy.hat','gl.hat','gly.hat','y')]
  
  hat_table = resposta[,4:7]
  resposta$y.cor = apply(hat_table, 1, function(x) {
    return(sum(x,na.rm=T) + fn)
  })
  
  resp_list = list()
  resp_list$Adjusted.Means.df = resposta
  resp_list$Mu = fn
  resp_list$comps = Comp.var(mix.model.an,r=r,s=s,y=y)
  
  return(resp_list)
}
#==============================================#

#==============================================#
convertModel = function(list_table, colNames) {
  
  rowValues = strsplit(row.names(list_table), split = ":")
  resposta = do.call(rbind, rowValues)
  
  resposta = data.frame(resposta)
  resposta$hat = list_table[,1]
  names(resposta) = colNames
  
  return(resposta)
}
#==============================================#

#==============================================#
Comp.var = function(model,r,s,y) {
  
  vcor = VarCorr(model)
  
  var.total = sum(vcor$"gid"[1], vcor$"gid:year"[1], vcor$"gid:site"[1], vcor$"gid:site:year"[1],sigma(model)^2)
  h2.plot = vcor$"gid"[1]/(vcor$"gid"[1]+vcor$"gid:year"[1] + vcor$"gid:site"[1]+vcor$"gid:site:year"[1]+sigma(model)^2)
  
  Cgy = vcor$"gid:year"[1]/var.total
  Cgl = vcor$"gid:year"[1]/var.total
  Cgly = vcor$"gid:site:year"[1]/var.total
  
  h2.mean = vcor$"gid"[1]/(vcor$"gid"[1]+(vcor$"gid:year"[1]/y) + (vcor$"gid:site"[1]/s)+(vcor$"gid:site:year"[1]/(y*s))+(sigma(model)^2)/(y*r*s))
  return(list(h2.mean=h2.mean,h2.plot=h2.plot,Cgy=Cgy, Cgl = Cgl, Cgly = Cgly))
}
#==============================================#


model.GGE = function(tabela) {
  Y = model.Values(tabela)
  gge.model = NULL
  if(!is.null(Y)){
    validate.model = gge(acast(Y, genotipo ~ id_gge, value.var = "emmean"))
    validate.NA = colSums(is.na(validate.model$x))
    validate.NA = length(validate.NA[validate.NA > 1])
    if(validate.NA < 1){
      gge.model = validate.model
    }
  }
  return(gge.model)
}

#==============================================#
model.Values = function(tabela) {
  tryCatch(
    expr = {
      # modelo de efeito fixo
      fixed = dlply(tabela, .(id_ensaio), function(x)
        lm(produtividade ~ repeticao + genotipo, x))
      means = llply(fixed, function(x)
        emmeans(x, specs = "genotipo"))
      
      y = NULL
      for (j in 1:length(means)) {
        y = rbind(y, data.frame(means[[j]], id_ensaio = names(means)[j]))
      }
      
      W = unique(tabela[, c(2, 5)])
      Y = merge(y, W, by = "id_ensaio")
      
      
      Y$id_gge = Y$local
      
      return(Y)
    },
    error = function(e) {
      return(NULL)
    }
  )
}
#==============================================#

#==============================================#
model.deno = function(tabela) {
  Y = model.Values(tabela)
  if(!is.null(Y)){
    tryCatch(
      expr = {
        
        Ym = acast(Y,genotipo ~ id_gge, value.var="emmean")
        ysea = t(gge(Ym)$x)
        
        dd = dist(ysea, method = "euclidean")
        hc = hclust(dd, method = "ward.D2")
        
        return(hc)   
      },
      error = function(e){ 
        return(NULL)
      }
    )
  }
}
#==============================================#

#==============================================#
model.dadosRelatorio = function(dadosRelatorio){
  
  dadosRelatorio = as.data.frame(dadosRelatorio[[1]])
  
  dadosRelatorio = dadosRelatorio %>%
    group_by(gid) %>%
    dplyr::summarize(mean = mean(y, na.rm = TRUE))
  
  return(dadosRelatorio)
}
#==============================================#
