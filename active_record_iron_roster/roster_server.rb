require "webrick"
require "./person.rb"

server = WEBrick::HTTPServer.new(:Port => 8000)

server.mount_proc "/" do |request, response|
  @people = Person.all
  template = ERB.new(File.read "home.html.erb")
  response.body = template.result
end

server.mount_proc "/rails" do |request, response|
	@people = Person.where(subject: "ROR")
	template = ERB.new(File.read "show.html.erb")
	response.body = template.result
end

server.mount_proc "/fee" do |request, response|
	@people = Person.where(subject: "FEE")
	template = ERB.new(File.read "show.html.erb")
	response.body = template.result
end

server.mount_proc "/students" do |request, response|
	@people = Person.where(student: true)
	template = ERB.new(File.read "show.html.erb")
	response.body = template.result
end

server.mount_proc "/staff" do |request, response|
	@people = Person.where(student: false)
	template = ERB.new(File.read "show.html.erb")
	response.body = template.result
end

server.mount_proc "/new_student_form" do |request, response|
	template = ERB.new(File.read "new_student_form.html.erb")
	response.body = template.result
end

server.mount_proc "/create_student" do |request, response|
	@new_student = Person.create(request.query)
	response.body = "Thanks for registering #{@new_student.name}! Head to the home page"
end

server.mount_proc "/shutdown" do |request, response|
  response.body = "Bye"
  server.shutdown
end

server.start