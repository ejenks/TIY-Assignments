require "webrick"
require "erb"
require "./cartemplate.rb"

server = WEBrick::HTTPServer.new(:Port => 8000)

server.mount_proc "/" do |request, response|
	response.body = File.read "home.html"
end

@pages = ["compact", "sporty", "large", "mazda", "pontiac", "luxury"]
@pages.each do |p|
	server.mount_proc "/#{p}" do |request, response|
		@cars = Car.stuff
		@cars = @cars.select{|car| car.send("#{p}" + "?")}
		template = ERB.new(File.read "template.html.erb")
		response.body = template.result
	end
end	

server.mount_proc "/shutdown" do |request, response|
	response.body = "Good Bye and Thanks for Visiting!"
	server.shutdown
end


server.start