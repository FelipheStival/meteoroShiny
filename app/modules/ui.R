# Registrando rotas.
router = make_router(
  route("/",bemVindoUI()),
  route('clima',fluidPage(HTML("<h1>teste</h1>")))
)

# Pagina reponsavel pelo redirecionamento.
ui <- fluidPage(
   router$ui
)
