class Post < ApplicationRecord
	has_many :comments
	belongs_to :user

#	validates :body, presence: true

#	default_scope { order( created_at: 'desc'  ) } # OK 
	default_scope { order('created_at DESC') }
	scope :ordered_by_title, -> { order(title: 'asc') } 
	scope :ordered_by_reverse_created_at, -> { order( 'created_at desc' ) } 




end
