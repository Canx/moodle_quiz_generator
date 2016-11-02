#!/usr/bin/env ruby

require './lib/genpreg.rb'

pregunta = {
   :titulo => "Clases de subredes",
   :descripcion => "Empareja cada IP con su clase",
   :tipo => :gift,
   :ipgen => { 
             #{class: "A", default: true} => 1,
             #{class: "B", default: true} => 1,
             {class: "C", default: true, private: true} => 5,
             {class: "C", default: true, private: false} => 5,
             #{class: "A", private: false} => 2,
             #{class: "B", private: false} => 2,
             #{class: "C", private: false, default: true} => 2,
             #{class: "localhost" }=> 1
             },

   :codigo => lambda { |params|
       ip = IPGen.new(params).get()
       return " =#{ip} -> clase #{"privada " if params[:private]}#{params[:class]}" 
   } 
}

generar_pregunta(pregunta)
