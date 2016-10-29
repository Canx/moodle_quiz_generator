#!/usr/bin/env ruby

require './lib/ipgen.rb'

# TODO: permitir generar tipos GIFT o CLOZE
# Pensar si hacer clases de generación o un if de momento...
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


def generar_pregunta(pregunta)
  output = "::#{pregunta[:titulo]}::#{pregunta[:descripcion]} {" 

  lista = []

  pregunta[:ipgen].each do |tipo,cantidad|
    (1..cantidad).each do |n|
      lista << tipo
    end
  end

  lista = lista.shuffle

  lista.each do |tipo|
      output = output + "\n" + pregunta[:codigo].call(tipo)
  end

  output = output + "\n}"

  puts output
end
