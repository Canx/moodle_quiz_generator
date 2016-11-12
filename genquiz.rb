#!/usr/bin/env ruby

# genquiz: genera preguntas importables desde Moodle (XML)

# USO: genquiz <ficheros de preguntas hash>

# TODO: leer ficheros pasados como parámetros

# TODO: crear estructura de archivos

require 'rubygems'
require 'bundler/setup'

require './lib/quiz.rb'

quiz = Quiz.new()

# TODO: si no se le pasan parámetros lee todos los archivos del directorio questions y muestra una descripción de cada uno

if ARGV.length == 0 then
  puts "USO:"
  puts "  genquiz [lista de archivos de preguntas] > cuestionario.xml"
  puts "Ejemplos:"
  puts "  genquiz questions/cloze_addresses.rb > pregunta.xml"
  puts "  genquiz questions/* > cuestionario.xml"
  exit
end

begin
  ARGV.each do |file|
    question = eval(File.open(file).read)
    quiz.add(question)
  end
rescue Exception => e
  puts "Error: #{e.message}"
  puts e.backtrace
  exit
end

puts quiz
