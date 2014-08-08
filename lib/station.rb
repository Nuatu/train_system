class Station

  attr_reader :name

  def initialize(station_info)
    @name = station_info["name"]
    @id = station_info["id"]
  end

end
