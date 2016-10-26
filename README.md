Instrucciones de uso
--------------------
Scripts de generación automática de preguntas de redes para Moodle.
La salida se puede importar en formato GIFT en Moodle.
Lee cada script para ver si se puede parametrizar.

Requisitos
----------

Instala 'ruby-ip':

```
# gem install ruby-ip
```

Preguntas realizadas
--------------------
* Clases de redes (clases_redes_match.rb). Formato GIFT

Indica de que clase de red son las siguientes redes:

192.168.0.0/24 -> clase privada C

* Máscara por defecto (mascara_defecto_match.rb). Formato GIFT

Indica cual es la dirección de máscara por defecto de las siguientes redes:

192.168.0.0 -> 255.255.255.0

* Máscara (mascara_match.rb). Formato GIFT

Indica cual es la dirección de máscara de las siguientes redes:

192.168.0.0/30 -> 255.255.255.252

* Hosts (hosts_match.rb). Formato GIFT

Indica cuantos hosts podemos albergar en las siguientes redes:

192.168.0.0/24 -> 254

* Direcciones (direcciones_cloze.rb). Formato XML

Indica la dirección inicial y final de las siguientes redes:

192.168.0.0/24 dirección inicial: <192.168.0.1>  dirección final: <192.168.0.254>

