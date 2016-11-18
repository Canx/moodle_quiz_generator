require 'erb'
require 'ostruct'
require './lib/question_cloze.rb'
require './lib/question_matching.rb'
require './lib/question_multichoice.rb'

class Question
  @type
  @name
  @template
  @answers

  def initialize(question_hash)
    @type = question_hash[:type]
    @name = "#{question_hash[:name]}##{question_hash[:id]}"
    @description = question_hash[:description]
    @template = question_hash[:answers]
    @answers = Array.new()


    case @type
      when :multiplechoice
        self.extend(MultipleChoice)
      when :cloze
        self.extend(Cloze)
      when :matching
        self.extend(Matching)
      else
        raise "'#{@type}' question type not implemented"
    end
  end

  def erb(template, vars)
    ERB.new(template).result(OpenStruct.new(vars).instance_eval { binding })
  end

  def to_xml(xml_builder)
    xml_builder.question(:type => @type) do |q|
      q.name do |n|
        n.text @name
      end
      xml_questiontext(q)  
    end
  end
end
