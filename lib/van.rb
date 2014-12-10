require_relative 'bike_container'

class Van

	include BikeContainer
	
	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def broken_bikes
		@bikes.reject { |bike| !bike.broken?}
	end

end