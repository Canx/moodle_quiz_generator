#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica cual es la dirección de máscara de la siguiente red:
# 192.168.0.0/30 -> 255.255.255.252

# Modifica el número de preguntas de cada tipo
# primer parámetro: número de bits de máscara
# segundo parámetro: número de preguntas
require 'ip'
require './lib/ipgen.rb'

preguntas = { {class: "A", private: true, default: true} => 4,
              {class: "B", private: false, default: false} => 4,
              {class: "C", private: true, default: false} => 4,
              {class: "C", private: false, default: false} => 4,
              {} => 1
            }


def generate_question(preguntas = {})
  puts "::Direccion de mascara:: Indica cual es la dirección de máscara de red de las siguientes redes {" 
  
  preguntas.each do |tipo,cantidad|
    (1..cantidad).each do |n|
      puts response(tipo)
    end
  end
 
  puts "}"
end

def response(params)
  ipgen = IPGen.new(params)
  ip = ipgen.get() 
  return "=Dirección de red #{ip} -> #{ip.netmask}"
end

generate_question(preguntas)
