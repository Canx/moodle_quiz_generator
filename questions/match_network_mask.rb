question = {
  :type => :matching,
  :name => "Dirección de máscara",
  :description => "Indica cual es la dirección de máscara de red de las siguientes redes",
  :generator => :ip,
  :ip => {
                 {class: "A", private: true, default: true} => 4,
                 {class: "B", private: false, default: false} => 4,
                 {class: "C", private: true, default: false} => 4,
                 {class: "C", private: false, default: false} => 4,
         },
  :answers => { :left => "Dirección de red <%= ip.to_s %>",
                :right => "<%= ip.netmask %>" }
}
