require 'spec_helper'

describe "Line" do

  it "initializes with a name" do
    new_line = Line.new({"name" => "fun line"})
    expect(new_line).to be_an_instance_of Line
  end

  describe '.all' do
    it 'pulls all lines from the DB and returns them as objects' do
      expect(Line.all).to eq []
    end
  end

  describe 'save' do
    it 'saves new lines ' do
      new_line = Line.new({"name" => "fun line"})
      new_line.save
      expect(Line.all.length).to eq 1
    end
  end

  describe "view_all_stations" do
    it "lists all the stations associted with a line" do
      new_line = Line.new({"name" => "Blue"})
      new_line.save
      new_line_two = Line.new({"name" => "Green"})
      new_line_two.save
      new_station = Station.new({"name" => "Pteradactyl"})
      new_station.save
      new_station_two = Station.new({"name" => "T-REX"})
      new_station_two.save
      new_station_three = Station.new({"name" => "Apatosaur"})
      new_station_three.save
      new_station.add_line(new_line)
      new_station_two.add_line(new_line_two)
      new_station_two.add_line(new_line)
      expect(new_line.view_all_stations).to eq [new_station, new_station_two]
    end
  end
end
