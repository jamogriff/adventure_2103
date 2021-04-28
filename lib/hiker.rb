class Hiker
  attr_reader :name, :experience_level, :snacks

  def initialize(name, exp)
    @name = name
    @experience_level = exp
    @snacks = {}
  end

  def pack(snack, quantity)
    if !@snacks[snack]
      @snacks[snack] = quantity
    else
      @snacks[snack] += quantity
    end
  end

end
