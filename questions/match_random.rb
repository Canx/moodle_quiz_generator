question = {
   :type => :matching,
   :name => "Test random",
   :description => "Empareja los números iguales",
   :generator => :random,
   random: {
              { :range => (1..100)} => 1,
              { :range => (200..300)} => 1,
              { :range => (400..500)} => 1
   },
   :answers => { :left => "Random <%= random %>",
                 :right => "Random <%= random %>" }
  
}
