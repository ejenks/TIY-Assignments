require 'active_record'

class Todo < ActiveRecord::Base
	establish_connection adapter: 'sqlite3',
						 database: 'todomvc.db'
	validates_presence_of :todo_item					 

	def self.uncompleted?
		Todo.where(complete: false).any?
	end

	def self.items_left
		Todo.where(complete: false).size
	end

end

