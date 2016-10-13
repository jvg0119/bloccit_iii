class Topic < ApplicationRecord
	has_many :posts

	# self.per_page = 3 # only for topics
	# WillPaginate.per_page = 2   # set pagination per page globally for all models
		
end
