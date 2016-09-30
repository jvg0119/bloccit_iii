class TopicPolicy < ApplicationPolicy

  def index? 
  	true # no restriction to access 
  end

  def create?
	user.present? && user.admin?
  end

  def update?
  	create?
  end

end