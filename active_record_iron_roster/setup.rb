require 'active_record'
ActiveRecord::Base.establish_connection adapter: 'sqlite3',
										database: 'iron_roster.db'
ActiveRecord::Base.connection.create_table 'people',
	force: true do |table|
		table.string :subject
		table.string :github
		table.string :name
		table.boolean :student
	end