#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica cual es la máscara por defecto de la siguiente red.
# 192.168.0.0   {255.255.255.0}
# 172.16.0.0    {255.255.0.0}
# 10.0.0.0      {255.0.0.0}

require './lib/ipgen.rb'

# Modifica el número de preguntas de cada tipo
preguntas = {{class: "A", default: true} => 4,
             {class: "B", default: true} => 4,
             {class: "C", default: true} => 4 
            }

def generate_question(preguntas = {})
  puts "::Máscara por defecto:: Indica cual es la máscara por defecto de las siguientes redes {" 
  
  preguntas.each do |tipo,cantidad|
    (1..cantidad).each do |n|
      puts response(tipo)
    end
  end
 
  puts "}"
end

def response(params) 
  ip = IPGen.new(params).get()
  return " =#{ip.network.to_s.split("/")[0]} -> #{ip.netmask}"
end

generate_question(preguntas)
