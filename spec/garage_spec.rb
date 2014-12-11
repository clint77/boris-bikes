require 'garage'


describe Garage do 

	let(:garage) { Garage.new(:capacity => 871)}
	let(:broken_bike) {Bike.new}
	let(:working_bike) {Bike.new}

	it "should allow setting default capacity on initializing" do
		expect(garage.capacity).to eq(871)
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

	it "should fix all bikes when docking" do
		expect(garage.broken_bikes).to be_empty
	end

end