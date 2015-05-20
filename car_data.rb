all_cars = IO.readlines("mtcars.csv")
all_cars.shift

class Car
	attr_reader :name, :gas_mileage, :n_cylinders, :horsepower, :weight, :quarter_mile_time

	def initialize(name, gas_mileage, n_cylinders, horsepower, weight, quarter_mile_time)
		@name = name
		@gas_mileage = gas_mileage
		@n_cylinders = n_cylinders
		@horsepower = horsepower
		@weight = weight
		@quarter_mile_time = quarter_mile_time

	end	

	def to_s
		salesman_name
	end

	def land_yacht?
		weight > 3.5
	end

	def salesman_name
		"the #{powerful} #{fuel_efficient} #{name}"
	end

	def powerful
		"powerful" if horsepower > 200
	end

	def fuel_efficient
		"fuel_efficient" if gas_mileage > 25
	end
end

###["0name", "1mpg", "2cyl", "3disp", "4hp", "5drat", "6wt", "7qsec", "8vs", "9am", "10gear", "11carb"]

cars = all_cars.map do |cars_string|
	cars_string.gsub!('"', '')
	car_array = cars_string.split(",")
	Car.new(car_array[0].to_s, car_array[1].to_f, 
			car_array[2].to_f, car_array[4].to_i, 
			car_array[6].to_f, car_array[7].to_f)
end

puts "All the cars are: "
puts cars

puts ""

puts "The car that has the best gas mileage is the: "
puts cars.max_by { |car| car.gas_mileage }

puts ""

puts "The cars that are land yachts (over 3500 lbs) are: "
puts cars.select { |car| car.land_yacht? }

puts ""

puts "Some cars are special: "
puts cars.select { |car| car.salesman_name }

puts ""

puts "BEAST MODE!: "
puts ""

puts "But the fastest land yacht is: "
puts cars.select { |car| car.land_yacht? }
		 .min_by { |car| car.quarter_mile_time }

puts ""

v4_cars = cars.select { |car| car.n_cylinders == 4 }.max_by { |car| car.gas_mileage }
v6_cars = cars.select { |car| car.n_cylinders == 6 }.max_by { |car| car.gas_mileage }
v8_cars = cars.select { |car| car.n_cylinders == 8 }.max_by { |car| car.gas_mileage }	

puts "The best cars in their classes : "

array = [ v4_cars, v6_cars, v8_cars ]
puts array
