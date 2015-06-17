class Person < ActiveRecord::Base
	validates_presence_of :name, :subject, :github_account
end
