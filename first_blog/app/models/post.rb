class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy 

	self.per_page = 10
end
