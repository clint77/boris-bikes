#broken_bike should be intialized as broken? == true


require 'van'
require 'docking_station'
require 'garage'

describe Van do 

	let(:van) { Van.new(:capacity => 5)}
	let(:broken_bike) {Bike.new}
	let(:working_bike) {Bike.new}
  let(:station) {DockingStation.new}
  let(:garage) {Garage.new}

	it "should allow setting default capacity on initializing" do
		expect(van.capacity).to eq(5)
	end

	it "should load broken bikes into van" do
    broken_bike.break!
    station.dock(broken_bike)
    station.dock(working_bike)
    van.load_from_station(station)
    expect(station.bikes).not_to include(van.bikes)
    expect(van.bikes).to eq(van.broken_bikes)
  end

  it "should not exceed the capacity of the van when loading from station" do
    10.times { station.dock(Bike.new) }
    station.bikes.each { | bike | bike.break! }
    expect( lambda {van.load_from_station(station)}).to raise_error(RuntimeError, 'Bike Container is full') 
    expect(van).to be_full
  end

  it "should unload broken bikes into the garage" do
    broken_bike.break!
    van.dock(broken_bike)
    van.dock(working_bike)
    van.unload_to_garage(garage)
    expect(van.bikes).not_to include(garage.bikes)
    expect(garage.bikes).to eq(garage.broken_bikes)
  end

  it "should load fixed bikes from garage" do
    broken_bike.break!
    garage.dock(broken_bike)
    garage.dock(working_bike)
    van.load_from_garage(garage)
    expect(garage.bikes).not_to include(van.bikes)
    expect(van.bikes).to eq(van.available_bikes) 
  end

  it "should unload fix bikes to station" do
    broken_bike.break!
    van.dock(broken_bike)
    van.dock(working_bike)
    van.unload_to_station(station)
    expect(van.bikes).not_to include(station.bikes)
    expect(station.bikes).to eq(station.available_bikes)
    expect(station).not_to be_empty
  end


end