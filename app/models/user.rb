class User < ApplicationRecord
	has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # has_many :posts, through: :favorites 
  # has_many :favorite_posts, through: :favorites, source: :post

  mount_uploader :avatar, AvatarUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def admin?
  	self.role == "admin"
  end

  def moderator?
  	role == "moderator"
  end

  def favorited(post)
    self.favorites.where(post_id: post.id).first 
    # favorites.where(post_id: post.id).first
    # favorites.find_by(post_id: post.id) # same as above
  end

  def voted(post)
    self.votes.where(post: post).first # this is a vote object
  end

  def self.top_rated
     self.select('users.*') # Select all attributes of the user
      .select('COUNT(DISTINCT posts.id) AS posts_count') # Count the posts made by the user
      .select('COUNT(DISTINCT comments.id) AS comments_count') # Count the posts made by the user
      .select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank') # Add the comment count to the post count and label the sum as "rank"
      .joins(:posts) # Ties the posts table to the users table, via the user_id
      .joins(:comments) # Ties the comments table to the users table, via the user_id
      .group('users.id') # Instructs the database to group the results so that each user will be returned in a distinct row
      .order('rank DESC') # Instructs the database to order the results in descending order, by the rank that we created in this query. (rank = comment count + post count)
   
    # self.select('users.*').select('COUNT(DISTINCT posts.id) AS posts_count')
    #   .select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank').joins(:posts).joins(:comments)
    #   .group('users.id').order('rank DESC') 
  end



end





