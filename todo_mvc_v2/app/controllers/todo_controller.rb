class TodoController < ApplicationController
  
  def index
  	@todos = Todo.all ### we use the @symbol to render in the template and then instance when we just need them for a second
  	@all_todos_count = Todo.count
  	@flag = 'all'
  end

  def new
  	@todo = Todo.new
  end

  def create
  	@todo = Todo.new(params[:todo_item, :complete])
 
  	@todo.save
  	redirect_to '/todo'
  end

  def destroy
  	todo = Todo.find(params[:id])
  	todo.destroy

  	redirect_to '/todo'
  end

  def destroy_all
  	todos = Todo.all
  	todos.destroy

  	redirect_to '/todo'
  end

  def edit
  	@todos = Todo.all
  	todo = @todos.find(params[:id])
  end

  def update
  	todo = Todo.find(params[:id])
  	hash = request.query
  	hash["name"].strip
  	if hash["name"].length > 0
  		todo.update(hash)
  	if @todo.update(params[:todo_item, :complete])
  		redirect_to @todo
  	else
  	  todo.destroy	
  	end
  	redirect_to '/todo'
  end

  def active
  	@todos = Todo.where(complete: false)
  	@all_todos_count = Todo.count
  	@flag = 'active'
  	render :index
  end

  def completed
  	@todos = Todo.where(complete: true)
  	@all_todos_count = Todo.count
  	@flag = 'Completed'
  	render :index
  end

  def clear_complete
  	Todo.clear_complete
  	redirect_to '/todo'
  end

  def toggle_all
  	Todo.toggle_all
  	redirect_to "/todo"
  end

  def toggle
  	todo = todo.find(params[:id])
  	todo.toggle!(:complete)
  	redirect_to '/todo'
  end



end
