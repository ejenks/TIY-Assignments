require "webrick"
require "erb"
require_relative "car.rb"

server = WEBrick::HTTPServer.new(:Port => 8000)

server.mount_proc "/" do |request, response|
	response.body = File.read "home.html.erb"
end

server.mount_proc "/ford" do |request, response|
	@car = Car.where(make: "Ford")
	template = ERB.new(File.read "template.html.erb")
	response.body = template.result
end

server.mount_proc "/mazda" do |request, response|
	@car = Car.where(make: "Mazda")
	template = ERB.new(File.read "template.html.erb")
	response.body = template.result
end

server.mount_proc "/sporty" do |request, response|
	@car = Car.where(category: "Sporty")
	template = ERB.new(File.read "template.html.erb")
	response.body = template.result
end

server.mount_proc "/luxury" do |request, response|  ### this doesnt work
	@car = Car.luxury
	template = ERB.new(File.read "template.html.erb") 	
	response.body = template.result
end

# server.mount_proc "/fuel_efficient" do |request, response| ### this doesnt work
#  	@car = Car.where(mpg_highway: > 30)
#  	template = ERB.new(File.read "template.html.erb")
#  	response.body = template.result
#  end

# server.mount_proc "/domestic" do |request, response|  ### this doesnt work
#  	@car = Car.where(make: "Ford", "Buick", "Cadillac", "Chevrolet", "Chrysler", "Dodge",
#  						   "Eagle", "Lincoln", "Mercury", "Oldsmobile", "Plymouth", 						   "Pontiac", "Saturn")
#  	template = ERB.new(File.read "template.html.erb")
#  	response.body = template.result
#  end

#  server.mount_proc "/foreign" do |request, response|  #### this doesnt work
#  	@car = Car.where(make: "Acura", "Audi", "BMW", "Geo", "Honda", "Hyundai",
#  						   "Lexus", "Mazda", "Mercedes-Benz", "Mitsubishi",
#  						   "Nissan", "Saab", "Subaru", "Suzuki", "Toyota")
#  	template = ERB.new(File.read "template.html.erb")
#  	response.body = template.result
#  end

server.mount_proc "/shutdown" do |request, response|
	response.body = "Good Bye and Thanks for Visiting!"
	server.shutdown
end


server.start