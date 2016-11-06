#!/usr/bin/env ruby

# genquiz: genera preguntas importables desde Moodle (XML)

# USO: genquiz <ficheros de preguntas hash>

# TODO: leer ficheros pasados como parámetros

# TODO: crear estructura de archivos

require './lib/quiz.rb'

quiz = Quiz.new()

# TODO: si no se le pasan parámetros lee todos los archivos del directorio questions y muestra una descripción de cada uno
ARGV.each do |file|
  question = eval(File.open(file).read)
  quiz.add(question)
end

puts quiz
