#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica cual es la dirección de máscara de la siguiente red:
# 192.168.0.0/30 -> 255.255.255.252

# Modifica el número de preguntas de cada tipo
# primer parámetro: número de bits de máscara
# segundo parámetro: número de preguntas
require 'ipaddr'

preguntas = { 8 => 4,
              16 => 4,
              24 => 4,
              26 => 4
            }


def generate_question(preguntas = {})
  puts "::Direccion de mascara:: DadoIndica cual es la dirección de máscara de red de las siguientes redes {" 
  
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

def response(bits_mascara) 
  return "=Dirección de red #{ip_network(random_ip, bits_mascara)}/#{bits_mascara} -> #{cidr_to_netmask(bits_mascara)}"
end


generate_question(preguntas)





