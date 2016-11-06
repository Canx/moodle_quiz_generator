question = {
  :type => :cloze,
  :name => "Direcciones inicial y final",
  :description => "Indica cual es la dirección inicial y final de las siguientes redes:",
  :generator => :ip,
  :ip => {
                 {mask: 28} => 4,
                 {mask: 16} => 4,
                 {mask: 24} => 4,
                 {mask: 26} => 4 
         },
  :answers => {
    :pre => "    <br /><pre>\n
    <table><tr><th>Direcciones</th><th>Dirección inicial</th><th>Dirección final</th>",
    :answer => "<tr>
                  <td><%= ip.network %></td>
                  <td>{1:SHORTANSWER:%100%#<%= ip.initial %>}</td>
                  <td>{1:SHORTANSWER:%100%#<%= ip.final %>}</td>
                </tr>",
    :post => "    </table></pre>"}
}
