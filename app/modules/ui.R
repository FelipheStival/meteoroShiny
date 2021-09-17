# Registrando rotas.
router = make_router(
  route("/", bemVindoUI()),
  route("clima", climaUI),
  route("experimentos",doencasUI)
)

# Pagina reponsavel pelo redirecionamento.
ui <- fluidPage(
   router$ui
)
