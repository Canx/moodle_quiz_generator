#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica de que clase es la siguiente red:
# 192.168.1.0/24    {Clase privada C}
# 10.0.0.1  {Clase B}

# Modifica el número de preguntas de cada tipo
preguntas = {"A" => 1,
             "B" => 1,
             "C" => 1,
             "D" => 1,
             "privada A" => 2,
             "privada B" => 2,
             "privada C" => 2}


def generate_question(preguntas = {})
  puts "::Clases de subredes:: Empareja cada IP con su clase {" 
  
  preguntas.each do |tipo,cantidad|
    (1..cantidad).each do |n|
      puts response(tipo)
    end
  end
 
  puts "}"
end

def response(clase) 
  gen = Random.new

  case clase 
    when "privada A" then
      mascara = gen.rand(8..31)
      number1 = 10
      number2 = gen.rand(0..254)
      number3 = gen.rand(0..254)
      number4 = gen.rand(0..254)
    when "privada B" then
      mascara = gen.rand(12..31)
      number1 = 172
      number2 = gen.rand(16..31)
      number3 = gen.rand(0..254)
      number4 = gen.rand(0..254)
    when "privada C" then
      mascara = gen.rand(16..31)
      number1 = 192
      number2 = 168
      number3 = gen.rand(0..254)
      number4 = gen.rand(0..254)
    when "A" then
      mascara = gen.rand(1..8)
      number1 = gen.rand(1..126)
      number2 = gen.rand(0..254)
      number3 = gen.rand(0..254)
      number4 = gen.rand(0..254)
    when "B" then
      mascara = gen.rand(1..16)  
      number1 = gen.rand(128..191)
      number2 = gen.rand(0..254)
      number3 = gen.rand(0..254)
      number4 = gen.rand(0..254)
    when "C" then
      mascara = gen.rand(1..24)
      number1 = gen.rand(192..223)
      number2 = gen.rand(0..254)
      number3 = gen.rand(0..254)
      number4 = gen.rand(0..254)
    when "D" then
      mascara = 4
      number1 = gen.rand(224..239)
      number2 = gen.rand(0..254)
      number3 = gen.rand(0..254)
      number4 = gen.rand(0..254)
    when "E" then
      number1 = gen.rand(240..254)
      number2 = gen.rand(0..254)
      number3 = gen.rand(0..254)
      number4 = gen.rand(0..254)
   end

   ip = "#{number1}.#{number2}.#{number3}.#{number4}"
  
  return " =#{ip}/#{mascara} -> clase #{clase}"
end


generate_question(preguntas)





