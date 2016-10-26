#!/usr/bin/env ruby

# Generamos por salida estandar preguntas de emparejamiento GIFT del tipo
# Indica cual es la máscara por defecto de la siguiente red.
# 192.168.0.0   {255.255.255.0}
# 172.16.0.0    {255.255.0.0}
# 10.0.0.0      {255.0.0.0}

# Modifica el número de preguntas de cada tipo
preguntas = {"255.0.0.0" => 1,
             "255.255.0.0" => 1,
             "255.255.255.0" => 1
            }


def generate_question(preguntas = {})
  puts "::Máscara por defecto:: Indica cual es la máscara por defecto de las siguientes redes {" 
  
  preguntas.each do |tipo,cantidad|
    (1..cantidad).each do |n|
      puts response(tipo)
    end
  end
 
  puts "}"
end

def response(mascara) 
  gen = Random.new

  case mascara 
    when "255.0.0.0" then
      number1 = gen.rand(1..126)
      number2 = gen.rand(0..254)
      number3 = gen.rand(0..254)
      number4 = gen.rand(0..254)
    when "255.255.0.0" then
      number1 = gen.rand(128..191)
      number2 = gen.rand(0..254)
      number3 = gen.rand(0..254)
      number4 = gen.rand(0..254)
    when "255.255.255.0" then
      number1 = gen.rand(192..223)
      number2 = gen.rand(0..254)
      number3 = gen.rand(0..254)
      number4 = gen.rand(0..254)
   end

   ip = "#{number1}.#{number2}.#{number3}.#{number4}"
  
  return " =#{ip} -> #{mascara}"
end


generate_question(preguntas)





