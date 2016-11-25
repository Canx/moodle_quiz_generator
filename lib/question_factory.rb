require 'question.rb'
require 'ip_generator.rb'
require 'random_generator.rb'
require 'code_generator.rb'

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
        when :code
          @generators << CodeGenerator.new(subhash) # hay que pasarle las variables anteriores!
        else
          raise "'#{generator}' generator not implemented"
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
        if generator.is_a?(CodeGenerator)
          item = generator.generate(items)
        else
          item = generator.generate()
        end
        break if item.nil?
        items = items.merge(item)
      end
      break if item.nil?
      question.add(items)
    end
 
    return question
  end
end
