class User < ApplicationRecord
	has_many :posts

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


end
