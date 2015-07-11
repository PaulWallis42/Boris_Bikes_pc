class Garage

  DEFAULT_CAPACITY = 50

  attr_reader :capacity
  attr_reader :broken_bikes
  attr_reader :working_bikes

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @broken_bikes = []
    @working_bikes = []
  end

  def collect_broken_bike van
    fail 'Garage is full' if full?
    @broken_bikes << van.release_broken_bike
  end

  def fix_bike
    bike = @broken_bikes.pop
    bike.fix_bike
    @working_bikes << bike
  end

  def release_working_bike
    @working_bikes.pop
  end

  private

  def full?
    @broken_bikes.length + @working_bikes.length >= @capacity
  end

end
