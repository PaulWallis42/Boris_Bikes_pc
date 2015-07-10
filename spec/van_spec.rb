require 'van'

describe Van do

  it 'can collect a broken bike' do
    subject.collect_broken_bike double :docking_station, release_broken_bike: :bike
    expect(subject.broken_bikes.length).to eq 1
  end

  it 'has a capacity' do
    van = Van.new(20)
    expect(van.capacity).to eq 20
  end



end
