
# :code => lambda { |parameter1, parameter2, parameter3,...| code }

class CodeGenerator
  
  def initialize(code_hash)
    @variable = code_hash[0]
    @code = code_hash[1]
  end

  def generate(hash_params)
    return {@variable => @code[hash_params]}
  end

  def self.generate_hash(orig_hash)
    result_hash = orig_hash.clone

    # hacemos los inversos
    orig_hash.each do |pair, value|
      result_hash.merge!({[pair[1],pair[0]] => 1.to_f/value})
    end
                                     
    begin
      iterate_hash = result_hash.clone
      iterate_hash.each do |pair1, value1| 
        iterate_hash.each do |pair2, value2| 
          if pair1[0] == pair2[1]
            if !result_hash.key?([pair2[0],pair1[1]])
              result_hash.merge!({[pair2[0],pair1[1]] => value1*value2 })
            end
          end
        end
      end
    end while result_hash.length != iterate_hash.length 

    result_hash
  end

  def self.to_unit(origin_size, origin_unit, result_unit, conversion_hash)
    convert_hash = self.generate_hash(conversion_hash)
                                 
    if convert_hash.key?([origin_unit, result_unit])
      origin_size*convert_hash[[origin_unit, result_unit]]
    else
      raise "Conversion '#{origin_unit} to #{result_unit}' not found in convert_hash"
    end
  end 
end
