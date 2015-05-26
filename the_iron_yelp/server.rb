require 'webrick'
require 'erb'
require 'json'
require './restaurant.rb'

server = WEBrick::HTTPServer.new(Port: 8000) 

##### HOME PAGE
server.mount_proc "/" do |request, response|
	template = ERB.new(File.read "home.html.erb")
	response.body = template.result
end


##### ALL RESTAURANTS PAGE
server.mount_proc "/all" do |request, response|
	@restaurants = Restaurant.all
	template = ERB.new(File.read "all.html.erb")
	response.body = template.result
end

##### EACH INDIVIDUAL RESTAURANT PAGE
@restaurants = Restaurant.all ### class method
@restaurants.each do |r|
	server.mount_proc "/#{r.name}" do |request, response|
		@restaurant = r
		template = ERB.new(File.read "restaurant.html.erb")
		response.body = template.result
	end
end

##### SORTED BY CUISINES
@cuisines = Restaurant.cuisine_types ### class method
@cuisines.each do |cuisine|
	server.mount_proc "/#{cuisine}" do |request, response|
		@restaurants = Restaurant.cuisine(cuisine) ### class method here you get all the cuisines by cuisine type
		template = ERB.new (File.read "all.html.erb")
		response.body = template.result
	end
end

##### SORTED BY AVERAGE RATINGS
server.mount_proc "/highest" do |request, response|
	@restaurants = Restaurant.sorted_by_average_reviews #### class method sorting by average reviews
	template = ERB.new(File.read "all.html.erb")
	response.body = template.result
end

##### SORTED BY NUMBER OF RATINGS
server.mount_proc "/numbers" do |request, response|
	@restaurants = Restaurant.sorted_by_number_reviews ### class method where we sort by the number of reviews
	template = ERB.new(File.read "all.html.erb")
	response.body = template.result
end

##### SORTED BY CHEAP
server.mount_proc "/cheap" do |request, response|
	@restaurants = Restaurant.cheap ### class method here you get all the cheap restaurants when you call @restaurant
	template = ERB.new(File.read "all.html.erb")
	response.body = template.result
end

##### SERVER SHUTDOWN PAGE
server.mount_proc "/shutdown" do |request, response|
	response.body = "Thanks for coming and see you later!"
	server.shutdown
end

server.start