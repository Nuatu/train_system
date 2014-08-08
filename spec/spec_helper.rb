
require 'rspec'
require 'pg'
require 'station'
require 'line'
require 'stops'
require 'pry'

DB = PG.connect({:dbname => 'train_system_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM station *;")
    DB.exec("DELETE FROM line *;")
    DB.exec("DELETE FROM stops *;")
  end
end
