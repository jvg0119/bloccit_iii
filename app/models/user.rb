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


end
