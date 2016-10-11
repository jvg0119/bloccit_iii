class Post < ApplicationRecord
	has_many :comments
	belongs_to :user
	belongs_to :topic

	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true, length: { minimum: 20 }
	validates :user, :topic, presence: true

#	default_scope { order( created_at: 'desc'  ) } # OK 
	default_scope { order('created_at DESC') }

end
