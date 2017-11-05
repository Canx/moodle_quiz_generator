question = {
  :type => :cloze,
  :name => "Dirección/mascara. Red y host",
  :description => "Dadas las siguientes direcciones de red y su número de máscara, indica cual es la dirección de red y la dirección de host:",
  :generators => {
    :ip => {
      "ip" => { {class: ["A","B","C"], default: true} => 1}
  }},
  :answers => {
    :pre => "    <br />\n
    <table><tr><th>Dirección/máscara</th><th>Dirección de red</th><th>Dirección de host</th>",
    :answer => "<tr>
                  <td><%= ip %></td>
                  <td>{1:SHORTANSWER:%100%<%= ip.network %>}</td>
                  <td>{1:SHORTANSWER:%100%<%= ip.host %>}</td>
                </tr>",
    :post => "    </table>"
  }
}

