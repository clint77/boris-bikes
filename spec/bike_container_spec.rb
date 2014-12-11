require './lib/bike_container'


class ContainerHolder; include BikeContainer; end

describe BikeContainer do

  let(:bike) { Bike.new }
  let(:holder) { ContainerHolder.new }

  it "should accept a bike" do
    # we expect the holder to have 0 bikes
    expect(holder.bike_count).to eq(0)
    # let's dock a bike into the holder
    holder.dock(bike)
    # now we expect the holder to have 1 bike
    expect(holder.bike_count).to eq(1)
  end

  it "should release a bike" do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it "should know when it's full" do
    expect(holder).not_to be_full
    10.times { holder.dock(Bike.new) }
    expect(holder).to be_full
  end

  it "should not accept a bike if it's full" do
    10.times { holder.dock(Bike.new) }
    expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError, 'Bike Container is full')
  end

  it "should provide a list of available bikes" do 
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break!
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([working_bike])
  end
#release
# should raise error if ask to release a bike which is not there
  it "should raise error if ask to release a bike which is not there" do
    not_docked_bike = Bike.new
    expect(lambda { holder.release(not_docked_bike) }).to raise_error(RuntimeError, 'Bike not docked')
  end

# should raise error if pass an argument which is not a bike
  it "should raise error if pass an argument which is not a bike" do
    not_a_bike = Van.new
    expect(lambda { holder.release(not_a_bike) }).to raise_error(RuntimeError, 'That\'s not a bike!')
  end
# should raise error if pass an empty argument
  it "should error if pass an empty argument" do
    
    expect(lambda {holder.release() }).to raise_error(RuntimeError, 'Empty argument') 
  end





















end