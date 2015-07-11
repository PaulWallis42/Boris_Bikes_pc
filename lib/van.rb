require_relative 'storage'

class Van

  include BikeStorage

  def collect_broken_bike docking_station
    fail 'Van is full' if full?
    @broken_bikes << docking_station.release_broken_bike
  end

  def collect_working_bike garage
    fail 'Van is full' if full?
    @working_bikes << garage.release_working_bike
  end

end
