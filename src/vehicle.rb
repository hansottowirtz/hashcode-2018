class Vehicle
  attr_reader :id
  attr_accessor :rides
  attr_accessor :point
  
  attr_accessor :free_from_time
  attr_accessor :current_destination
  
  def initialize(id)
    @id = id
    @rides = []
    @point = Point.new(0, 0)
    @free_from_time = 0
  end

  def free?
    @free_from_time >= $time
  end

  def occupied?
    !free?
  end
end
