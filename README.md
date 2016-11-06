Instrucciones de uso
--------------------
Script para generación automática de preguntas en Moodle.
La salida se puede importar en formato XML en Moodle.

Requisitos
----------

Instala 'ruby-ip' y 'builder':

```
# gem install ruby-ip
# gem install builder
```

Utilización
-----------

Ejecuta el script 'genpreg.rb' pasándole como parámetro 1 o varios archivos de pregunta, como los que encontrarás en la carpeta '/questions'

```
$ ./genpreg.rb q1.rb
$ ./genpreg.rb q1.rb q2.rb
$ ./genpreg.rb ./questions/* 
```

El comando generará por pantalla la salida en xml de la pregunta. Para guardar la pregunta redirígela a una archivo:

```
$ ./genpreg.rb q1.rb > q1.xml
```

Estructura de una pregunta
--------------------------

Cada pregunta se estructura como una hash de ruby. Por ejemplo:

```
question = {
  :type => :matching,
  :name => "Dirección de máscara",
  :description => "Indica cual es la dirección de máscara de red de las siguientes redes",
  :generator => :ip,
  :ip => {
                 {class: "A", private: true, default: true} => 4,
                 {class: "B", private: false, default: false} => 4,
                 {class: "C", private: true, default: false} => 4,
                 {class: "C", private: false, default: false} => 4,
         },
  :answers => { :left => "Dirección de red <%= ip.to_s %>",
                :right => "<%= ip.netmask %>" }
}
```

De momento solo están implementados los tipos :matching y :cloze. Observa los ejemplos y el código para ver como funcionan.

De momento solo existe un tipo de generador de preguntas, que es :ip

Generador IP
------------

Le pasamos varios hashes que representan formas de generar ips.

Cada tipo es definido como un hash al que se le puede indicar la clase (class), si la ip será privada (private), si tendrá máscara por defecto (default) o si tendrá una máscara determinada (mask).

Como valor ponemos el número de ips de ese tipo que se van a generar

Preguntas realizadas
--------------------
* cloze_addresses.rb
* cloze_subnetting.rb
* cloze_ip2bin.rb
* match_hosts.rb
* match_network_mask.rb
* match_default_mask.rb
* match_network_class.rb
