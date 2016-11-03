class Topic < ApplicationRecord
	has_many :posts, dependent: :destroy

	# self.per_page = 3 # only for topics
	# WillPaginate.per_page = 2   # set pagination per page globally for all models
	
	# scope :visible_to, -> { where(public: true) }
	scope :visible_to, -> (user) { user ? all : where(public: true) }
	scope :publicly_viewable, -> { where(public: true)  }
	scope :privately_viewable, -> { where(public: false)  }

	# either scope or class methods will work
	# def self.publicly_viewable
	# 	self.where(public: true)
	# end

	# def self.privately_viewable
	# 	where(public: false)
	# end


end
