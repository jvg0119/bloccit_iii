class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	belongs_to :user#, optional: true # optional: true to bypass validation 
	belongs_to :topic#, optional: true  # optional: true to bypass validation
	has_many :votes, dependent: :destroy

	mount_uploader :image, ImageUploader

	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true, length: { minimum: 20 }
#	validates :topic, presence: true 	# not needed for rails 5; defults to true w/ belongs_to
#	validates :user, presence: true 	# not needed for rails 5; defults to true w/ belongs_to

#	default_scope { order( created_at: 'desc'  ) } # OK 
	#default_scope { order('created_at DESC') }
	default_scope { order('rank DESC')}  # order based on rank

#	after_create :create_vote # remove not a good practice because it has dependencies

	def up_votes
	#	self.votes.where(value: 1).count
		votes.where(value: 1).count
	end
	# don't use the 2 below:	
	#	Post.last.votes.where(value: 1).count
	#	Vote.where(value: 1).count


	def down_votes
		#self.votes.where(value: -1).count	
		votes.where(value: -1).count	
	end

	def points
		up_votes - down_votes
	end
	
	def update_rank
		age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # one day in seconds
		new_rank = points + age_in_days 
		update_attribute(:rank, new_rank)
	end
	
# Note the two uses of implied self -- created_at and update_attribute.

#private

 	def create_vote
 		#self.votes.create(value: 1, user: self.user )
 	#	votes.create(value: 1, user: user )
	 	user.votes.create(value: 1, post: self)
 	end


end



