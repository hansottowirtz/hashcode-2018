class Ride
  attr_reader :id
  attr_reader :start_point
  attr_reader :end_point
  attr_reader :start_time
  attr_reader :end_time

  attr_reader :distance
  attr_reader :max_time
  attr_reader :tp

  def initialize(id, start_point, end_point, start_time, end_time)
    @id = id
    @start_point = start_point
    @end_point = end_point
    @start_time = start_time
    @end_time = end_time

    @distance = @start_point.distance_to(@end_point)
    @max_time = @end_time - @start_time
    @tp = @max_time - @distance

    fail if @start_point == @end_point
    fail if max_time < distance
  end
end
