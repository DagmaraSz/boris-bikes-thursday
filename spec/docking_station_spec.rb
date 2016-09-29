require './lib/docking_station'
require './lib/bike'

describe 'docking_station' do
  let(:station) {DockingStation.new} #optional, but is apparently better practice for instantiation

  context 'Empty Docking Station' do #context - the same thing as describe, just a convention, see link
    let(:station2) {DockingStation.new(50)}
    it 'respond to release bike' do
      expect(station).to respond_to(:release_bike)
    end

    it 'docks a bike' do
      expect(station).to respond_to(:dock).with(1).argument
    end

    it "doesn't release new bikes when no bikes" do
      expect{station.release_bike}.to raise_error("No more bikes you fool!")
    end

    it "has default capacity" do
      expect(station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end

    it "has a variable capacity" do
      expect(station2.capacity).to eq(50)
    end
  end

  context 'Working bike docking station functions' do
    let(:bike) {Bike.new}

    it 'gives bike' do
      station.dock(bike) #turned out these were "bleeding" into the other test, so repeating is the only way I found to make things work :P
      expect(station.release_bike).to be_kind_of(Bike)
    end

    it 'showed docked bikes' do
      station.dock(bike)
      expect(station.bikes).to eq([bike])
    end

    it "doesn't take new bikes when full" do
      expect{(DockingStation::DEFAULT_CAPACITY+1).times{station.dock(bike)}}.to raise_error("No more spaces left")
    end
  end

end
