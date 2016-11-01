class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, presence: true, length: { minimum: 5 }

  after_create :send_favorite_emails

private

  def send_favorite_emails
  	self.post.favorites.each do |favorite| 
  		 FavoriteMailer.new_comment(favorite.user, self.post, self).deliver_now
  	# you can use below if you declared:     post has_many :users, through: :favorites
	# self.post.users.each do |user|   
		# FavoriteMailer.new_comment(user,self.post,self).deliver_now 
  	end 
  end

  
end


