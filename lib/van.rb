class Van

  DEFAULT_CAPACITY = 10

  attr_reader :capacity
  attr_reader :broken_bikes
  attr_reader :working_bikes

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @broken_bikes = []
    @working_bikes = []
  end

  def collect_broken_bike docking_station
    fail 'Van is full' if full?
    @broken_bikes << docking_station.release_broken_bike
  end

  def release_broken_bike
    @broken_bikes.pop
  end

  def collect_working_bike garage
    fail 'Van is full' if full?
    @working_bikes << garage.release_working_bike
  end

  def release_working_bike
    @working_bikes.pop
  end

  private

  def full?
    @working_bikes.count + @broken_bikes.count >= capacity
  end

end
