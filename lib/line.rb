class Line

  attr_reader :name, :id

  def initialize(line_info)

    @name = line_info['name']
    @id = line_info['id'].to_i

  end
end
