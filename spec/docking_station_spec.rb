require './lib/docking_station'
require './lib/bike'

describe 'docking_station' do
  station = DockingStation.new

  describe 'Empty Docking Station' do

    it 'respond to release bike' do
      expect(station).to respond_to(:release_bike)
    end

    it 'docks a bike' do
      expect(station).to respond_to(:dock).with(1).argument
    end

    it "doesn't release new bikes" do
      expect{station.release_bike}.to raise_error('No more bikes you fool!')


    end
  end


  describe 'Working bike docking station functions' do
      bike = Bike.new
      station.dock(bike)


    it 'gives bike' do
      expect(station.release_bike).to be_kind_of(Bike)
    end

    it 'showed docked bikes' do
      expect(station.bike).to be(bike)
    end


  end
end