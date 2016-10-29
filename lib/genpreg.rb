#!/usr/bin/env ruby

require './lib/ipgen.rb'

def generar_pregunta(pregunta)
  puts "::#{pregunta[:titulo]}::#{pregunta[:descripcion]} {" 

  pregunta[:ipgen].each do |tipo_ip,cantidad|
    (1..cantidad).each do |n|
      puts pregunta[:codigo].call(tipo_ip)
    end
  end

  puts "}"
end
