question = {
  :type => :cloze,
  :name => "Dirección/mascara. Red y host",
  :description => "Dadas las siguientes direcciones de red y su número de máscara, indica cual es la dirección de red y la dirección de host:",
  :num => 1,
  :generators => {
    :ip => {
      "ip" => {
              {mask: 8} => 2,
              {mask: 16} => 2,
              {mask: 24} => 2}
  }},
  :answers => {
    :pre => "    <br />\n
    <table><tr><th>Dirección/máscara</th><th>Dirección de red</th><th>Dirección de host</th>",
    :answer => "<tr>
                  <td><%= ip %></td>
                  <td>{1:SHORTANSWER:%100%<%= ip.network %>}</td>
                  <td>{1:SHORTANSWER:%100%<%= ip.host %>}</td> # TODO: host method is not implemented!!
                </tr>",
    :post => "    </table>"
  }
}

