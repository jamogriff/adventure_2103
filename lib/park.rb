class Park
  attr_reader :name, :trails

  def initialize(name)
    @name = name
    @trails = []
  end

  def add_trail(trail)
    @trails << trail
  end

  def trails_shorter_than(number)
    @trails.select do |trail|
      trail.length < number
    end
  end

  def hikeable_miles
    @trails.sum do |trail|
      trail.length
    end
  end

  def trails_by_level
    trails_by_level = {}
    all_levels.each do |level|
      trails_by_level[level] = get_trail_names_by_level(level)
    end
    trails_by_level
  end

  def all_levels
    @trails.map do |trail|
      trail.level
    end.uniq
  end

  def get_trails_by_level(level)
    @trails.select do |trail|
      trail.level == level
    end
  end

  def get_trail_names_by_level(level)
    get_trails_by_level(level).map do |trail|
      trail.name
    end
  end

end
