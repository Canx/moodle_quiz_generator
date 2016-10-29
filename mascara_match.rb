#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica cual es la dirección de máscara de la siguiente red:
# 192.168.0.0/30 -> 255.255.255.252

# Modifica el número de preguntas de cada tipo
# primer parámetro: número de bits de máscara
# segundo parámetro: número de preguntas
require './lib/genpreg.rb'

pregunta = {
    :titulo => "Dirección de máscara",
    :descripcion => "Indica cual es la dirección de máscara de red de las siguientes redes",
    :tipo => :gift,
    :ipgen => {
                 {class: "A", private: true, default: true} => 4,
                 {class: "B", private: false, default: false} => 4,
                 {class: "C", private: true, default: false} => 4,
                 {class: "C", private: false, default: false} => 4,
              },

    :codigo => lambda { |params|
       ip = IPGen.new(params).get()
       return "=Dirección de red #{ip} -> #{ip.netmask}"
    }
}

generar_pregunta(pregunta)
