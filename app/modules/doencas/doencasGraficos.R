#==============================================#
# Grafico "Contagem"
grafico.diagnostico_Contagem = function(tabela) {
  validate.vx = is.na(tabela$h2) | is.infinite(tabela$h2)
  validate.vy = is.na(tabela$rgg) | is.infinite(tabela$rgg)
  
  row.index = which(!validate.vx & !validate.vy)
  col.index = which(names(tabela) %in% c("h2", "rgg", "Diagnostico"))
  tabela = tabela[row.index,col.index]
  
  color.palette = c("#7cb342", "#e53935")
  scatterD3(data = tabela, x = h2, y = rgg, col_var = Diagnostico, colors = color.palette,
            xlab = "Herdabilidade", ylab = "Correlacao genetica entre valor fenotipo e genotipo", 
            menu = F, xlim = c(0, 1), ylim = c(0, 1))
}
#==============================================#

#==============================================#
# Aba "Dados Perdidos"
graphics.dadosPerdidos_Estatistica = function(tabela) {
  
  namesIndex = which(names(tabela) %in% c("id_ensaio","flor_das","flor_dae","ciclo_das","ciclo_dae","produtividade"))
  subsetTabela = tabela[,namesIndex]
  
  naTabela = melt(subsetTabela, id.vars = "id_ensaio")
  naTabela = dcast(naTabela, id_ensaio ~ variable, value.var = "value", fun.aggregate = naCounter)
  naTabela = melt(naTabela, id.vars = "id_ensaio")
  
  names(naTabela) = c("Experimento", "Variavel", "Valor")
  
  ggplot(data = naTabela, aes(x = Variavel, y = Experimento)) + geom_tile(aes(fill = Valor), colour = "white") +
    scale_fill_gradient(low = "#7cb342", high = "#e53935") + theme_minimal()
}