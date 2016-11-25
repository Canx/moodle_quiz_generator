class Generator

  def initialize(hash)
    @variable = hash[0]
    @hash = hash[1]

    post_initialize
  end

  # hook for subclasses to override
  def post_initialize
  end

end
