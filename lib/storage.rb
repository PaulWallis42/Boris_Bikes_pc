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

  def release_broken_bike
    @broken_bikes.pop
  end

  def release_working_bike
    @working_bikes.pop
  end

  private

  def full?
      @working_bikes.count + @broken_bikes.count >= capacity
  end

end
