class Post < ApplicationRecord
	has_many :comments
	belongs_to :user
	belongs_to :topic

#	validates :body, presence: true

#	default_scope { order( created_at: 'desc'  ) } # OK 
	default_scope { order('created_at DESC') }



end
