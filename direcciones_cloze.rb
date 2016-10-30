#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica cual es la dirección inicial y final de las siguientes redes:
# 192.168.0.0/30 -> 255.255.255.252

# Modifica el número de preguntas de cada tipo
# primer parámetro: número de bits de máscara
# segundo parámetro: número de preguntas

# TODO: mejor cambiamos la pregunta a una de tipo cloze...

require './lib/genpreg.rb'

pregunta = {
    :titulo => "Direcciones inicial y final",
    :descripcion => "Indica cual es la dirección inicial y final de las siguientes redes:",
    :tipo => :xml,
    :ipgen => {
                 {mask: 28} => 4,
                 {mask: 16} => 4,
                 {mask: 24} => 4,
                 {mask: 26} => 4 
            },
    
    :pre => "<br />\n<table><tr><th>Direcciones</th><th>Dirección inicial</th><th>Dirección final</th>",
    :codigo => lambda { |params|
       ip = IPGen.new(params).get()
       return "\n<tr>
  <td>#{ip.network}</td><td>{1:SHORTANSWER:%100%#{(ip.network(1)).to_s.split("/")[0]}}</td>
  <td>{1:SHORTANSWER:%100%#{(ip.broadcast(-1)).to_s.split("/")[0]}}</td>
</tr>"
    },
    :post => "</table>"
}
     
generar_pregunta(pregunta)
