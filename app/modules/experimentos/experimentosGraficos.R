#==============================================#
# Grafico "Contagem"
grafico.diagnostico_Contagem = function(tabela) {
  validate.vx = is.na(tabela$h2) | is.infinite(tabela$h2)
  validate.vy = is.na(tabela$rgg) | is.infinite(tabela$rgg)
  
  row.index = which(!validate.vx & !validate.vy)
  col.index = which(names(tabela) %in% c("h2", "rgg", "Diagnostico"))
  tabela = tabela[row.index, col.index]
  
  color.palette = c("#7cb342", "#e53935")
  scatterD3(
    data = tabela,
    x = h2,
    y = rgg,
    col_var = Diagnostico,
    colors = color.palette,
    xlab = "Herdabilidade",
    ylab = "Correlacao genetica entre valor fenotipo e genotipo",
    menu = F,
    xlim = c(0, 1),
    ylim = c(0, 1)
  )
}
#==============================================#

#==============================================#
# Aba "Dados Perdidos"
graphics.dadosPerdidos_Estatistica = function(tabela) {
  namesIndex = which(
    names(tabela) %in% c(
      "id_ensaio",
      "flor_das",
      "flor_dae",
      "ciclo_das",
      "ciclo_dae",
      "produtividade"
    )
  )
  subsetTabela = tabela[, namesIndex]
  
  naTabela = melt(subsetTabela, id.vars = "id_ensaio")
  naTabela = dcast(naTabela,
                   id_ensaio ~ variable,
                   value.var = "value",
                   fun.aggregate = naCounter)
  naTabela = melt(naTabela, id.vars = "id_ensaio")
  
  names(naTabela) = c("Experimento", "Variavel", "Valor")
  
  ggplot(data = naTabela, aes(x = Variavel, y = Experimento)) + geom_tile(aes(fill = Valor), colour = "white") +
    scale_fill_gradient(low = "#7cb342", high = "#e53935") + theme_minimal() +
    theme(text = element_text(size = 15))
}
#==============================================#
# Aba "Estatistica"
# Grafico "Resumo"
grafico.analiseEstatistica_Resumo = function(tabela) {
  Y1 = data.frame(tabela[[1]])
  model.mean = as.numeric(tabela[[2]])
  
  Y1 = Y1 %>% group_by(gid) %>% summarize(mean = mean(y.cor, na.rm = TRUE))
  Y1$mean = round((Y1$mean - model.mean), 2)
  Y1$type = ifelse(Y1$mean < 0, "below", "above")
  
  theme_set(theme_bw())
  
  correlation = as.numeric(tabela[[3]])
  sub = sprintf("h2: %s, Produtividade media: %s",
                round(correlation[[1]], 2) ,
                round(model.mean, 2))
  
  ggplot(Y1, aes(
    x = fct_reorder(gid, mean),
    y = mean,
    label = gid
  )) +
    geom_bar(stat = 'identity', aes(fill = type), width = .5) +
    scale_fill_manual(
      name = "Produtividade",
      labels = c("Acima media geral", "Abaixo media geral"),
      values = c("above" = "#7cb342", "below" = "#e53935")
    ) +
    labs(subtitle = sub, title = "") +
    ylab("Variacao na produtividade, kg/ha") + xlab("Genotipos") + coord_flip()
}
#==============================================#

#==============================================#
# Aba "Estatistica"
# Grafico "Unitario"
grafico.analiseEstatistica_Unitario = function(tabela, site = "") {
  Y1 = data.frame(tabela[[1]])
  if (site == "") {
    site = unique(Y1$site)
    site = site[order(site)]
    site = site[1]
  }
  
  model.mean = as.numeric(tabela[[2]])
  correlation = as.numeric(tabela[[3]])
  correlation = round(correlation, digits = 2)
  
  Y1$site = as.character(Y1$site)
  solo = Y1[Y1$site == site, ]
  
  solo$mean = round((solo$y.cor - model.mean), 2)
  solo$type = ifelse(solo$mean < 0, "below", "above")
  solo$gid_plot = sprintf("%s_%s", as.character(solo$gid), as.character(solo$year))
  
  sub = sprintf("Analise individual: %s", site)
  
  
  ggplot(solo, aes(
    x = fct_reorder(gid_plot, mean),
    y = mean,
    label = gid_plot
  )) +
    geom_bar(stat = 'identity', aes(fill = type), width = .5) +
    scale_fill_manual(
      name = "Produtividade",
      labels = c("Acima media geral", "Abaixo media geral"),
      values = c("above" = "#7cb342", "below" = "#e53935")
    ) +
    labs(subtitle = sub, title = "") +
    ylab("Variacao na produtividade, kg/ha") + xlab("Genotipos") + coord_flip()
}
#==============================================#

#==============================================#
# Aba "Estatistica"
# Grafico "Heatmap"
grafico.analiseEstatistica_Heatmap = function(tabela) {
  Y1 = data.frame(tabela[[1]])
  Y1 = Y1 %>% group_by(gid, site) %>% summarize(mean = mean(y.cor, na.rm = TRUE))
  
  ggplot(Y1, aes(site, reorder(gid, mean))) +
    geom_tile(aes(fill = mean), color = "white") +
    scale_fill_gradient(low = "#e53935", high = "#7cb342") +
    ylab("Genotipos") + xlab("Locais") +
    theme(
      legend.title = element_text(size = 10),
      legend.text = element_text(size = 12),
      plot.title = element_text(size = 16),
      axis.title = element_text(size = 14, face = "bold"),
      axis.text.x = element_text(angle = 90, hjust = 1)
    ) +
    labs(fill = "Produtividade\n (Kg/ha)")
}
#==============================================#

#==============================================#
# Aba "Estatistica"
# Grafico "Linhas"
grafico.GraficoLinhas = function(dados) {
  dados$gid = as.character(dados$gid)
  dados$gid = factor(dados$gid)
  
  #Calculando media por local
  
  dados_mean = dados %>%
    group_by(site) %>%
    dplyr::summarize(Mean = mean(mean, na.rm = TRUE))
  dados_mean = as.data.frame(dados_mean)
  
  #Gerando grafico
  p = ggplot(data = NULL) +
    geom_line(data = dados, aes(
      x = site,
      y = mean,
      group = gid,
      colour = gid
    )) +
    geom_point(
      data = dados_mean,
      aes(x = site, y = Mean),
      shape = 17,
      size = 3
    ) +
    theme(axis.text.x = element_text(angle = 90),
          text = element_text(size = 15)) +
    xlab("Local") +
    ylab("Produtividade (kg/ha)") +
    labs(colour = "Genotipo")
  
  
  return(p)
}