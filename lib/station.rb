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

  def add_line(line)
    DB.exec("INSERT INTO stops (station_id, line_id) VALUES (#{self.id}, '#{line.id}');")
  end

  def view_all_lines
    lines = []
    results = DB.exec("SELECT line.* FROM station join stops on (station.id = stops.station_id) join line on (stops.line_id = line.id) where station.id =#{self.id};")
    results.each do |result|
      new_line = Line.new(result)
      lines << new_line
    end
    lines
  end

  def ==(another_station)
    self.name == another_station.name
  end

  def save
    result = DB.exec("INSERT INTO station (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id'].to_i
  end
end
