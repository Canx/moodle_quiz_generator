#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica cual es la dirección de máscara de la siguiente red:
# 192.168.0.0/30 -> 255.255.255.252

# Modifica el número de preguntas de cada tipo
# primer parámetro: número de bits de máscara
# segundo parámetro: número de preguntas
require 'ip'

preguntas = { 8 => 4,
              16 => 4,
              24 => 4,
              26 => 4
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

def random_ip()
  gen = Random.new
  return "#{gen.rand(0..255)}.#{gen.rand(0..255)}.#{gen.rand(0..255)}.#{gen.rand(0..255)}"
end

def response(bits_mascara)
  ip = IP.new("#{random_ip}/#{bits_mascara}")
  return "=Dirección de red #{ip} -> #{ip.netmask}"
end


generate_question(preguntas)





