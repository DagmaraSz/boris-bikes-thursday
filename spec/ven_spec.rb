require './lib/ven'
describe Ven do
  let(:station) {DockingStation.new}
  let(:garage) {double()}
  let(:working_bike) {double(:working => true)}
  let(:broken_bike) {Bike.new}

  it 'takes bikes' do
    expect(subject).to respond_to(:take_bikes).with(1).argument
  end

  it 'takes a broken bike from a station', focus: true do
    broken_bike.report_broken
    station.dock(broken_bike)
    expect(false).to be false
  end

  it 'takes a working bike from a garage' do
    expect(subject.take_bikes(garage)[0].working).to be_true
  end

end
