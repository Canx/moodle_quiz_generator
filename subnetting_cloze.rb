#!/usr/bin/env ruby

require './lib/genpreg.rb'

pregunta = {
   :titulo => "Dividir en 2 subredes",
   :descripcion => "Dada la siguiente red divídela en 2 subredes iguales (Ejemplo: 192.168.0.0/24 -> 192.168.0.0/25 y 192.168.127.0/25):",
   :tipo => :xml,
   :ipgen => {
                 {:class => "C" } => 4,
                 {:class => "C", :default => false } => 4
             },

   :pre => "<br /><table><tr><th>Dirección de red</th><th>Primera subred</th><th>Segunda subred</th></tr>",
   :codigo => lambda { |params|
       ip = IPGen.new(params).get()
       return "<br /><tr><td>#{ip.to_s}</td><td>{1:SHORTANSWER:%100%#{ip.split[0].to_s}}</td><td>{1:SHORTANSWER:%100%#{ip.split[1].to_s}}</td></tr>"
   },

   :post => "</table>"
}

generar_pregunta(pregunta)
