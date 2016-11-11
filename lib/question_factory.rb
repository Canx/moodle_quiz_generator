require './lib/question.rb'
require './lib/ip_generator.rb'
require './lib/random_generator.rb'

class QuestionFactory
  @question_hash
  @generators

  def initialize(question_hash)
    @generators = Array.new()
    @question_hash = question_hash

    raise "':generators' key not defined" if !question_hash.key?(:generators)

    # leemos los generators y los guardamos
    question_hash[:generators].each do |generator, hash|
      hash.each do |subhash|
        case generator
        when :ip
          @generators << IPGenerator.new(subhash)
        when :random
          @generators << RandomGenerator.new(subhash)
        end
      end
    end
  end
  
  def create()
    # debemos iterar todos los generators y crear un item del tipo:
    # { "variable" => valor, "variable2" => valor,... }

    question = Question.new(@question_hash)
  
    # mientras el primer generator tenga cosas.... 
    items = Hash.new
    loop do
      item = nil
      @generators.each do |generator| 
        item = generator.generate()
        break if item.nil?
        items = items.merge(item)
      end
      break if item.nil?
      question.add(items)
    end
 
    return question
  end
end
