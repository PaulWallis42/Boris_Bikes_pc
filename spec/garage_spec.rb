require 'garage'

describe Garage do

  let(:van) { subject.collect_broken_bike(double :van, release_broken_bike: :bike) }
  let(:fix_bike) { double :bike, fix_bike: :bike }

  it 'has a capacity' do
    expect(subject.capacity).to eq 10
  end

  it 'can take broken bikes' do
    van
    expect(subject.broken_bikes.length).to eq 1
  end

  it 'can not collect more bikes than it has capacity' do
    van = double :van, release_broken_bike: :bike
    subject.capacity.times { subject.collect_broken_bike van }
    expect { subject.collect_broken_bike van }.to raise_error 'Garage is full'
    expect(subject.broken_bikes.length).to eq 10
  end

  it 'can fix broken bikes' do
    subject.collect_broken_bike double :van, release_broken_bike: fix_bike
    subject.fix_bike
    expect(subject.working_bikes.length).to eq 1
  end

  it 'can release working bikes' do
    subject.collect_broken_bike double :van, release_broken_bike: fix_bike
    subject.fix_bike
    subject.release_working_bike
    expect(subject.working_bikes.length).to eq 0
  end

end
