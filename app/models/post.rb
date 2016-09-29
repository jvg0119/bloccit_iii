class Post < ApplicationRecord
	has_many :comments
	belongs_to :user

#	validates :body, presence: true

#	default_scope { order( created_at: 'desc'  ) } # OK 
	default_scope { order('created_at DESC') }

#	scope :limit_5, -> { Post.limit(5) }


end
