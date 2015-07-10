require 'van'

describe Van do

  it 'has a capacity' do
    van = Van.new(20)
    expect(van.capacity).to eq 20
  end

  it 'can collect a broken bike from docking station' do
    subject.collect_broken_bike double :docking_station, release_broken_bike: :bike
    expect(subject.broken_bikes.length).to eq 1
  end

  it 'can give a broken bike to garage' do
    subject.collect_broken_bike double :docking_station, release_broken_bike: :bike
    subject.release_broken_bike
    expect(subject.broken_bikes.length).to be 0
  end

  it 'can collect a working bike from a garage' do
    subject.collect_working_bike double :garage, release_working_bike: :bike
    expect(subject.working_bikes.length).to eq 1
  end

  it 'can give a working bike to a docking station' do
    subject.collect_working_bike double :garage, release_working_bike: :bike
    subject.release_working_bike
    expect(subject.working_bikes.length).to eq 0
  end

end
