#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica cuantos hosts podemos albergar en la siguiente red:
# 192.168.0.0/24 -> 254

# Modifica el número de preguntas de cada tipo
# primer parámetro: número de bits de máscara
# segundo parámetro: número de preguntas

# TODO: mejor cambiamos la pregunta a una de tipo cloze para que se puedan escribir los números...

require './lib/genpreg.rb'

pregunta = {
    :titulo => "Número de hosts",
    :descripcion => "Indica cuantos hosts podemos albergar en las siguientes redes",
    :tipo => :gift,
    :ipgen => {
              { mask: 16} => 1,
              { mask: 24} => 1},

    :codigo => lambda { |params|
       ip = IPGen.new(params).get()
       return "=Dirección de red #{ip.to_s} -> #{ip.size - 2}"
    }
}

generar_pregunta(pregunta)
