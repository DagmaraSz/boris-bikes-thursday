class Ven
   def take_bikes(location)
     if location.class == DockingStation
       location.bikes.collect{|bike| bike.working == false}
     elsif location.class == Garage
     else
       fail "Ven doesn't go there"
     end
   end
end
