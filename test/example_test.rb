require "minitest/autorun"
require_relative "../src/hashcode"

class ExampleTest < Minitest::Test
  def setup
    file = File.expand_path('../../fixtures/a_example.in', __FILE__)
    @hashcode = Hashcode.new(file)
    @hashcode.parse
    @hashcode.arrange
  end

  def test_example
    binding.pry
  end
end
