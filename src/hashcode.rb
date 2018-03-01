require 'pry'
require 'fileutils'
require 'set'
require_relative './ride'
require_relative './vehicle'
require_relative './point'

class Hashcode
  attr_reader :vehicles
  attr_reader :rides

  def initialize(input_path, output_path = nil)
    @input_path = input_path
    @output_path = output_path

    @vehicles = []
    @rides = []
  end

  def run
    parse
    arrange
    write
  end

  def parse
    puts 'Parsing'

    n_rides = nil

    File.foreach(@input_path).with_index do |line, i|
      v = line.split(' ').map(&:to_i)
      case i
        when 0
          @rows = v[0]
          @columns = v[1]
          
          # number of vehicles
          v[2].times do |i|
            @vehicles << Vehicle.new(i)
          end

          n_rides = v[3]
          @bonus = v[4]
          @T = v[5]          
        else
          start_point = Point.new(v[0], v[1])
          end_point = Point.new(v[2], v[3])
          @rides << Ride.new(i - 1, start_point, end_point, v[4], v[5])
      end
    end

    @rides.sort! do |a, b|
      comp = (a.start_time <=> b.start_time)
      comp.zero? ? (a.tp <=> b.tp) : comp
    end
  end

  def arrange
    $time = 0
    ride_i = 0

    @rides.each do |cur_ride|          
      closest_free_vehicle = @vehicles.select(&:free?).min_by do |v|
        v.point.distance_to(cur_ride.start_point)
      end

      travel_to_time = closest_free_vehicle.point.distance_to(cur_ride.start_point)
      travel_with_time = cur_ride.distance
      closest_free_vehicle.free_from_time = travel_to_time + travel_with_time
      closest_free_vehicle.point = cur_ride.end_point

      closest_free_vehicle.rides << cur_ride
    end
  end

  def write
    o = ""
    @vehicles.each do |v|
      o += "#{v.rides.length} #{v.rides.map(&:id).join(' ')}\n"
    end

    if @output_path
      FileUtils.mkdir_p(File.dirname(@output_path))
      File.write(@output_path, o)
    else
      puts o
    end
  end
end
