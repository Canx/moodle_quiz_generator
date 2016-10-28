#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica de que clase es la siguiente red:
# 192.168.1.0/24    {Clase privada C}
# 10.0.0.1  {Clase B}

require './lib/ipgen.rb'

# Modifica el número de preguntas de cada tipo
preguntas = {{class: "A", default: true} => 1,
             {class: "B", default: true} => 1,
             {class: "C", default: true} => 1,
             {class: "D", default: true} => 1,
             {class: "A", private: true} => 2,
             {class: "B", private: true} => 2,
             {class: "C", private: true, default: true} => 2}


def generate_question(preguntas = {})
  puts "::Clases de subredes:: Empareja cada IP con su clase {" 
  
  preguntas.each do |tipo,cantidad|
    (1..cantidad).each do |n|
      puts response(tipo)
    end
  end
 
  puts "}"
end

def response(params) 
  ip = IPGen.new(params).get()
  return " =#{ip} -> clase #{"privada " if params[:private]}#{params[:class]}"
end


generate_question(preguntas)





