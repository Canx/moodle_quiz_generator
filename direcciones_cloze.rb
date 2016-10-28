#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica cual es la dirección inicial y final de las siguientes redes:
# 192.168.0.0/30 -> 255.255.255.252

# Modifica el número de preguntas de cada tipo
# primer parámetro: número de bits de máscara
# segundo parámetro: número de preguntas

# TODO: mejor cambiamos la pregunta a una de tipo cloze...

require './lib/ipgen.rb'

preguntas = { {mask: 28} => 4,
              {mask: 16} => 4,
              {mask: 24} => 4,
              {mask: 26} => 4 
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
  lista = []

  preguntas.each do |tipo,cantidad|
    (1..cantidad).each do |n|
      lista << tipo
    end
  end

  lista = lista.shuffle

  lista.each do |tipo|
      $question = $question + response(tipo)
  end

  $xml= $xml.sub! '*', $question
  puts $xml
end 

def response(params)
  ip = IPGen.new(params).get()
  return "#{ip.network}<br />  Dirección inicial:{1:SHORTANSWER:%100%#{(ip.network(1)).to_s.split("/")[0]}}  Dirección final:{1:SHORTANSWER:%100%#{(ip.broadcast(-1)).to_s.split("/")[0]}}<br /><br />"

end

generate_question(preguntas)
