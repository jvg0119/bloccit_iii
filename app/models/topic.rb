class Topic < ApplicationRecord
	has_many :posts

	validates :name, presence: true, length: { minimum: 5 }

	#default_scope { where( 'created_at <> ?', Date.today ) } # just like all
	#default_scope { order(created_at: :desc) } # 
	default_scope { order('name asc') } # 

end
