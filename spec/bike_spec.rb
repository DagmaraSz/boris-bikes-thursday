require 'bike.rb'

describe Bike do
  it 'responds to working?' do
    bike1 = Bike.new
    expect(bike1).to respond_to(:working)

  end

  it 'is working by default' do
    bike1 = Bike.new
    expect(bike1.working).to be(true)
  end

  it 'knows when its broken' do
    bike1 = Bike.new
    bike1.report_broken
    expect(bike1.working).to be(false)
  end

  it 'can be reported broken' do
    bike1 = Bike.new
    expect(bike1).to respond_to(:report_broken)
  end
  
end
