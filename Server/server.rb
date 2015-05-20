require "webrick"
require "erb"
require "./cartemplate.rb"

server = WEBrick::HTTPServer.new(:Port => 8000)

server.mount_proc "/" do |request, response|
	response.body = File.read "home.html"
end

server.mount_proc "/cars" do |request, response|
	template = ERB.new(File.read "template.html.erb")
	response.body = template.result
end

server.mount_proc "/shutdown" do |request, response|
	response.body = "Good Bye and Thanks for Visiting!"
	server.shutdown
end


server.start