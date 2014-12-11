#a method that would consolidate both the load and unload
#taking 3 arguments of from, to, and bike status(available or broken)



require_relative 'bike_container'

class Van

	include BikeContainer
	
	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

  def load_from_station(station)
    station.broken_bikes.each do | bike |
      dock(bike)
      station.release(bike)
    end
  end

  def unload_to_garage(garage)
    broken_bikes.each do | bike |
      garage.dock(bike)
      release(bike)
    end
  end

  def load_from_garage(garage)
    garage.available_bikes.each do | bike |
      dock(bike)
      garage.release(bike)
    end
  end

  def unload_to_station(station)
    available_bikes.each do | bike |
      station.dock(bike)
      release(bike)
    end
  end



end