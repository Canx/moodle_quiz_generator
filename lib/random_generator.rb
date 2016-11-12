require './lib/ip_extended.rb'

# :random => {{ :range => (1..100), :multiplier => 100 } => 1 }
# mandatory: range
# optional: multiplier

class RandomGenerator
  attr_reader :variable

  def initialize(random_hash)
    @variable = random_hash[0]
    random_hash = random_hash[1]

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
    return nil if item.nil?
 
    gen = Random.new
    
    if item.key?(:multiplier) then
      multiplier = item[:multiplier]
    else
      multiplier = 1
    end
  
    if item.key?(:range) then
      return {@variable => ( gen.rand(item[:range]) * multiplier ) }
    end

    if item.key?(:elements) then
      return {@variable => item[:elements].sample }
    end     

    raise "':range' or ':elements' option must be specified in random generator."
  end
end
