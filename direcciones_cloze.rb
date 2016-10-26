#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica cual es la dirección inicial y final de las siguientes redes:
# 192.168.0.0/30 -> 255.255.255.252

# Modifica el número de preguntas de cada tipo
# primer parámetro: número de bits de máscara
# segundo parámetro: número de preguntas

# TODO: mejor cambiamos la pregunta a una de tipo cloze...

require 'ipaddr'

preguntas = { 28 => 4,
              16 => 4,
              24 => 4,
              26 => 4 
            }


$xml = '''<?xml version="1.0" encoding="UTF-8"?>
<quiz>
<question type="cloze"><name><text>Direcciones inicial y final</text></name><questiontext format="html"><text>
<![CDATA[*]]>
</text>
</questiontext>
<generalfeedback format="html">
<text/>
</generalfeedback><penalty>0.3333333</penalty><hidden>0</hidden>
</question>
</quiz>
'''

$question = '''
::Direcciones inicial y final:: Indica cual es la dirección inicial y final de las siguientes redes:
<br /><br />
'''

def generate_question(preguntas = {})
 #puts "::Direccion de mascara:: DadoIndica cual es la dirección de máscara de red de las siguientes redes {" 
  
  # En close hay que cambiar para que sea aleatorio.
  # Elegimos aleatoriamente un hash y le restamos un número. Si el número es 0 borramos el hash.
  # Continuamos haciendolo hasta que no hayam entradas en el hash.
  
  
  lista = []
  # reordenamos
  preguntas.each do |tipo,cantidad|
    (1..cantidad).each do |n|
      lista << tipo
    end
  end

  lista = lista.shuffle

  lista.each do |tipo|
      $question = $question + response(tipo)
  end

  # procesamos el array
  $xml= $xml.sub! '*', $question
  puts $xml
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

def ip_inicial(ip, bits_mascara)
  IPAddr.new(ip).mask(bits_mascara).succ().to_s
end

def ip_final(ip, bits_mascara)
  net = IPAddr.new("#{ip}/#{bits_mascara}")
  IPAddr.new(net.to_range().last().to_i - 1, 2).to_s

end

def response(bits_mascara) 
  ip = random_ip
  network = ip_network(ip, bits_mascara)
  inicial = ip_inicial(ip, bits_mascara)
  final = ip_final(ip, bits_mascara)
  #puts "#{ip} #{bits_mascara} #{network} #{inicial} #{final}"
  return "#{network}/#{bits_mascara}  Dirección inicial:{1:SHORTANSWER:%100%#{inicial}} Dirección final:{1:SHORTANSWER:%100%#{final}}<br /><br />"
end


generate_question(preguntas)




