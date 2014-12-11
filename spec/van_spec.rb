require 'van'
require 'docking_station'

describe Van do 

	let(:van) { Van.new(:capacity => 5)}
	let(:broken_bike) {Bike.new}
	let(:working_bike) {Bike.new}
  let(:station) {DockingStation.new}

	it "should allow setting default capacity on initializing" do
		expect(van.capacity).to eq(5)
	end

	it "should load broken bikes into van" do
    station.dock(broken_bike)
    station.dock(working_bike)
    van.load_from_station(station)
    expect(station.bikes).not_to include(van.bikes)
    expect(van.bikes).to eq(van.broken_bikes)
  end



end