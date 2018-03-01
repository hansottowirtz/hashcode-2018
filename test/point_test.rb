require "minitest/autorun"
require_relative "../src/point"

class PointTest < Minitest::Test
  def test_points
    assert Point.new(1, 2) == Point.new(1, 2)
    assert_equal Point.new(1, 2).distance_to(Point.new(2, 1)), 2
    assert Point.new(1, 2) != (Point.new(2, 1))
  end
end
