class Garage

  attr_reader :capacity
  attr_reader :broken_bikes
  attr_reader :working_bikes

  def initialize capacity=50
    @capacity = capacity
    @broken_bikes = []
    @working_bikes = []
  end

  def collect_broken_bike van
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

end
