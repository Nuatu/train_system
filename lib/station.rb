class Station

  attr_reader :name, :id

  def initialize(station_info)
    @name = station_info["name"]
    @id = station_info["id"].to_i
  end

  def self.all
    stations = []
    results = DB.exec("SELECT * FROM station;")
    results.each do |result|
      new_station = Station.new(result)
      stations << new_station
    end
    stations
  end

  def add_line(line_name)
    DB.exec("INSERT INTO stops (station_id, line_id) VALUES (#{self.id}, #{line_name.id});")

  end

  def save
    result = DB.exec("INSERT INTO station (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first['id'].to_i
  end
end
