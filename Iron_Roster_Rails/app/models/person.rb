class Person < ActiveRecord::Base
	belongs_to :subject
	validates_presence_of :name, :subject_id, :github_account
end
