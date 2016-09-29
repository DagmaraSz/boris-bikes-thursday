class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity =DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail "No more bikes you fool!" if empty?


    for i in 0...@bikes.length
      if @bikes[i].working == true
        return @bikes.delete_at(i)
      end
    end
  #  fail "Sorry broken, no!" unless @bikes[0].working
    #@bikes.pop
    fail "No working bikes you fool!"
  end

  def dock(bike)
    fail "No more spaces left" if full?
    @bikes << bike
  end

  private
  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.count <= 0
  end
end
