require 'garage'


describe Garage do 

	let(:bike) {Bike.new}
	let(:garage) { Garage.new(:capacity => 12)}
	let(:broken_bike) {Bike.new}
	let(:working_bike) {Bike.new}

	it "should accept a bike" do
		expect(garage.bike_count).to eq(0)
		# let's dock a bike into the station
		garage.dock(bike)
		# now we expect the station to have 1 bike
		expect(garage.bike_count).to eq(1)
	end

	it "should release a bike" do
		garage.dock(bike)
		garage.release(bike)
		expect(garage.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(garage).not_to be_full
		12.times { garage.dock(Bike.new) }
		expect(garage).to be_full
	end

	it "should not accept a bike if it's full" do
		12.times { garage.dock(Bike.new) }
		expect(lambda { garage.dock(bike) }).to raise_error(RuntimeError, 'Garage is full')
	end
	
	it "should provide a list of available bikes" do
		broken_bike.break!
		garage.dock(working_bike)
		garage.dock(broken_bike)
		expect(garage.available_bikes).to eq([working_bike])
	end

	it "should provide a list of broken bikes" do
		broken_bike.break!
		garage.dock(working_bike)
		garage.dock(broken_bike)
		expect(garage.broken_bikes).to eq([broken_bike])
	end

	it "should fix only broken bikes" do
		broken_bike.break!
		garage.dock(broken_bike)
		garage.dock(working_bike)
		garage.fix_broken_bikes
		expect(broken_bike).not_to be_broken
	end

	#it "should only release bikes to a van" do
		# method to identify receiver
		# method to release? yes or no
		# expect that bikes are only released if receiver == van
	#end

end