class Todo < ActiveRecord::Base
	validates_presence_of :todo_item
end
