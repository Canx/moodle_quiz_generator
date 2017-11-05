question = {
  :type => :matching,
  :name => "Máscara por defecto",
  :description => "Indica cual es la máscara por defecto de las siguientes IP:",
  :generators => {
     :ip => {
         "ip" => {
                 {class: "A", default: true} => 4,
                 {class: "B", default: true} => 4,
                 {class: "C", default: true} => 4}}
  },
  :answers => {:left => "<%= ip.to_s.split('/')[0] %>",
              :right => "<%= ip.netmask %>" }
}
