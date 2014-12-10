require 'van'


describe Van do 

	let(:bike) {Bike.new}
	let(:van) { Van.new(:capacity => 12)}
	let(:broken_bike) {Bike.new}
	let(:working_bike) {Bike.new}

	it "should accept a bike" do
		expect(van.bike_count).to eq(0)
		# let's dock a bike into the station
		van.dock(bike)
		# now we expect the station to have 1 bike
		expect(van.bike_count).to eq(1)
	end

	it "should release a bike" do
		van.dock(bike)
		van.release(bike)
		expect(van.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(van).not_to be_full
		12.times { van.dock(Bike.new) }
		expect(van).to be_full
	end

	it "should not accept a bike if it's full" do
		12.times { van.dock(Bike.new) }
		expect(lambda { van.dock(bike) }).to raise_error(RuntimeError, 'Van is full')
	end
	
	it "should provide a list of available bikes" do
		broken_bike.break!
		van.dock(working_bike)
		van.dock(broken_bike)
		expect(van.available_bikes).to eq([working_bike])
	end

	it "should provide a list of broken bikes" do
		broken_bike.break!
		van.dock(working_bike)
		van.dock(broken_bike)
		expect(van.broken_bikes).to eq([broken_bike])
	end



end