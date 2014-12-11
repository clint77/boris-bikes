require_relative 'bike_container'

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
      van.dock(bike)
      station.release(bike)
    end
  end

end