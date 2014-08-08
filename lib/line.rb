class Line

  attr_reader :name, :id

  def initialize(line_info)
    @name = line_info['name']
    @id = line_info['id'].to_i
  end

  def self.all
    line = []
    results = DB.exec("SELECT * FROM line;")
    results.each do |result|
      new_line = Line.new(result)
      line << new_line
    end
    line
  end

  def view_all_stations
    results = DB.exec("SELECT * FROM stops WHERE line_id = #{self.id};")
    stations = []
    results.each do |result|
      station_id = result['station_id'].to_i
      outputs = DB.exec("SELECT * FROM station WHERE id = #{station_id};")
      outputs.each do |output|
        new_station = Station.new(output)
        stations << new_station
      end
    end
    stations
  end

  def save
    results = DB.exec("INSERT into line (name) VALUES ('#{name}') RETURNING id;")
    @id = results.first['id'].to_i
  end
  def ==(another_line)
    self.name == another_line.name
  end
end
