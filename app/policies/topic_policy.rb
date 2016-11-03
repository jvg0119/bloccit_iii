class TopicPolicy < ApplicationPolicy

  def index? 
  	true # no restriction to access 
  end

  def show?
    record.public? || user.present?  # uses topic scope visible_to
  end

  def create?
	user.present? && user.admin?
  end

  def update?
  	create?
  end

  def destroy?
  	user.present? && user.admin?
  end

end