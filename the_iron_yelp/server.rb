require 'webrick'
require 'erb'
require 'json'
require './restaurant.rb'


server = WEBrick::HTTPServer.new(Port: 8000) 

server.mount_proc "/" do |request, response|
	response.body = File.read "home.html"
end

server.mount_proc "/all" do |request, response|
	@restaurants = Restaurant.all
	template = ERB.new(File.read "all.html.erb")
	response.body = template.result
end

@restaurants = Restaurant.all
@restaurants.each do |r|
	server.mount_proc "/#{r.name}" do |request, response|
		template = ERB.new(File.read "restaurants.html.erb")
		response.body = template.result
	end
end

server.mount_proc "/shutdown" do |request, response|
	response.body = "Thanks for coming and see you later!"
	server.shutdown
end

server.start