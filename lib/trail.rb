class Trail
  attr_reader :name, :length, :level

  def initialize(info)
    @name = info[:name]
    @length = info[:length][0..2].to_f
    @level = info[:level]
  end

end
