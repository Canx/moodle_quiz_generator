question = {
  :type => :cloze,
  :name => "Máscara a binario",
  :description => "Traduce a binario las siguientes máscaras de red:",
  :generator => :ip,
  :ip => {
           {:mask => 28} => 1,
           {:mask => 27} => 1,
           {:mask => 26} => 1,
           {:mask => 25} => 1,
           {:mask => 24} => 1,
           {:mask => 23} => 1,
           {:mask => 22} => 1,
           {:mask => 21} => 1,
           {:mask => 20} => 1,
           {:mask => 19} => 1,
           {:mask => 18} => 1,
           {:mask => 17} => 1,
           {:mask => 16} => 1,
           {:mask => 15} => 1,
           {:mask => 14} => 1,
           {:mask => 13} => 1,
           {:mask => 12} => 1,
           {:mask => 11} => 1,
           {:mask => 10} => 1,
           {:mask => 9} => 1,
           {:mask => 8} => 1
                   },
  :answers => {
    :pre => "<br /><table><tr><th>Máscara</th><th>Binario</th><th>CIDR</th></tr>
             <td>255.255.255.0</td><td>11111111.11111111.11111111.00000000</td><td>24</td>",
    :answer => "<tr>
                   <td><%= ip.netmask %></td>
                   <td>{1:SHORTANSWER:%100%<%= ip.to_bin(ip.netmask.to_s)[0] %>}.{1:SHORTANSWER:%100%<%= ip.to_bin(ip.netmask.to_s)[1] %>}.{1:SHORTANSWER:%100%<%= ip.to_bin(ip.netmask.to_s)[2] %>}.{1:SHORTANSWER:%100%<%= ip.to_bin(ip.netmask.to_s)[3] %>}</td>
                  <td>{1:SHORTANSWER:%100%<%= ip.pfxlen %>}</td>
                </tr>",
    :post => "</table>"
  }
}

# <td>{1:SHORTANSWER:%100%<%= ip.class_ip %>}</td>
