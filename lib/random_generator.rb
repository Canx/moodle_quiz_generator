require './lib/ip_extended.rb'

# :random => {{ :range => (1..100), :multiplier => 100 } => 1 }
# mandatory: range
# optional: multiplier

class RandomGenerator

  def initialize(random_hash)

    @items = Array.new()
    random_hash.each do |tipo,cantidad|
      (1..cantidad).each do |n|
        @items << tipo
      end
    end

    @items = @items.shuffle
  end

  def generate
    item = @items.pop
    return nil if !item
 
    gen = Random.new
    
    if item.key?(:multiplier) then
      multiplier = item[:multiplier]
    else
      multiplier = 1
    end

    return {:random => ( gen.rand(item[:range]) * multiplier ) }
  end
end
