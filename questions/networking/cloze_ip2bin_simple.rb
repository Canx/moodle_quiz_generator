question = {
  :type => :cloze,
  :name => "Dirección a binario",
  :description => "Traduce a binario las siguientes direcciones junto con su máscara:",
  :generators => {
     :ip => {
       "ip" => { {:mask => (8..28)} => 1}

  }},
  :answers => {
    :pre => "<br /><table>",
    :answer => "<tr><td>Dirección ip:</td><td><%= ip %></td></tr>
                <tr><td>Dir. en binario:</td>
                    <td>{1:SHORTANSWER:%100%<%= ip.to_bin[0] %>}.
                        {1:SHORTANSWER:%100%<%= ip.to_bin[1] %>}.
                        {1:SHORTANSWER:%100%<%= ip.to_bin[2] %>}.
                        {1:SHORTANSWER:%100%<%= ip.to_bin[3] %>}</td></tr>",
    :post => "</table>"
  }
}

# <td>{1:SHORTANSWER:%100%<%= ip.class_ip %>}</td>
