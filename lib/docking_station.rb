require_relative 'bike'

class DockingStation

  attr_reader :capacity
  attr_reader :broken_bikes

  def initialize(capacity=10)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    if full?
      fail 'Docking Station Full'
    elsif bike.broken? == true
      @broken_bikes << bike
    else
      @bikes << bike
    end
  end

  def release_broken_bike
    @broken_bikes.pop
  end

  private

  attr_reader :bikes

  def full?
    @bikes.count + @broken_bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

end
