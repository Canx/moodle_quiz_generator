question = {
  :type => :cloze,
  :name => "Unidades de velocidad",
  :description => "Indica cuanto tiempo en segundos tardarías en descargar los siguientes archivos, dada la velocidad de descarga indicada:",
  :generators => {
    :random => {
      :file_size => {{ :range => (5..2000) } => 1},
      :speed =>     {{ :elements => [6,12,20,50,100] } => 1}
    }
  },
  :answers => {
    :pre => "<table><tr><th>Archivo (MiB)</th><th>Velocidad descarga (Mbps)</th><th>Tiempo de descarga (s)</th>",
    :answer => "<tr><td><%= file_size %></td><td><%= speed %></td><td>{1:NUMERICAL:=<%= ((file_size*1024*1024*8)/(1000*1000)).fdiv(speed) %>:0.1}</td></tr>",
    :post => "</table>"
  }
}
