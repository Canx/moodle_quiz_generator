question = {
  :type => :cloze,
  :name => "Direcciones inicial y final",
  :description => "Indica cual es la dirección de red, inicial, final y de broadcast de las siguientes ips:",
  :num => 10,
  :generators => {
    :ip => 
        { "ip" => {
                 {:class => "A", :mask => (1..29)} => 1,
                 {:class => "B", :mask => (2..29)} => 1,
                 {:class => "C", :mask => (3..29)} => 1
           }}
  },
  :answers => {
    :pre => "    <br /><pre>\n
    <table><tr><th>Dirección</th><th>Red</th><th>Dirección inicial</th><th>Dirección final</th><th>Dirección de broadcast</th>",
    :answer => "<tr>
                  <td><%= ip %></td>
                  <td>{1:SHORTANSWER:%100%<%= ip.network %>}</td>
                  <td>{1:SHORTANSWER:%100%<%= ip.initial %>}</td>
                  <td>{1:SHORTANSWER:%100%<%= ip.final %>}</td>
                  <td>{1:SHORTANSWER:%100%<%= ip.broadcast %>}</td>
                </tr>",
    :post => "    </table></pre>"}
}
