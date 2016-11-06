require './lib/question.rb'
require './lib/ip_generator.rb'

class QuestionGenerator
  @question_hash
  @generator

  def initialize(question_hash)
    @question_hash = question_hash
    #raise "generator not defined" if !question_hash.key?(:generator)

    case question_hash[:generator]
    when :ip
      @generator = IPGenerator.new(question_hash[:ip])
    end
  end
  
  def create()
    question = Question.new(@question_hash)

    while (item = @generator.generate()) do
      question.add(item)
    end
    return question
  end
end
