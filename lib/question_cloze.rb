module Cloze
  def add(item) 
    answer = erb(@template[:answer], item)

    if @answers.empty? 
      @pre = erb(@template[:pre], item)
    end
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
    text = ""
    text = @description if @description
    text = text + "\n" + @pre
    @answers.each do |answer|
      text = text + "\n" + answer
    end
    text = text + "\n" + @template[:post] 
  end

end
