require 'pg'
require './lib/station'
require './lib/line'

DB = PG.connect({:dbname => 'train_system'})

def main_menu
  puts 'Press 1 to add a station'
  puts 'Press 2 to view all stations'
  puts 'Press 3 to add a line'
  puts 'Press 4 to view all lines'
  puts 'Press 5 to add a line to a station'
  puts 'Press 6 to show all lines associated with a station'
  puts 'Press 7 to show all stations associted with a line'

  choice = gets.chomp.to_i
  station_menu(choice)
end

def station_menu(choice)
  if choice == 1
    puts "Enter the name of the station:"
    station_name = gets.chomp
    new_station = Station.new('name' => station_name)
    new_station.save
    main_menu
  elsif choice == 2
    puts "All Stations:"
    Station.all.each_with_index do |station, index|
      puts (index + 1).to_s + ". " + station.name
    end
  elsif choice == 3
    puts "Enter the name of the line:"
    line_name = gets.chomp
    new_line = Line.new('name' => line_name)
    new_line.save
    main_menu
  elsif choice == 4
    puts "All Lines:"
    Line.all.each_with_index do |line, index|
      puts (index + 1).to_s + ". " + line.name
    end
    main_menu
  elsif choice == 5
    puts "All Stations:"
    Station.all.each_with_index do |station, index|
      puts (index + 1).to_s + ". " + station.name
    end
    puts "Enter the number of the station that you'd like to add a line to"
    station_number = gets.chomp.to_i
    puts "All Lines:"
    Line.all.each_with_index do |line, index|
      puts (index + 1).to_s + ". " + line.name
    end
    puts "Which line would you like to add?"
    line_number = gets.chomp.to_i
    Station.all[station_number-1].add_line(line)
    puts "Line added!"
  elsif choice == 6
    puts "All Stations:"
    Station.all.each_with_index do |station, index|
      puts (index + 1).to_s + ". " + station.name
    end
    puts "Enter the number of the station that you'd like to view lines for"
    station_number = gets.chomp.to_i
    result = Station.all[station_number-1].view_all_lines
    result.each_with_index do |result, index|
      puts (index +1).to_s + ". " +result.name
    end
    main_menu
  elsif choice == 7
    puts "All Lines:"
    Line.all.each_with_index do |line, index|
      puts (index + 1).to_s + ". " + line.name
    end
    puts "Enter the number of the line that you'd like to view stations for"
    line_number = gets.chomp.to_i
    result = Line.all[line_number-1].view_all_stations
    result.each_with_index do |result, index|
      puts (index +1).to_s + ". " +result.name
    end
    main_menu
  end

end


main_menu
