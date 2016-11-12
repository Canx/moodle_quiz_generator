question = {
  :type => :cloze,
  :name => "Unidades de almacenamiento",
  :description => "Transforma las siguientes unidades de almacenamiento a la unidad de destino:",
  :generators => {
    :random => {
      :origin_size => {{ :range => (1..100), :multiplier => 1000 } => 4 },
      :origin_unit => {{ :elements => ["GB","MB"]} => 4 }},
    :code => {
      :result_unit => lambda { | params | return ["GB","MB","KB","B","b"].to_set.delete(params[:origin_unit]).to_a.sample  },
      :result_size => lambda { | params | 
                                  convert_hash = {["TB","GB"] => 1000, ["GB","MB"] => 1000, ["MB","KB"] => 1000, ["KB","B"] => 1000, ["B", "b"] => 8}
                                 
                                  generate_hash = lambda { |orig_hash|
                                     result_hash = orig_hash.clone

                                     # hacemos los inversos
                                     orig_hash.each do |pair, value|
                                       result_hash.merge!({[pair[1],pair[0]] => 1.to_f/value})
                                     end
                                     
                                     begin
                                       iterate_hash = result_hash.clone
                                       iterate_hash.each do |pair1, value1| 
                                          iterate_hash.each do |pair2, value2| 
                                            if pair1[0] == pair2[1]
                                              if !result_hash.key?([pair2[0],pair1[1]])
                                                result_hash.merge!({[pair2[0],pair1[1]] => value1*value2 })
                                              end
                                            end
       
                                          end
                                       end
                                     end while result_hash.length != iterate_hash.length 

                                     return result_hash
                                  }

                                  convert_hash = generate_hash[convert_hash]

                                    
                                  if convert_hash.key?([params[:origin_unit], params[:result_unit]])
                                    return params[:origin_size]*convert_hash[[params[:origin_unit], params[:result_unit]]]
                                  else
                                    raise "Conversion '#{params[:origin_unit]} to #{params[:result_unit]}' not found in convert_hash"
                                  end

                          }
   }},
   :answers => { 
       :pre => "<table><tr><th>Unidad original</th><th>Unidad de destino</th></tr>",
       :answer => "<tr><td><%= origin_size %> <%= origin_unit %></td><td>{1:NUMERICAL:=<%= result_size %>:0.1} <%= result_unit %></td></tr>",
       :post => "</table>"
   }
}
