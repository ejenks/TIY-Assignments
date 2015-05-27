require 'csv'
iron_yard = CSV.read("./iron_roster.csv", :headers => true, :header_converters => :symbol)
iron_yard.to_a.map
puts iron_yard