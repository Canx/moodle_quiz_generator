question = {
  :type => :cloze,
  :name => "Dividir en 2 subredes",
  :description => "Dada la siguiente red divídela en 2 subredes iguales utilizando el formato de máscara abreviado CIDR (Ejemplo: 192.168.0.0/24 -> 192.168.0.0/25 y 192.168.127.0/25):",
  :generators => {
     :ip => {
        "ip" => {
                 {:class => "C" } => 4,
                 {:class => "C", :default => false } => 4 }}
  },
  :answers => {
    :pre => "<br /><table><tr><th>Dirección de red</th><th>Primera subred</th><th>Segunda subred</th></tr>",
    :answer => "<br /><tr>
                  <td><%= ip.network %></td>
                  <td>{1:SHORTANSWER:%100%<%= ip.split[0].to_s %>}</td>
                  <td>{1:SHORTANSWER:%100%<%= ip.split[1].to_s %>}</td></tr>",
    :post => "</table>"
  }
}
