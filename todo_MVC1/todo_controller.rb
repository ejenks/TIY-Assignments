require 'webrick'
require './todo'

server = WEBrick::HTTPServer.new(Port: 8000, DocumentRoot: "./public")


server.mount_proc "/todos" do |request, response|
  @todos = Todo.all
  template = ERB.new(File.read "index.html.erb")
  response.body = template.result
end

# there are several URLs that must be handled

server.mount_proc "/create_todo" do |request, response|
  @new_todo_item = Todo.create(request.query)
  @new_todo_item.update(complete: false)
  response.set_redirect WEBrick::HTTPStatus::MovedPermanently, "/todos"
end

server.mount_proc "/active" do |request, response|
  @todos = Todo.where(complete: false)
    template = ERB.new(File.read "index.html.erb")
  response.body = template.result
end

server.mount_proc "/completed" do |request, response|
  @todos = Todo.where(complete: true)
  template = ERB.new(File.read "index.html.erb")
  response.body = template.result
end

@toggle_all_on = false
server.mount_proc "/toggle_all" do |request, response|
  @toggle_all_on = !@toggle_all_on
  Todo.update_all(complete: @toggle_all_on)
  response.set_redirect WEBrick::HTTPStatus::MovedPermanently, "/todos"
end

server.mount_proc "/destroy_all_complete" do |request, response|
  Todo.where(complete: true).delete_all
  response.set_redirect WEBrick::HTTPStatus::MovedPermanently, "/todos"
end

server.mount_proc "/shutdown" do |request, response|
  response.body = "Bye"
  server.shutdown
end

# The above code takes care of all the cases where you know *exactly* what the URL is in advance.

# The below code is necessary for cases where you know only a pattern, which you can match
# with a regular expression
# the pattern this class handles - which your link URLs and form actions should also match -
# is to start the URL with "/todo/" followed by an integer followed by another string
# like "/todo/11/whatever"
# the reason it matches that pattern is the call to server.mount "/todo/", MyServlet
# which comes after the MyServlet class is defined

class TodoServlet < WEBrick::HTTPServlet::AbstractServlet

  def do_GET(request, response)
    # this method handles GET requests to your server like "/todo/4/edit" - 
    # really any GET request that has "/todo/" in it 
    # you will need to add some code so the template displays properly
    # and lets you edit a single todo
    template = ERB.new(File.read "index.html.erb")
    response.body = template.result(binding) # binding is required here.
  end

  def do_POST(request, response)
    request.path =~ /todo\/(\d+)/
    id = $1
    @todo = Todo.find(id)
    if request.path =~ /todo\/(\d+)\/destroy/
      @todo.destroy
      response.set_redirect WEBrick::HTTPStatus::MovedPermanently, "/todos"
    elsif request.path =~ /todo\/(\d+)\/toggle_complete/
      @todo.toggle!(:complete)
      response.set_redirect WEBrick::HTTPStatus::MovedPermanently, "/todos"
    end
    # this method handles any POST request that matches a pattern like "/todo/5/update" or "/todo/47/destroy" etc
    # note that there are two aspects of that pattern that change; you'll need to write code to handle 
    # requests to do several different kinds of things to your todo items
    # remember how to get back to the main page after updating or destroying your todo
  end

end
server.mount "/todo/", TodoServlet # this catches requests to the server that begin with "/todo/" and
                                 # has the MyServlet class deal with them
server.start