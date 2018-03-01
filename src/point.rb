class Point
  attr_reader :x
  attr_reader :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance_to(point)
    (@x - point.x).abs + (@y - point.y).abs
  end

  def ==(point)
    distance_to(point) == 0
  end
end
