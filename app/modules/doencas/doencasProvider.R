#================================================
# Metodo para obter os dados dos genotipos
#================================================
doencas.provider.dados = function() {
  statement = "SELECT ensaios.id,
    id_ensaio,
	   estados.nome as estado,
	   cidades.nome as cidade,
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
	   flor_das,
	   flor_dae,
	   ciclo_das,
	   ciclo_dae,
	   id_local,
	   id_genotipo
	FROM public.ensaios
	JOIN genotipos ON ensaios.id_genotipo = genotipos.id
	JOIN locais ON ensaios.id_local = locais.id
	JOIN cidades ON locais.id_cidade = cidades.id
	JOIN estados ON cidades.id_estado = estados.id
	JOIN tipos_de_graos ON genotipos.id_tipo_grao = tipos_de_graos.id"
  dados = banco.provider.executeQuery(statement, DOENCA_DB_DATABASE)
  return(dados)
}

#================================================
# Metodo para obter dados unicos de uma coluna
#================================================
doencas.provider.unique = function(dados, coluna) {

  dados = unique(dados[, coluna])
  return(dados)
}

#================================================
# Metodo para filtrar o data.frame
#================================================
doencas.provider.dadosFiltrados = function(dados, input) {
  
  # Criando data.frame a ser filtrado
  filtrado = dados
  
  # Checando todos
  indexCidade = which(input[['cidadeInputDoencas']] == "Todos")
  indexEstado = which(input[['estadoInputDoencas']] == "Todos")
  indexTipoGrao = which(input[['tipodegraoInputDoencas']] == "Todos")
  indexEpoca = which(input[['epocaInputDoencas']] == "Todos")
  indexSafra = which(input[['safraInputDoencas']] == "Todos")
  
  # Filtrando cidade
  if(length(indexCidade) == 0 & !is.null(input$cidadeInputDoencas)){
    filtrado = filtrado[filtrado$cidade %in% input$cidadeInput,]
  }
  
  # Filtrando estado
  if(length(indexEstado) == 0 & !is.null(input$estadoInputDoencas)){
    filtrado = filtrado[filtrado$estado %in% input$estadoInput, ]
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
                      filtrado$fungicida %in% input$fungicidaInputDoencas,]
  
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
      browser()
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

service.getY = function(tabela) {
  Y = y.matrix.2(
    trait = "PROD",
    gid = "ntrat",
    rep = "rep",
    year = "ano",
    site = "Local_2",
    df = tabela
  )
  return(Y)
}

service.getMean = function(tabela, input) {
  Y = service.getY(tabela)
  Y1 = as.data.frame(Y[[1]])
  
  t1 = Y1 %>%
    group_by(gid, site) %>%
    summarize(mean = mean(y.cor, na.rm = TRUE))
  
  t1 = data.frame(t1)
  
  IndexSelecionados = which(!input$GenotipoSelect %in% "todos")
  
  if (!is.null(input$GenotipoSelect) &&
      length(IndexSelecionados) > 0) {
    GenNames = input$GenotipoSelect[IndexSelecionados]
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