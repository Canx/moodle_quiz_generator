question = {
  :type => :cloze,
  :name => "Máscara a binario",
  :description => "Traduce a binario las siguientes máscaras de red:",
  :generators => { 
     :ip => {
       "ip" => {
           {:mask => (8..28)} => 1}}
  },
  :answers => {
    :pre => "<br /><table><tr><th>Máscara</th><th>Binario</th><th>CIDR</th></tr>
             <td>255.255.255.0</td><td>11111111.11111111.11111111.00000000</td><td>24</td>",
    :answer => "<tr>
                   <td><%= ip.netmask %></td>
                   <td>{1:SHORTANSWER:%100%<%= ip.netmask.to_bin[0] %>}.
                       {1:SHORTANSWER:%100%<%= ip.netmask.to_bin[1] %>}.
                       {1:SHORTANSWER:%100%<%= ip.netmask.to_bin[2] %>}.
                       {1:SHORTANSWER:%100%<%= ip.netmask.to_bin[3] %>}</td>
                  <td>{1:SHORTANSWER:%100%<%= ip.pfxlen %>}</td>
                </tr>",
    :post => "</table>"
  }
}

# <td>{1:SHORTANSWER:%100%<%= ip.class_ip %>}</td>
