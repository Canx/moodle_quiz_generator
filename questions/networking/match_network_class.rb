question = {
   :type => :matching,
   :name => "Clases de subredes",
   :description => "Empareja cada IP con su clase",
   :generators => { 
      :ip => {
         "ip" => {
             {class: "A", default: true, private: true} => 2,
             {class: "A", default: true, private: false} => 2,
             {class: "B", default: true, private: true} => 2,
             {class: "B", default: true, private: false} => 2,
             {class: "C", default: true, private: true} => 2,
             {class: "C", default: true, private: false} => 2}}
   },

   :answers => { :left => "<%= ip.to_s%>",
                 :right => "clase <%='privada ' if ip.private_ip%><%= ip.class_ip%>" }
}
