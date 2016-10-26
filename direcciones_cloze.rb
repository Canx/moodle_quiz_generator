#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica cual es la dirección inicial y final de las siguientes redes:
# 192.168.0.0/30 -> 255.255.255.252

# Modifica el número de preguntas de cada tipo
# primer parámetro: número de bits de máscara
# segundo parámetro: número de preguntas

# TODO: mejor cambiamos la pregunta a una de tipo cloze...

require 'ip'

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
Indica cual es la dirección inicial y final de las siguientes redes:
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


def response(bits_mascara)
  ip = IP.new("#{random_ip}/#{bits_mascara}")
  return "#{ip}<br />  Dirección inicial:{1:SHORTANSWER:%100%#{(ip.network(1)).to_s.split("/")[0]}}  Dirección final:{1:SHORTANSWER:%100%#{(ip.broadcast(-1)).to_s.split("/")[0]}}<br /><br />"

end

generate_question(preguntas)




