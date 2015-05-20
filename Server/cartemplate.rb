all_cars = IO.readlines("Cars93.csv")
all_cars.shift


class Car
	attr_reader :manufacturer, :model, :type, :price

	def initialize(manufacturer, model, type, price)
		@manufacturer = manufacturer
		@model = model
		@type = type
		@price = price
	end

	def to_s
		
	end
	
	def compact?
		puts "#{manufacturer} #{model}" if type == "Compact"
	end

	def sporty?
		puts "#{manufacturer} #{model}" if type == "Sporty"
	end

	def large?
		puts "#{manufacturer} #{model}" if type == "Large"
	end

	def mazda?
		puts "Mazda #{model}" if manufacturer == "Mazda"
	end

	def pontiac?
		puts "Pontiac #{model}" if manufacturer == "Pontiac"
	end

	def luxury?
		puts "The expensive luxurious #{manufacturer} #{model}" if price > 30.0
	end

	def cars
		cars = all_cars.map do |cars_string|
			cars_string.gsub!('"', '')
			car_array = cars_string.split(",")
			Car.new(car_array[1].to_s, car_array[2].to_s, 
		    car_array[3].to_s, car_array[4].to_f)
		end
	end
end



# puts "Compact Cars:"
# puts cars.select { |car| car.compact? }
# puts ""

# puts "Sporty Cars:"
# puts cars.select { |car| car.sporty? }
# puts ""

# puts "Large Cars:"
# puts cars.select { |car| car.large? }
# puts ""

# puts "All The Mazdas! "
# puts cars.select { |car| car.mazda? }
# puts ""

# puts "All The Pontiacs! "
# puts cars.select { |car| car.pontiac? }
# puts ""

# puts "The Luxury! "
# puts cars.select { |car| car.luxury?}
