
# :code => lambda { |parameter1, parameter2, parameter3,...| code }

class CodeGenerator
  
  def initialize(code_hash)
    @variable = code_hash[0]
    @code = code_hash[1]
  end

  def generate(hash_params)
    return {@variable => @code[hash_params]}
  end
end
