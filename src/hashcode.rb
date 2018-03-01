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
    read_input
    write_output
  end

  def read_input
    puts 'read'
    File.foreach(@input_path).with_index do |line, i|
      case i
        when 0
          @videos << line.to_i
        when 1
        else
      end
    end
  end

  def write_output
    puts 'write'
  end
end
