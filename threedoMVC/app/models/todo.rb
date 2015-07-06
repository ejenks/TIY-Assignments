class Todo < ActiveRecord::Base
  validates_presence_of :todo_item

  def self.incomplete?
    Todo.where(complete: false).any?
  end

end
