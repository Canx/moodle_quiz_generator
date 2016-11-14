require './lib/ip_extended.rb'

class IPGenerator
  attr_reader :variable
  @variable

  def initialize(hash)
    @variable = hash[0]
    ipgen_hash = hash[1]

    @items = Array.new()
    @class_list = Array.new(["A","B","C","D"])
 
    ipgen_hash.each do |tipo,cantidad|
      (1..cantidad).each do |n|
        @items << tipo
      end
    end

    @items = @items.shuffle
  end

  def generate
    item = @items.pop
    if item.nil?
      return nil
    end
 
    

    # cada vez sacamos un elemento de la lista y actualizamos los parámetros
    gen = Random.new
    class_ip = item[:class] || @class_list.sample
    private_ip = item[:private] || false
    default_mask = item[:default] || false
    input_mask = item[:mask]


    number1 = gen.rand(0..254)
    number2 = gen.rand(0..254)
    number3 = gen.rand(0..254)
    number4 = gen.rand(0..254)
 
    case class_ip
    when "A" then
      mask = default_mask == true ? 8 : gen.rand(8..31)
      number1 = private_ip == true ? 10 : gen.rand(1..126)
    when "B" then
      mask = default_mask == true ? 16 : gen.rand(12..31)
      number1 = private_ip == true ? 172 : gen.rand(128..191)
      number2 = gen.rand(16..31)
    when "C" then
      mask = default_mask == true ? 24 : gen.rand(16..31)
      number1 = private_ip == true ? 192 : gen.rand(192..223)
      number2 = private_ip == true ? 168 : gen.rand(0..254)
    when "D" then
      mask = 4
      number1 = gen.rand(224..239)
    when "localhost" then
      mask = 8
      number1 = "127"
      number2 = "0"
      number3 = "0"
      number4 = "1"
    else
      raise "class '#{class_ip}' not supported"
    end
    
    if input_mask.is_a?(Integer)
      mask = input_mask
    end


    if input_mask.is_a?(Range)
      mask = gen.rand(input_mask)
    end
   
    ip_string = "#{number1}.#{number2}.#{number3}.#{number4}/#{mask}"
    ip = IPExtended.new(ip_string, private_ip, mask)
    
    # Aquí devolvemos el nombre del hash
    return {@variable => ip }
  end
end
