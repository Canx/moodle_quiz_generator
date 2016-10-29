#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica cual es la máscara por defecto de la siguiente red.
# 192.168.0.0   {255.255.255.0}
# 172.16.0.0    {255.255.0.0}
# 10.0.0.0      {255.0.0.0}

require './lib/genpreg.rb'

pregunta = {
    :titulo => "Máscara por defecto",
    :descripcion => "Indica cual es la máscara por defecto de las siguientes redes",
    :tipo => :gift,
    :ipgen => {
                 {class: "A", default: true} => 4,
                 {class: "B", default: true} => 4,
                 {class: "C", default: true} => 4 
              },
    
    :codigo => lambda { |params|
       ip = IPGen.new(params).get()
       return " =#{ip.network.to_s.split("/")[0]} -> #{ip.netmask}"
    }
}

generar_pregunta(pregunta)
