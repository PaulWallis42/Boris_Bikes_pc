require_relative 'docking_station'
require_relative 'bike'
require_relative 'garage'

class Van

  attr_reader :capacity
  attr_reader :broken_bikes
  attr_reader :working_bikes

  def initialize capacity=10
    @capacity = capacity
    @broken_bikes = []
    @working_bikes = []
  end

  def collect_broken_bike docking_station
    @broken_bikes << docking_station.release_broken_bike
  end

  def release_broken_bike
    @broken_bikes.pop
  end

  def collect_working_bike garage
    @working_bikes << garage.release_working_bike
  end

  def release_working_bike
    @working_bikes.pop
  end

end
