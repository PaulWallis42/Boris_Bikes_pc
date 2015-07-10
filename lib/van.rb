require_relative 'docking_station'

class Van

  attr_reader :capacity
  attr_reader :broken_bikes

  def initialize capacity=10
    @capacity = capacity
    @broken_bikes = []
  end

  def collect_broken_bike docking_station
    @broken_bikes << docking_station.release_broken_bike
  end

end
