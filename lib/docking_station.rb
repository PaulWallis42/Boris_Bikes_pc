require_relative 'storage'

class DockingStation
  include BikeStorage

  def release_working_bike
    fail 'No bikes available' if empty?
    @working_bikes.pop
  end

  def dock(bike)
    if full?
      fail 'Docking Station Full'
    elsif bike.broken? == true
      @broken_bikes << bike
    else
      @working_bikes << bike
    end
  end

  def release_broken_bike
    @broken_bikes.pop
  end

  def collect_working_bike van
    @working_bikes << van.release_working_bike
  end

  private

  def full?
    @working_bikes.count + @broken_bikes.count >= capacity
  end

  def empty?
    @working_bikes.empty?
  end

end
