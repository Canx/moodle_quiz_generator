question = {
   :type => :matching,
   :name => "Número de hosts",
   :description => "Indica cuantos hosts podemos albergar en las siguientes redes",
   :generators => {
      :ip => {
         "ip" => {
              { mask: 16..30} => 8 }}
   },
   :answers => { :left => "Dirección de red <%= ip.to_s %>",
                 :right => "<%= ip.size - 2%>" }
  
}
