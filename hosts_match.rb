#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica cuantos hosts podemos albergar en la siguiente red:
# 192.168.0.0/24 -> 254

# Modifica el número de preguntas de cada tipo
# primer parámetro: número de bits de máscara
# segundo parámetro: número de preguntas

# TODO: mejor cambiamos la pregunta a una de tipo cloze para que se puedan escribir los números...

require 'ipaddr'

preguntas = { 
               4 => 1,
               8 => 1,
              10 => 1,
              16 => 1,
              24 => 1,
              26 => 1 
            }


def generate_question(preguntas = {})
  puts "::Número de hosts:: Indica cuantos hosts podemos albergar en las siguientes redes {" 
  
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

def cidr_to_netmask(cidr)
  IPAddr.new('255.255.255.255').mask(cidr).to_s
end

def ip_network(ip, bits_mascara)
  IPAddr.new(ip).mask(bits_mascara).to_s
end

def hosts(bits_mascara)
  2**(32-bits_mascara)-2
end

def response(bits_mascara) 
  return "=Dirección de red #{ip_network(random_ip, bits_mascara)}/#{bits_mascara} -> #{hosts(bits_mascara)}"
end


generate_question(preguntas)





