#!/usr/bin/env ruby

require './lib/question_generator.rb'
require 'builder'

# Quiz class

class Quiz

  def initialize
    @questions = Array.new
    @xml = Builder::XmlMarkup.new( :indent => 2 )
  end

  def add(question_hash)
    question_generator = QuestionGenerator.new(question_hash)
    question = question_generator.create()
    @questions << question
  end

  def to_s
    output = @xml.quiz do |xml_quiz|
      @questions.each do |question|
        question.to_xml(xml_quiz)
      end
    end
  end
end
