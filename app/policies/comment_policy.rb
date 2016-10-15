class CommentPolicy < ApplicationPolicy

  def create?
	user.present? 
  end

  def destroy?
  	user.present? && (record.user == user || user.moderator? || user.admin?) 
  end

end

# user 	## is the current_user
# user.present? 	## is there a current user?
# record 	## is a comment
# record.user 	## is the user that belongs_to the comment or comment.user 
# record.user == user 	## comment.user is the current_user?  or is the current_user the owner of the comment?
# user.admin? 	## is the current_user an admin? 
# user.moderator 	## is the current_user a moderator? 


