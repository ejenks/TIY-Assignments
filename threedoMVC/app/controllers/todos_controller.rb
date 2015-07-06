class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def create
    @todo = Todo.create(todo_params)
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
  end

  def destroy_all
    @todos_delete = Todo.where(complete: true)
    @todos_delete.destroy_all
  end

  def toggle_all
    @todos = Todo.all
    Todo.update_all(complete: Todo.incomplete?)
  end

  def toggle
    @todo = Todo.find(params[:id])
    @todo.toggle!(:complete)
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
  end


  private
  def todo_params
    params.require(:todo).permit(:todo_item)
  end
end
