class DockingStation
  attr_reader :bike

  def release_bike
    fail "No more bikes you fool!" unless @bike
    @bike
  end

  def dock(bike)
    fail "No more spaces left" if @bike
    @bike = bike
  end
end
