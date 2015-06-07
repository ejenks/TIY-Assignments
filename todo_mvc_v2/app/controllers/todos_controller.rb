class TodosController < ApplicationController

  def index
    @todos = Todo.all
    @all_todos_count = Todo.count
    @flag = 'all'
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
    @flag = 'completed'
    render :index
  end

  def create
    params[:todo][:todo_item].strip!
    if params[:todo][:todo_item].length > 0 
      Todo.create(params.require(:todo).permit(:todo_item)) 
    end
    redirect_to '/todos'
  end

  def toggle_all
    Todo.toggle_all 
    redirect_to "/todos"
  end

  def clear_completed
    Todo.clear_completed 
    redirect_to "/todos"
  end

  def edit
    @todos = Todo.all
    todo = @todos.find(params[:id])    
    todo.being_edited = true 
    render :index
  end

  def toggle
    todo = Todo.find(params[:id])
    todo.toggle!(:complete)
    redirect_to '/todos'
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    redirect_to '/todos'
  end

  def update
    todo = Todo.find(params[:id])
    hash = request.query
    hash["todo_item"].strip!
    if hash["todo_item"].length > 0 #if something was typed
      todo.update(hash) #then save the todo
    else
      todo.destroy
    end
    redirect_to '/todos'
  end
end