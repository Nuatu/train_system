require 'spec_helper'

describe 'station' do
  it 'initializes with a name' do
    new_station = Station.new(:name => "Pteradactyl")
    expect(new_station).to be_an_instance_of Station
  end
end
