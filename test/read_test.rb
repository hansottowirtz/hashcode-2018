require "minitest/autorun"
require_relative "../src/hashcode"

class ReadTest < Minitest::Test
  def setup
    file = File.expand_path('../../fixtures/a_example.in', __FILE__)
    @hashcode = Hashcode.new(file)
    @hashcode.parse
  end

  def test_read
    assert_equal @hashcode.vehicles.length, 2
    assert_equal @hashcode.rides.length, 3
  end
end
