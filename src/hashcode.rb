require 'pry'
require 'fileutils'
require 'set'
require 'minitest'

class Hashcode
  attr_reader :videos

  def initialize(input_path, output_path = nil)
    @input_path = input_path
    @output_path = output_path

    @videos = []
  end

  def run
    parse
    arrange
    write if @output_path
  end

  def parse
    puts 'Parsing'
    File.foreach(@input_path).with_index do |line, i|
      case i
        when 0
          @videos << line.to_i
        when 1
        else
      end
    end
  end

  def arrange
    puts 'Arranging'
  end

  def write
    o = ""

    if @output_path
      FileUtils.mkdir_p(File.dirname(@output_path))
      File.write(@output_path, o)
    else
      puts o
    end
  end
end
