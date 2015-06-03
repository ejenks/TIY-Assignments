class TodoController < ApplicationController
  
  def index
  	@todos = Todo.all
  end

  def new
  	@todo = Todo.new
  end

  def create
  	@todo = Todo.new(params[:todo_item, :complete])
  	
  	if @todo.save
  		redirect_to @todo
  	else
  		render 'new'
  	end

  end

  def destroy
  	@todo = Todo.find(params[:id])
  	@todo.destroy

  	redirect_to todo_path
  end

  def destroy_all
  	@todos = Todo.all
  	@todos.destroy

  	redirect_to todo_path
  end

  def edit
  	@todo = Todo.find(params[:id])
  end

  def update
  	@todo = Todo.find(params[:id])

  	if @todo.update(params[:todo_item, :complete])
  		redirect_to @todo
  	else
  		render 'edit'
  	end
  end

  def active
  	@todos = Todo.where(complete: false)
  end

  def completed
  	@todos = Todo.where(complete: true)
  end

  def complete_all
  	@todos = Todo.all.toggle!(complete: true)
  end



end
