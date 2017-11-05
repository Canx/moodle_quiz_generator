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
                                  conversion_hash = {["TB","GB"] => 1024, ["GB","MB"] => 1024, ["MB","KB"] => 1024, ["KB","B"] => 1024, ["B", "b"] => 8}
                                  return CodeGenerator.to_unit(params[:origin_size], params[:origin_unit], params[:result_unit], conversion_hash)
                          }
   }},
   :answers => { 
       :pre => "<table><tr><th>Unidad original</th><th>Unidad de destino</th></tr>",
       :answer => "<tr><td><%= origin_size %> <%= origin_unit %></td><td>{1:NUMERICAL:=<%= result_size %>:0.1} <%= result_unit %></td></tr>",
       :post => "</table>"
   }
}
