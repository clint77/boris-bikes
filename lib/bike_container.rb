module BikeContainer

DEFAULT_CAPACITY = 10

def bikes
    @bikes ||= []
end

def capacity
    @capacity ||= DEFAULT_CAPACITY
end

def capacity=(value)
    @capacity = value
end

def bike_count
	bikes.count
end

def dock(bike = nil)
	empty_argument(bike)
  bike_check(bike)
	raise "Bike Container is full" if full?
	bikes << bike
end

def release(bike = nil)
  empty_argument(bike)
  bike_check(bike)
	raise 'Bike not docked' if !include_bike?(bike)
	bikes.delete(bike)
end

def full?
	bike_count == capacity
end

def available_bikes
	bikes.reject { |bike| bike.broken?}
end

def include_bike?(bike)
	bikes.include?(bike)
end

def is_it_a_bike?(bike)
	bike.respond_to?(:broken?)
end

def bike_check(bike)
  raise 'That\'s not a bike!' if !is_it_a_bike?(bike)
end

def empty_argument(bike)
  raise 'Empty argument' if bike == nil
end

def empty?
  bike_count == 0
end

def broken_bikes
  @bikes.reject { |bike| !bike.broken?}
end

end
