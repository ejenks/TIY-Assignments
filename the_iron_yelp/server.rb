require 'webrick'
require 'erb'
require 'json'

server = WEBrick::HTTPServer.new(Port: 8000) 

server.mount_proc "/" do |request, response|
	response.body = File.read "home.html"
end

server.mount_proc "/shutdown" do |request, response|
	response.body = "Thanks for coming and see you later!"
	server.shutdown
end







server.start