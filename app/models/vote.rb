class Vote < ApplicationRecord
  belongs_to :post, optional: true # optional: true to bypass validation 
  belongs_to :user, optional: true # optional: true to bypass validation 

  #validates :value, inclusion: { in: [ 1, -1 ], message: "%{value} is not a vote" }
  validates :value, inclusion: { in: [ 1, -1 ], message: "%{value} is not a vote" }

  after_save :update_post 

  def up_vote?
  	self.value == 1 
  end

  def down_vote?
  	value == -1
  end

private

  def update_post
  	#self.post.update_rank 
  	post.update_rank 
  end

end
