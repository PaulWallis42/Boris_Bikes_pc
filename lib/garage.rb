require_relative 'storage'

class Garage

  include BikeStorage
  
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
