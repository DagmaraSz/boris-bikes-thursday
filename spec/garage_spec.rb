require './lib/garage'
describe Garage do
  let(:van) {double("ven")}
  let(:broken_bike) {double("bike", :working => false)}
  let(:working_bike) {double("bike", :working => true)}

  it 'accepts bikes from vans' do
      expect(subject).to respond_to(:accept).with(1).argument
  end

  it 'it fixes broken bikes' do
    # TO DO
  end

end
