#!/usr/bin/env ruby

# Completa en binario las siguientes direcciones IP, indicando además cual es su clase.
require './lib/genpreg.rb'

pregunta = {
   :titulo => "Dirección a binario + mascara",
   :descripcion => "Completa la traducción a binario de las siguientes IP's y indica su clase:",
   :tipo => :xml,
   :ipgen => { {:class => "A"} => 2,
               {:class => "B"} => 2,
               {:class => "C"} => 2,
               {:class => "D"} => 2 
             },
   
    :pre => "<br />\n<table><tr><th>Dirección</th><th>Dirección en binario</th><th>Clase (A,B, C o D)</th>",
    :codigo => lambda { |params|
       ip = IPGen.new(params).get()
       binary = ip.to_b.to_s.rjust(32, '0').scan(/.{0,8}/)
       clase = "A" if binary[0][0..0] == "0"
       clase = "B" if binary[0][0..1] == "10"
       clase = "C" if binary[0][0..2] == "110"
       clase = "D" if binary[0][0..3] == "1110"

       return "\n<tr>
  <td>#{ip}</td><td>{1:SHORTANSWER:%100%#{binary[0]}}.#{binary[1]}.#{binary[2]}.#{binary[3]}</td>
  <td>{1:SHORTANSWER:%100%#{clase}}</td>
</tr>"
    },
    :post => "</table>"
}

generar_pregunta(pregunta)
