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
                        {1:SHORTANSWER:%100%<%= ip.to_bin[3] %>}</td></tr>
                <tr><td>Máscara en binario:</td>
                    <td>{1:SHORTANSWER:%100%<%= ip.netmask.to_bin[0] %>}.
                        {1:SHORTANSWER:%100%<%= ip.netmask.to_bin[1] %>}.
                        {1:SHORTANSWER:%100%<%= ip.netmask.to_bin[2] %>}.
                        {1:SHORTANSWER:%100%<%= ip.netmask.to_bin[3] %>}</td></tr>
                <tr><td>Dirección de red en binario:</td>
                    <td>{1:SHORTANSWER:%100%<%= ip.network.to_bin[0] %>}.
                        {1:SHORTANSWER:%100%<%= ip.network.to_bin[1] %>}.
                        {1:SHORTANSWER:%100%<%= ip.network.to_bin[2] %>}.
                        {1:SHORTANSWER:%100%<%= ip.network.to_bin[3] %>}</td></tr>
               <tr><td>Dirección de broadcast en binario:</td>
                    <td>{1:SHORTANSWER:%100%<%= ip.broadcast.to_bin[0] %>}.
                        {1:SHORTANSWER:%100%<%= ip.broadcast.to_bin[1] %>}.
                        {1:SHORTANSWER:%100%<%= ip.broadcast.to_bin[2] %>}.
                        {1:SHORTANSWER:%100%<%= ip.broadcast.to_bin[3] %>}</td></tr>
                <tr><td>Dirección de red decimal (CIDR):</td>
                    <td>{1:SHORTANSWER:%100%<%= ip.network %>}</td></tr>
                 <tr><td>Dirección de broadcast decimal (CIDR):</td>
                    <td>{1:SHORTANSWER:%100%<%= ip.broadcast %>}</td></tr>",
    :post => "</table>"
  }
}

# <td>{1:SHORTANSWER:%100%<%= ip.class_ip %>}</td>
