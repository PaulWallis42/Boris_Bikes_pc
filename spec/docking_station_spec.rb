require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = double :bike, broken?: false
    subject.dock bike
    expect(subject.release_bike).to be bike
  end

  it 'will not release a broken bike' do
    bike = double :bike, broken?: true
    subject.dock bike
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

    describe 'release_bike' do
      it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end
    end

    describe 'dock' do
      it 'raises an error when full' do
        bike = double :bike, broken?: false
        subject.capacity.times { subject.dock bike }
        expect { subject.dock bike }.to raise_error 'Docking Station Full'
      end

      it 'can accept a capacity on creation' do
        rack = DockingStation.new(20)
        expect(rack.capacity).to eq 20
      end
    end
end
