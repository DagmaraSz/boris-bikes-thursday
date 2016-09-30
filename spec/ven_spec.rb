require './lib/ven'
describe Ven do
  let(:station) {DockingStation.new}
  let(:garage) {double()}
  let(:broken_bike) {double("bike", :working => false)}
  let(:working_bike) {double("bike", :working => true)}

  it 'takes bikes' do
    expect(subject).to respond_to(:take_bikes).with(1).argument
  end

  it 'takes a broken bike from a station' do
    station.dock(working_bike)
    station.dock(broken_bike)
    station.dock(broken_bike)
    expect(subject.take_bikes(station)[0].working).to be false
  end

  it 'takes a working bike from a garage' do
    expect(subject.take_bikes(garage)[0].working).to be true
  end

end
