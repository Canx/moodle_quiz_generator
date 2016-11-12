Instrucciones de uso
--------------------
Script para generación automática de preguntas en Moodle.
La salida se puede importar en formato XML en Moodle.

Requisitos
----------

Instalar ruby (2.0 recomendado):

```
$ sudo apt-get install ruby2.0
```

Instala las dependencias (ruby-ip y builder)

```
$ gem install bundler
$ bundle install
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
  :generators => {
     :ip => {
        "ip" => {
                 {class: "A", private: true, default: true} => 4,
                 {class: "B", private: false, default: false} => 4,
                 {class: "C", private: true, default: false} => 4,
                 {class: "C", private: false, default: false} => 4}}
  },
  :answers => { :left => "Dirección de red <%= ip.to_s %>",
                :right => "<%= ip.netmask %>" }
}
```

De momento solo están implementados los tipos :matching (emparejar) y :cloze (pregunta cloze).

En :generators indicamos los generadores de valores. Cada generador de valores estará asociado a 1 o más variables que podrán ser utilizadas en :answers

Es posible utilizar dos tipos de generadores:

 * ip (:ip)

   Permite generar diferentes tipos de ips, por tipo (A,B,C...), restringir si es privada o no, si tiene máscara por defecto, indicar la máscara,...)

 * random (:random)
   
   Permite generar números aleatorios en un rango, y añadiendole un multiplicador opcional


Generador IP
------------

Le pasamos varios hashes que representan formas de generar ips. Por ejemplo:

```
:generators => {
  :ip => { "ip1" =>
           { {class: "A", private: true, default: true} => 4,
             {class: "B", private: false, mask: 20} => 1,
             {class: "C", private: true, default: false} => 4,
             {class: "C", private: false, default: false} => 4 } } }
```

Crearía 13 ips diferentes (4+1+4+4), cada una de un tipo:
   * 4 ips de clase A privadas con máscara por defecto.
   * 1 ip de clase B con máscara 20.
   * 4 ips de clase C privadas con máscara aleatoria.
   * 4 ips de clase C con máscara aleatoria.

Luego podremos usar la variable "ip1" en :answers.

Mira el archivo lib/ip_generator para más info.

Generador Random
----------------
Le pasamos el rango (:range) y un multiplicador opcional (:multiplier). Por ejemplo:

```
:generators => { :random => { "dado" =>  {  {:range => (1..6)} => 4 } } }
```
                
Crearía un generador de un dado de 6 caras, que podría generar 4 tiradas diferentes. La variable dado podría ser utilizada en :answers.

Mira el archivo lib/random_generator.rb para maś info.

Preguntas
---------

* Matching (:matching)

En :answers hay que seguir la siguiente estructura de hash:

:answers => { :left => "", :right => "" }

Es posible (y recomendable) utilizar bloques erb que referencien a las variables generadas, por ejemplo:

:answers => { :left => "IP: <%= ip1.to_s %>", :right =>> "MASCARA: <%= ip.netmask %>"  }

* Cloze (:cloze)

Este tipo es mucho más genérico y debes conocer la [sintaxis de una pregunta cloze]: https://docs.moodle.org/31/en/Embedded_Answers_(Cloze)_question_type

Se debe escribir las respuestas generadas dentro de answer, y también se deben utilizar bloques ERB. Además, se puede usar HTML.

En este casos se pueden utilizar los hashes :pre y :post para indicar texto que no se repetirá para cada bloque de valores generados. Por ejemplo:

```
:answers => {
               :pre => "<table>....",
               :answer => "..."
               :post => "</table>"
```

En la carpeta 'questions' puedes ver ejemplos de preguntas.
