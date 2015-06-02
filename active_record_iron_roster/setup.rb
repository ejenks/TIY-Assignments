require 'active_record'
require './person.rb'

ActiveRecord::Base.establish_connection adapter: 'sqlite3',
										database: 'iron_roster.db'
ActiveRecord::Base.connection.create_table 'people',
	force: true do |table|
		table.string :subject
		table.string :github_account
		table.string :name
		table.boolean :student
	end

	student_strings = IO.readlines("iron_roster.csv")
	student_strings.shift

	student = student_strings.map do |student_string|
		student_string.gsub!('"','')
		student_array = student_string.split(",")

		Person.create(subject: student_array[0], github_account: student_array[1], 
					  name: student_array[2], student: student_array[3].chomp ) ### had to add the .chomp method otherwise it blew up with a deprecation error
	end