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

  describe "add_line" do
    it "Add a line to a station" do
      new_station = Station.new({"name" => "Pteradactyl"})
      new_station.save
      new_line = Line.new({"name" => "Fun Line"})
      new_line.save
      new_station.add_line(new_line)
      results = DB.exec("SELECT * FROM stops WHERE station_id = #{new_station.id}")
      expect(results.first['line_id'].to_i).to eq new_line.id
    end
  end

  describe "view_all_lines" do
    it "lists all the lines associted with a station" do
      new_station = Station.new({"name" => "Pteradactyl"})
      new_station.save
      new_line = Line.new({"name" => "fun line"})
      new_line.save
      new_line_two = Line.new({"name" => "big line"})
      new_line_two.save
      new_line_three = Line.new({"name" => "short line"})
      new_line_three.save
      new_station.add_line(new_line)
      new_station.add_line(new_line_two)
      expect(new_station.view_all_lines).to eq [new_line, new_line_two]
    end
  end
end
