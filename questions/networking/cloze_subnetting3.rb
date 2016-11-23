question = {
  :type => :cloze,
  :name => "Dividir en subredes y datos",
  :num => 10,
  :generators => {
    :ip => {
      "ip1" => { {mask: (8..24)} => 1 }
    },
    :code => {
      "subnets" => lambda { |params| return params["ip1"].divide_by_subnets(3) }
    }
  },
  :answers => {
    :pre => "<p>Dada la red <%= ip1.network.to_s %> divídela en 4 subredes, indicando los datos de las subredes (NOTA: Indica la máscara en formato abreviado CIDR en todas las IPs):</p>
<table>
  <tr><th>Subred CIDR</th><th>Primera ip</th><th>Última ip</th><th>Dirección de broadcast</th></tr>",
    :answer => "
  <tr><td>1. {1:SHORTANSWER:%100%<%= subnets[0].to_s %>}</td><td>{1:SHORTANSWER:%100%<%= subnets[0].initial %>}</td><td>{1:SHORTANSWER:%100%<%= subnets[0].final %>}</td><td>{1:SHORTANSWER:%100%<%= subnets[0].broadcast %>}</td></tr>
  <tr><td>1. {1:SHORTANSWER:%100%<%= subnets[1].to_s %>}</td><td>{1:SHORTANSWER:%100%<%= subnets[1].initial %>}</td><td>{1:SHORTANSWER:%100%<%= subnets[1].final %>}</td><td>{1:SHORTANSWER:%100%<%= subnets[1].broadcast %>}</td></tr>
  <tr><td>1. {1:SHORTANSWER:%100%<%= subnets[2].to_s %>}</td><td>{1:SHORTANSWER:%100%<%= subnets[2].initial %>}</td><td>{1:SHORTANSWER:%100%<%= subnets[2].final %>}</td><td>{1:SHORTANSWER:%100%<%= subnets[2].broadcast %>}</td></tr>
  <tr><td>1. {1:SHORTANSWER:%100%<%= subnets[3].to_s %>}</td><td>{1:SHORTANSWER:%100%<%= subnets[3].initial %>}</td><td>{1:SHORTANSWER:%100%<%= subnets[3].final %>}</td><td>{1:SHORTANSWER:%100%<%= subnets[3].broadcast %>}</td></tr>
",
    :post => "</table>"
  }
}
