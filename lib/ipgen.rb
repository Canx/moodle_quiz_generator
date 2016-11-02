#!/usr/bin/env ruby

require 'ip'

class IPGen
  @ip = nil
  @class = nil
  @gen

  def initialize(params = {})
    @gen = Random.new
    list_class = Array.new(["A","B","C","D"])
    @class = params[:class] || list_class.sample
    @private = params[:private] || false
    @default = params[:default] || true
    @mask = params[:mask]
  end

  # obtiene una nueva ip según las condiciones del constructor
  def get() 
    return random
  end

  def random()
    @number1 = @gen.rand(0..254)
    @number2 = @gen.rand(0..254)
    @number3 = @gen.rand(0..254)
    @number4 = @gen.rand(0..254)
 
    case @class
    when "A" then
      @mascara = @default == true ? 8 : @gen.rand(8..31)
      @number1 = @private == true ? 10 : @gen.rand(1..126)
    when "B" then
      @mascara = @default == true ? 16 : @gen.rand(12..31)
      @number1 = @private == true ? 172 : @gen.rand(128..191)
      @number2 = @gen.rand(16..31)
    when "C" then
      @mascara = @default == true ? 24 : @gen.rand(16..31)
      @number1 = @private == true ? 192 : @gen.rand(192..223)
      @number2 = @private == true ? 168 : @gen.rand(0..254)
    when "D" then
      @mascara = 4
      @number1 = @gen.rand(224..239)
    when "localhost" then
      @mascara = 8
      @number1 = "127"
      @number2 = "0"
      @number3 = "0"
      @number4 = "1"
    end
 
    # Sobreescribimos la máscara si nos la han pasado.
    @mascara = @mask if @mask

    @ip = IP.new("#{@number1}.#{@number2}.#{@number3}.#{@number4}/#{@mascara}") 
    return @ip
  end 
end

# Test
#ip = IPGen.new({class: "C", private: true, mask: 8})
#puts ip.get()
