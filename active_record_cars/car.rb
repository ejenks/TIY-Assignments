require 'active_record'

class Car < ActiveRecord::Base
	establish_connection adapter: 'sqlite3',
						 database: 'cars.db'

	def luxury
		if Car.price > 30
		end
	end

	
end


