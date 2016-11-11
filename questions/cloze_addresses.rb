question = {
  :type => :cloze,
  :name => "Subnetting, red más adecuada",
  :description => "Indica cual es la dirección inicial y final de las siguientes redes:",
  :num => 1,
  :generators => {
    :ip => {
       "ip" => {
               {mask: 28} => 1,
               {mask: 16} => 1,
               {mask: 24} => 1,
               {mask: 26} => 1 }}
  },
  :answers => {
    :pre => "    <br /><pre>\n
    <table><tr><th>Hosts</th><th>Dirección en rango</th><th>Máscara necesaria</th><th>Dirección de red</th><th>Ip inicial red</th><th>Ip final</th>",
    :answer => "<tr>
                  <td><%= ip.size - 2 %> hosts</td>
                  <td><%= ip.to_s %></td>
                  <td>{1:SHORTANSWER:%100%#<%= ip.mask %>}</td>
                  <td>{1:SHORTANSWER:%100%#<%= ip.initial %>}</td>
                  <td>{1:SHORTANSWER:%100%#<%= ip.final %>}</td>
                </tr>",
    :post => "    </table></pre>"}
}
