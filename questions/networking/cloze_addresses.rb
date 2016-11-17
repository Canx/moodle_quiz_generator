question = {
  :type => :cloze,
  :name => "Información de la red",
  :description => "Indica cual es la dirección inicial y final de las siguientes redes:",
  :num => 1,
  :generators => {
    :ip => {
       "ip" => { {:mask => (16..28)} => 4}}
  },
  :answers => {
    :pre => "    <br /><pre>\n
    <table><tr><th>Dirección IP</th><th>Hosts</th><th>Máscara</th><th>Ip inicial</th><th>Ip final</th>",
    :answer => "<tr>
                  <td><%= ip.to_s %></td>
                  <td>{1:SHORTANSWER:%100%<%= ip.size - 2 %>} hosts</td>
                  <td>{1:SHORTANSWER:%100%<%= ip.netmask %>}</td>
                  <td>{1:SHORTANSWER:%100%<%= ip.initial %>}</td>
                  <td>{1:SHORTANSWER:%100%<%= ip.final %>}</td>
                </tr>",
    :post => "    </table></pre>"}
}
