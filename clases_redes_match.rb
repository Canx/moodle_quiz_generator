#!/usr/bin/env ruby

require './lib/genpreg.rb'

pregunta = {
   :titulo => "Clases de subredes",
   :descripcion => "Empareja cada IP con su clase",
   :tipo => :gift,
   :ipgen => { 
             {class: "A", default: true} => 1,
             {class: "B", default: true} => 1,
             {class: "C", default: true} => 1,
             {class: "D", default: true} => 1,
             {class: "A", private: true} => 2,
             {class: "B", private: true} => 2,
             {class: "C", private: true, default: true} => 2},

   :codigo => lambda { |params|
       ip = IPGen.new(params).get()
       return " =#{ip} -> clase #{"privada " if params[:private]}#{params[:class]}" 
   } 
}

generar_pregunta(pregunta)
