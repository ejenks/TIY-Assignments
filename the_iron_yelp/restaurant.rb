require 'json'

### the class Restaurant is something that we can use throughout our code

class Restaurant
	### attr_reader is when we create instance variables to allow us to use that data throughout
	attr_accessor :id, :name, :address, :website, :hours, :price, :cuisine, :rating

	### initialize is the data that we will use when creating a new class
	### in this case it is the Restaurant class. The objects denoted by the '@' 
	### will always be associated with our restaurant class.
	def initialize(id, name, address, website, hours, price, cuisine, rating) ### this line is the method and the arguments that we call with our method
		@id = id   ### the object @id is the 
		@name = name
		@address = address
		@website = website
		@hours = hours
		@price = price
		@cuisine = cuisine
		@rating = rating
	end


		### the self.all means anytime we call Restaurant.all we will get all of the restaurants information. We can then manipulate it down further
	def self.all
		restaurants_file = JSON.parse(File.read "restaurants.json")
		
		restaurants = restaurants_file.map do |restaurant|
			Restaurant.new(restaurant["id"], restaurant["name"], 
						   restaurant["address"], restaurant["website"], 
						   restaurant["hours"],restaurant["price"], restaurant["cuisine"],
						   restaurant["rating"])
		end
	end


	### def to_s just puts things that needs to be strings print out as strings and not random stuff
	def to_s

	end


	def self.name
		n = self.all.select{ |restaurant| restaurant.name == name }

	end
end



buffalo = Restaurant.new("10", "Buffalo", "222 2222", "", "", "", "", "")

puts buffalo.id