class Comment < ApplicationRecord
  belongs_to :post#, optional: true ## bypass or ignores validation presence: true
  belongs_to :user#, optional: true

  validates :body, presence: true, length: { minimum: 5 }

  after_create :send_favorite_emails

  #default_scope { order('created_at desc') }
  default_scope { order('created_at asc')}

private

  def send_favorite_emails
    #byebug    
  	self.post.favorites.each do |favorite|
   # byebug
    # below are for checking only
  	#	if favorite.user && favorite.user.email_favorites?
  	   # send email to all users including the comment writer
  	#	if self.user == favorite.user && favorite.user.email_favorites?
  	   # send email only to the comment's writer;  this will fail the first test on comment_spec

#     if (self.user != favorite.user) && favorite.user.email_favorites? ## same as the one below
       # send email to all users except for the user who wrote this comment        
      if should_receive_update_for?(favorite) # refactor the above
  	     FavoriteMailer.new_comment(favorite.user, self.post, self).deliver_now
  		end
  	end 
  end

private

  def should_receive_update_for?(favorite) 
  		(self.user != favorite.user) && favorite.user.email_favorites?
  end  

end

