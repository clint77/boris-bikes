require 'garage'


describe Garage do 

	let(:garage) { Garage.new(:capacity => 871)}
	let(:broken_bike) {Bike.new}
	let(:working_bike) {Bike.new}

	it "should allow setting default capacity on initializing" do
		expect(garage.capacity).to eq(871)
	end

	it "should fix all bikes when docking" do
		broken_bike.break!
		garage.dock(broken_bike)
		expect(garage.broken_bikes).to be_empty
	end

end