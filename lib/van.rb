require_relative 'bike_container'
require_relative 'docking_station'
require_relative 'garage'

class Van

	include BikeContainer
	
	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

#this should check broken on the station
#this should load broken bikes from station into van
#station should release the broken bikes that was loaded
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

end