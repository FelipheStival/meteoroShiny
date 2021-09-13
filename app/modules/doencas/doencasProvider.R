# Metodo para obter os dados dos genotipos
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

# Metodo para obter os dados unicos
doencas.provider.unique = function(dados, coluna) {
  dados = unique(dados[, coluna])
  return(dados)
}

# Metodo para filtrar o data.frame
doencas.provider.dadosFiltrados = function(dados, input) {
  # Filtrando dados
  filtrado = dados[dados$safra  %in% input$safraInputDoencas &
                   dados$estado %in% input$estadoInputDoencas &
                   dados$cidade %in% input$cidadeInputDoencas &
                   dados$irrigacao %in% input$irrigacaoInputDoencas &
                   dados$fungicida %in% input$fungicidaInputDoencas &
                   dados$tipo_de_grao %in% input$tipodegraoInputDoencas, ]
  return(filtrado)
}



TE1 = function(df, y, rep, gen, trials, accuracy) {
  tryCatch(
    expr = {
      dfa = df[, c(y, gen, rep, trials)]
      names(dfa) = c("y", "g", "r", "e")
      
      Ntrials = length(unique(dfa$e))
      results = matrix(nrow = Ntrials, ncol = 11)
      colnames(results) = c(
        "CodigodoExperimento",
        "mean",
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
        modelo = lmer(y ~ 1 + r + (1 | g) , subsetTable)
        vg = VarCorr(modelo)[[1]][1]
        
        vres = sigma(modelo) ^ 2
        vf = vg + vres
        h2 = vg / (vg + (vres / r))
        m = fixef(modelo)[[1]]
        CV = 100 * attr(VarCorr(modelo), "sc") / m
        cvg = 100 * (sqrt(vg) / m)
        cve = 100 * (sqrt(vf) / m)
        rgg = sqrt(1 - (1 / (1 + r * (cvg / cve) ^ 2)))
        
        res.row = c(as.character(id), m, vg, vres, vf, h2, rgg, cvg, cve, CV, NA)
        results[index, ] = res.row
      }
      
      r7 = as.numeric(results[, 7])
      acc = r7 < accuracy
      splitRate = as.vector(table(acc))
      splitRate = round(splitRate / sum(splitRate), 2)
      splitRate = sprintf("%s (%s", c("remover", "manter"), splitRate[2:1] * 100)
      splitRate = paste0(splitRate, "%)")
      
      valid = ifelse(acc, splitRate[1], splitRate[2])
      
      results[, 11] = valid
      results = data.frame(results)
      results[, 10] = as.numeric(as.character(results[, 10]))
      results[, 10] = ifelse(results[, 10] > 100 |
                               results[, 10] < 0, NA, results[, 10])
      
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
    diagnostico$mean = as.numeric(as.character(diagnostico$mean))
    diagnostico$Vg = as.numeric(as.character(diagnostico$Vg))
    diagnostico$Vres = as.numeric(as.character(diagnostico$Vres))
    diagnostico$Vf = as.numeric(as.character(diagnostico$Vf))
    diagnostico$h2 = as.numeric(as.character(diagnostico$h2))
    diagnostico$rgg = as.numeric(as.character(diagnostico$rgg))
    diagnostico$CVg = as.numeric(as.character(diagnostico$CVg))
    diagnostico$CVe = as.numeric(as.character(diagnostico$CVe))
    diagnostico$CV = as.numeric(as.character(diagnostico$CV))
    diagnostico$CV = round(diagnostico$CV, 2)
    
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
