question = {
   :type => :matching,
   :name => "Número de hosts",
   :description => "Indica cuantos hosts podemos albergar en las siguientes redes",
   :vars => {
     "ip" => { :ip => { { mask: 16} => 1, {mask: 24} => 1, { mask: 26} => 1}}
   },
   :answers => { :left => "Dirección de red <%= ip.to_s %>",
                 :right => "<%= ip.size - 2%>" }
  
}
