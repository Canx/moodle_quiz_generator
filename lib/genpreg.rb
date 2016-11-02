#!/usr/bin/env ruby

require './lib/ipgen.rb'

class PreguntaMoodle
  attr_accessor :pregunta
  @pregunta
  
  def initialize(pregunta)
    @pregunta = pregunta
  end 

  # Sobreescribir
  def before()

  end

  # Sobreescribir
  def after()
  
  end

  def generar_pregunta()
    output = self.before()
    output = output + (@pregunta[:pre] || "")
    output = output + self.questions()
    output = output + (@pregunta[:post] || "")
    ouput = output + self.after()
  end
  
  def questions() 
    lista = []
    output = ""
  
    @pregunta[:ipgen].each do |tipo,cantidad|
      (1..cantidad).each do |n|
        lista << tipo
      end
    end
  
    lista = lista.shuffle
 
    lista.each do |tipo|
        pregunta = @pregunta[:codigo].call(tipo)
        output = output + pregunta + "\n"
    end
    return output
  end
end

class PreguntaGIFT < PreguntaMoodle
  def before()
    "::#{pregunta[:titulo]}::#{pregunta[:descripcion]}{\n" 
  end

  def after()
    "}"
  end
end


class PreguntaXML < PreguntaMoodle
  def before()
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<quiz>
<question type=\"cloze\"><name><text>#{@pregunta[:titulo]}</text></name><questiontext format=\"html\"><text>
<![CDATA[#{@pregunta[:descripcion]}<br />"
  end

  def after()
    '''
]]>
</text>
</questiontext>
<generalfeedback format="html">
<text/>
</generalfeedback><penalty>0.3333333</penalty><hidden>0</hidden>
</question>
</quiz>
    '''
  end
end

def generar_pregunta(pregunta)
  case pregunta[:tipo]
    when :gift
      preguntaMoodle = PreguntaGIFT.new(pregunta)
    when :xml
      preguntaMoodle = PreguntaXML.new(pregunta)
  end
  
  puts preguntaMoodle.generar_pregunta()
end
