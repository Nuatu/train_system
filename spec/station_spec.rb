require 'spec_helper'

describe 'station' do
  describe 'initialize' do
    it 'initializes with a name' do
      new_station = Station.new({"name" => "Pteradactyl"})
      expect(new_station).to be_an_instance_of Station
    end
  end

  describe 'self.all' do
    it 'pulls stations out of the DB and saves them as objects' do
      expect(Station.all).to eq []
    end
  end

  describe "save" do
    it "saves a station to the database" do
      new_station = Station.new({"name" => "Pteradactyl"})
      new_station.save

      expect(Station.all.length).to eq 1
    end
  end
end
