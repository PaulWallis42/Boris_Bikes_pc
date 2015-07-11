require 'van'

describe Van do

  let(:garage) { subject.collect_working_bike double :garage, release_working_bike: :bike }
  let(:docking_station) { subject.collect_broken_bike double :docking_station, release_broken_bike: :bike }

  it 'has a capacity' do
    van = Van.new(20)
    expect(van.capacity).to eq 20
  end

  it 'can not go over the capacity' do
    docking_station = double :docking_station, release_broken_bike: :bike
    subject.capacity.times {subject.collect_broken_bike docking_station}
    expect {subject.collect_broken_bike docking_station }.to raise_error 'Van is full'
    expect(subject.broken_bikes.length).to eq 10
  end

  it 'can collect a broken bike from docking station' do
    docking_station
    expect(subject.broken_bikes.length).to eq 1
  end

  it 'can give a broken bike to garage' do
    docking_station
    subject.release_broken_bike
    expect(subject.broken_bikes.length).to be 0
  end

  it 'can collect a working bike from a garage' do
    garage
    expect(subject.working_bikes.length).to eq 1
  end

  it 'can give a working bike to a docking station' do
    garage
    subject.release_working_bike
    expect(subject.working_bikes.length).to eq 0
  end

end
