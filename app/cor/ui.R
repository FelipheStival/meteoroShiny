# Registrando rotas.
router = make_router(
  route("/", bemVindoUI()),
  route("clima", climaUI),
  route("experimentos",doencasUI),
  route("gerenciar", gerenciarUI)
)

# Pagina reponsavel pelo redirecionamento.
ui <- secure_app(fluidPage(router$ui))
