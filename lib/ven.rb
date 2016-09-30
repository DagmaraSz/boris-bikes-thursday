class Ven
   def take_bikes(location)
     if location.class == DockingStation
       location.bikes.select{|bike| bike unless bike.working}
     elsif location.class == Garage

     else
       fail "Ven doesn't go there"
     end
   end
end
