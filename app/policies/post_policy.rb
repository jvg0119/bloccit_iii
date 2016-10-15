class PostPolicy < ApplicationPolicy

  def index? 
  	true # no restriction to access 
  end

  def destroy?
    # false   # no access 
    user.present? && (record.user == user || user.admin? || user.moderator?)  
  end

end
