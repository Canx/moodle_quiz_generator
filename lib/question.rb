require 'erb'
require 'ostruct'

class Question
  @type
  @name
  @template
  @answers

  def initialize(question_hash)
    @type = question_hash[:type]
    @name = question_hash[:name]
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

module MultipleChoice
  def add()
    raise NotImplementedError
  end

  def set_single()

  end

  def xml_questiontext(xml_builder)
    raise NotImplementedError

  end

end

module Cloze
  def add(item) 
    answer = erb(@template[:answer], item)
    @answers << answer
  end

  def xml_questiontext(xml_builder)
    xml_builder.questiontext(:format => "html") do |qt|
      qt.text do |t|
        t.cdata! self.cloze_cdata
      end
    end
  end
 
  def cloze_cdata() 
    text = @description
    text = text + "\n" + @template[:pre]
    @answers.each do |answer|
      text = text + "\n" + answer
    end
    text = text + "\n" + @template[:post] 
  end

end


module Matching
  def add(item)
    # item contiene el elemento generado
    # item => { :ip => IP Object } 
    # tenemos que crear una variable llamada ip que contenga IP Object.
 
    option1 = erb(@template[:left], item)
    option2 = erb(@template[:right], item)

    @answers << [option1, option2]
  end

  def xml_questiontext(xml_builder)
    xml_builder.questiontext(:format => "html") do |qt|
      qt.text @description

      @answers.each do |option1, option2|
        qt.subquestion do |sq|
          sq.text option1
          sq.answer do |a|
            a.text option2
          end
        end
      end
    end
    xml_builder.shuffleanswers "true"
  end
end
