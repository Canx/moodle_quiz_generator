require 'ip'

class IPExtended
  attr_accessor :class_ip, :private_ip, :default_mask
  
  def initialize(ip_string, private_ip, default_mask)
    @ip = IP.new(ip_string)
    @private_ip = private_ip
    @default_mask = default_mask
  end

  def class_ip
    clase = "A" if self.to_bin[0][0..0] == "0"
    clase = "B" if self.to_bin[0][0..1] == "10"
    clase = "C" if self.to_bin[0][0..2] == "110"
    clase = "D" if self.to_bin[0][0..3] == "1110"
    clase = "E" if self.to_bin[0][0..4] == "1111"
    return clase
  end
      
  def initial
    (@ip.network(1)).to_s.split("/")[0]
  end

  def final
    (@ip.broadcast(-1)).to_s.split("/")[0]
  end  

  def to_bin()
    @ip.to_b.to_s.rjust(32, '0').scan(/.{0,8}/)
  end

  # class methods 
  def self.to_bin(ip)
    IP.new(ip).to_b.to_s.rjust(32, '0').scan(/.{0,8}/)
  end

  def to_s
    @ip.to_s
  end

  private
  def method_missing(method, *args, &block)
    @ip.send(method, *args, &block)
  end
end
