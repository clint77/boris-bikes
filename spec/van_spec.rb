require 'van'


describe Van do 

	let(:van) { Van.new(:capacity => 563)}
	let(:broken_bike) {Bike.new}
	let(:working_bike) {Bike.new}

	it "should allow setting default capacity on initializing" do
		expect(van.capacity).to eq(563)
	end

	it "should provide a list of broken bikes" do
		broken_bike.break!
		van.dock(working_bike)
		van.dock(broken_bike)
		expect(van.broken_bikes).to eq([broken_bike])
	end



end