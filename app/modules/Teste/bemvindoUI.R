#=====================================================================
# Pagina de bem-vindo
#=====================================================================
bemVindoUI = function() {
  HTML(
    "
  <div id = 'wave-background'>
       <div id = 'container'>
          <div class = 'menu-item'>
            <div class = 'menu-item-icon'>
              <img src='icons//clima.png' alt='Icone clima'>
            </div>
            <h7>Clima</h7>
          </div>
          <div class = 'menu-item'>
            <div class = 'menu-item-icon'>
              <img src='icons//doencas.png' alt='Icone clima'>
            </div>
            <h7>Doenças</h7>
          </div>
          <div class = 'menu-item'>
            <div class = 'menu-item-icon'>
              <img src='icons//experimentos.png' alt='Icone clima'>
            </div>
            <h7>Experimentos</h7>
          </div>
          <div class = 'menu-item'>
            <div class = 'menu-item-icon'>
              <img src='icons//planta.png' alt='Icone clima'>
            </div>
            <h7>Agricultor</h7>
          </div>
       </div>
    </div>"
  )
}