
router = make_router(
   route("/", bemVindoUI())
)

ui <- fluidPage(
   includeCSS("modules//styles//styles.css"),
   title = "Meteoro",
   router$ui
)