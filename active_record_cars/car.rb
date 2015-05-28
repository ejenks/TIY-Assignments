require 'active_record'

class Car < ActiveRecord::Base
	establish_connection adapter: 'sqlite3',
						 database: 'cars.db'

	
end


