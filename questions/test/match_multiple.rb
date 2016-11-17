question = {
   :type => :matching,
   :name => "Test generators ip random multiple",
   :description => "Test de pregunta con multiples generadores de diferentes tipos",
   :generators => { 
     :ip => { 
         "ip1" => {{:mask => 24} => 3 }},
     :random => { 
         "rnd1" => {{ :range => (1..100)} => 1, 
                    { :range => (200..300)} => 1,
                    {:range => (400..500)} => 1 },
         "rnd2" => {{ :range => (1..200)} => 3 }}
   },
   :answers => { :left => "Random1 <%= rnd1 %> Random2 <%= rnd2 %> IP<%= ip1.to_s %>",
                 :right => "Random1 <%= rnd1 %> Random2 <%= rnd2 %> IP<%= ip1.to_s %>" }
  
}
