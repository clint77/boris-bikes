# link to the Bike class
require 'bike'

#we're describing the functionality of a specific class, Bike
describe Bike do
	
	let(:bike) { Bike.new }
	let(:breaking) { bike.break! }

	it "should not be broken after we create it" do
		expect(bike).not_to be_broken
	end

	it "should be able to break" do
		#bike.break!
		breaking
		expect(bike).to be_broken
	end

	it "should be able to be fixed" do
		#bike.break!
		breaking
		bike.fix!
		expect(bike).not_to be_broken
	end
end