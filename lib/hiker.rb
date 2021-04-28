class Hiker
  attr_reader :name, :experience_level, :snacks, :parks_visited

  def initialize(name, exp)
    @name = name
    @experience_level = exp
    @snacks = {}
    @parks_visited = []
  end

  def pack(snack, quantity)
    if !@snacks[snack]
      @snacks[snack] = quantity
    else
      @snacks[snack] += quantity
    end
  end

  def visit(park)
    @parks_visited << park
  end

  def possible_trails
    trails = []
    @parks_visited.each do |park|
      park.trails.each do |trail|
        trails << trail if trail.level == @experience_level
      end
    end
    trails
  end

end
