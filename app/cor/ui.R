# Registrando rotas.
router = make_router(
  route("/", bemVindoUI()),
  route("clima", climaUI),
  route("experimentos", experimentosUI),
  route("gerenciarClima", gerenciarUI()),
  route("gerenciarExperimentos", gerenciarExperimentosUI()),
  route('gerenciarDoencas', gerenciarDoencasUI()),
  route("doencas", doencasUI)
)

# Pagina reponsavel pelo redirecionamento.
ui <- secure_app(
  fluidPage(router$ui),
  fab_position = 'none'
)
