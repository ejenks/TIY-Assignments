class Todo < ActiveRecord::Base
	validates_presence_of :todo_item
	attr_accessor :being_edited
end
