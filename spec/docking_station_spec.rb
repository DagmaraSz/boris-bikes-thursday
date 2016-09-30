require './lib/docking_station'
require './lib/bike'

describe DockingStation do

  context 'Empty Docking Station' do
    let(:station2) {DockingStation.new(50)}
    it 'respond to release bike' do
      expect(subject).to respond_to(:release_bike)
    end

    it 'docks a bike' do
      expect(subject).to respond_to(:dock).with(1).argument
    end

    it "doesn't release new bikes when no bikes" do
      expect{subject.release_bike}.to raise_error("No more bikes you fool!")
    end

    it "has default capacity" do
      expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end

    it "has a variable capacity" do
      expect(station2.capacity).to eq(50)
    end
  end

  context 'Working bike docking subject functions' do

    it 'gives bike' do
      subject.dock double(:bike)
    end

    it 'showed docked bikes' do
      subject.dock double(:bike)
      expect(subject.bikes).to eq([double(:bike)])
    end

    it "doesn't take new bikes when full" do
      expect{(DockingStation::DEFAULT_CAPACITY+1).times{subject.dock double(:bike)}}.to raise_error("No more spaces left")
    end

    it "only releases working bikes" do
      subject.dock double(:bike)
      double(:bike2).report_broken
      subject.dock double(:bike2)
      expect(subject.release_bike.working).to be true
    end

    it "errors when all bikes are broken" do
      double(:bike).report_broken
      double(:bike2).report_broken
      subject.dock double(:bike)
      subject.dock double(:bike2)
      expect{subject.release_bike}.to raise_error("No working bikes you fool!")
    end
  end

end
