require 'active_record'

class Category < ActiveRecord::Base
	establish_connection adapter: 'sqlite3',
						 database: 'todomvc.db'
	
	validates_presence_of :category					 

	def self.uncompleted?
		Category.where(complete: false).any?
	end

	def self.items_left
		Category.where(complete: false).size
	end

	def self.complete?
		Category.where(complete: true).any?
	end

end



