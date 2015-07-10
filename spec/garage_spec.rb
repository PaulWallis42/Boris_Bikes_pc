require 'garage'

describe Garage do

  it 'has a capacity' do
    expect(subject.capacity).to eq 50
  end

  it 'can take broken bikes' do
    subject.collect_broken_bike double :van, release_broken_bike: :bike
    expect(subject.broken_bikes.length).to eq 1
  end

  it 'can fix broken bikes' do
    bike = double :bike, fix_bike: :bike
    subject.collect_broken_bike double :van, release_broken_bike: bike
    subject.fix_bike
    expect(subject.working_bikes.length).to eq 1
  end

  it 'can release working bikes' do
    bike = double :bike, fix_bike: :bike
    subject.collect_broken_bike double :van, release_broken_bike: bike
    subject.fix_bike
    subject.release_working_bike
    expect(subject.working_bikes.length).to eq 0
  end

end
