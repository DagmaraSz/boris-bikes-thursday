class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No more bikes you fool!" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "No more spaces left" if full?
    @bikes << bike
  end

  private
  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.count >= 0
  end
end
