require "minitest/autorun"
require_relative "../src/hashcode"

class ReadTest < Minitest::Test
  def setup
    file = File.expand_path('../../fixtures/lal.in', __FILE__)
    @hashcode = Hashcode.new(file)
    @hashcode.parse
  end

  def test_read
    assert_equal @hashcode.videos[0], 1
  end

  def test_lol
    assert_equal 'lol', "lol"
  end
end
