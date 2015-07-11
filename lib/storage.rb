module BikeStorage

  DEFAULT_CAPACITY = 10

  attr_reader :capacity
  attr_reader :broken_bikes
  attr_reader :working_bikes

  def initialize capacity = DEFAULT_CAPACITY
    @working_bikes = []
    @broken_bikes = []
    @capacity = capacity
  end


end
