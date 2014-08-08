
require 'rspec'
require 'pg'
require 'train'
require 'line'
require 'stops'
require 'pry'

DB = PG.connect({:dbname => 'train_system_'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM train *;")
    DB.exec("DELETE FROM line *;")
    DB.exec("DELETE FROM stops *;")
  end
end
