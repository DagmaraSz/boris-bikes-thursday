class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No more bikes you fool!" if @bikes.count == 0
    @bikes.pop
  end

  def dock(bike)
    fail "No more spaces left" if @bikes.count == 20
    @bikes << bike
  end
end
