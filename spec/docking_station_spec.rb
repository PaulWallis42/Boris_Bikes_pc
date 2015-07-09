require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'will not release a broken bike' do
    bike = Bike.new
    bike.report_broken
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
        subject.capacity.times { subject.dock(Bike.new) }
        expect { subject.dock(Bike.new) }.to raise_error 'Docking Station Full'
      end

      it 'can accept a capacity on creation' do
        rack = DockingStation.new(20)
        expect(rack.capacity).to eq 20
      end
    end
end
