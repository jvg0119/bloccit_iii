class Topic < ApplicationRecord
	has_many :posts, dependent: :destroy

	# self.per_page = 3 # only for topics
	# WillPaginate.per_page = 2   # set pagination per page globally for all models
	
	# scope :visible_to, -> { where(public: true) }
	scope :visible_to, -> (user) { user ? all : where(public: true) }
	
end
