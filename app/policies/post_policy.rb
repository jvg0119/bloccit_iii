class PostPolicy < ApplicationPolicy

  def index? 
  	true # no restriction to access 
  end

  class Scope < Scope
  	attr_reader :user, :scope 

  	def initialize(user, scope)
  		@user = user # current_user
  		@scope = scope # post
  	end

  	def resolve
  		if user.present? && (user.admin? || user.moderator?)
  			scope.all 
   		elsif user.present? && user.name == "member"
  			scope.all 			
  		elsif user.present? 
  			#Post.last.user.posts
  			scope.where(user: user)
  		else
  			scope.limit(5)
  			#Post.none
  		end

  	end


  end # class Scope

end
