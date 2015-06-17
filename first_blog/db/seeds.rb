# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
include Faker

100.times do
	Post.create( :author => Name.name,
							 :title => Lorem.words(5).join(","),
						   :body => Lorem.paragraph(3, false, 4))

end
