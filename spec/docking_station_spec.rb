require 'docking_station'

describe DockingStation do

  it 'can accept a capacity on creation' do
    rack = DockingStation.new(20)
    expect(rack.capacity).to eq 20
  end

  it { is_expected.to respond_to :release_working_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'releases working bikes to users' do
    bike = double :bike, broken?: false
    subject.dock bike
    expect(subject.release_working_bike).to be bike
  end

  it 'will not release a broken bikes to a user' do
    bike = double :bike, broken?: true
    subject.dock bike
    expect { subject.release_working_bike }.to raise_error 'No bikes available'
  end

  it 'will release a broken bike to a van' do
    bike = double :bike, broken?: true
    subject.dock bike
    subject.release_broken_bike
    expect(subject.broken_bikes.length).to eq 0
  end

  it 'can accept a working bike from a van' do
    van = double :van, release_working_bike: :bike
    subject.collect_working_bike van
    expect(subject.working_bikes.length).to eq 1
  end

    describe 'release_bike' do

      it 'raises an error when there are no bikes available' do
        expect { subject.release_working_bike }.to raise_error 'No bikes available'
      end
    end

    describe 'dock' do

      it 'raises an error when full' do
        bike = double :bike, broken?: false
        subject.capacity.times { subject.dock bike }
        expect { subject.dock bike }.to raise_error 'Docking Station Full'
      end
    end
end
