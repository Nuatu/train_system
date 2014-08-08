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

  def save
    results = DB.exec("INSERT into line (name) VALUES ('#{name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

end
