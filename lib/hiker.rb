class Hiker
  attr_reader :name, :experience_level, :snacks

  def initialize(name, exp)
    @name = name
    @experience_level = exp
    @snacks = {}
  end

end
