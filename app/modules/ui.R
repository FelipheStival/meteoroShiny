# Registrando rotas.
router = make_router(
  route("/",bemVindoUI()),
  route("clima",climaUI)
)

# Pagina reponsavel pelo redirecionamento.
ui <- fluidPage(
   router$ui
)
