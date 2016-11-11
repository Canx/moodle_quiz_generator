question = {
  :type => :cloze,
  :name => "Dirección a binario + mascara",
  :description => "Pasa las siguientes direcciones IP en binario a decimal, y indica la clase:",
  :generators => {
     :ip => {
       "ip" => { {:class => "A"} => 2,
           {:class => "B"} => 2,
           {:class => "C"} => 2,
           {:class => "D"} => 2}}
  },
  :answers => {
    :pre => "<br /><table><tr><th>Dirección en binario</th><th>Dirección</th><th>Clase (A,B, C o D)</th></tr>",
    :answer => "<tr>
                   <td><%= ip.to_bin[0] + '.' + ip.to_bin[1] + '.' + ip.to_bin[2] + '.' + ip.to_bin[3] %></td>
                   <td>{1:SHORTANSWER:%100%<%= ip.to_addr %>}</td>
                   <td>{1:MULTICHOICE:<%= '%100%' if ip.class_ip == 'A'%>A~<%= '%100%' if ip.class_ip == 'B'%>B~<%= '%100%' if ip.class_ip == 'C'%>C~<%= '%100%' if ip.class_ip == 'D'%>D}</td>
                </tr>",
    :post => "</table>"
  }
}

