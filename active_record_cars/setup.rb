require 'active_record'
require_relative 'car.rb'

ActiveRecord::Base.establish_connection adapter: 'sqlite3',
										database: 'cars.db'

ActiveRecord::Base.connection.create_table 'cars',
	force: true do |table|
		table.string :make
		table.string :model
		table.string :category
		table.float :min_price
		table.integer :mpg_highway
	end

	all_cars = IO.readlines("Cars93.csv")
	all_cars.shift

	cars = all_cars.map do |cars_string|
			cars_string.gsub!('"', '')
			car_array = cars_string.split(",")
			

		Car.create(make: car_array[1], model: car_array[2], 
					  category: car_array[3], min_price: car_array[4],
					  mpg_highway: car_array[7] ) 
	end