question = {
  :type => :cloze,
  :name => "Subnetting, red más adecuada",
  :description => "Dado el número de hosts que puede albergar la red y una ip aleatoria dentro de dicha red calcula a que dirección de red (en formato CIDR) pertenece la ip, así como la ip inicial y final de dicha red:",
  :num => 1,
  :generators => {
    :ip => {
      "ip" => {
              {mask: 28} => 1,
              {mask: 16} => 1,
              {mask: 24} => 1,
              {mask: 26} => 1}}
  },
  :answers => {
    :pre => "    <br />\n
    <table><tr><th>Hosts</th><th>Dirección en rango</th><th>Dirección de red</th><th>Ip inicial red</th><th>Ip final</th>",
    :answer => "<tr>
                  <td><%= ip.size - 2 %> hosts</td>
                  <td><%= ip.to_s.split('/')[0] %></td>
                  <td>{1:SHORTANSWER:%100%<%= ip.network %>}</td>
                  <td>{1:SHORTANSWER:%100%<%= ip.initial %>}</td>
                  <td>{1:SHORTANSWER:%100%<%= ip.final %>}</td>
                </tr>",
    :post => "    </table>"}
}
