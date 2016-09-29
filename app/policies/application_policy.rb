class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user  # current_user
    @record = record  # the model name of the policy 
  end

  def index?
    false   # no user will be able to see a list of resources (ie: when accessing /posts)
  end       # no access 

  def show?
    scope.where(:id => record.id).exists?
  end   # default rule for showing a record 
        # (as in when viewing /posts/13), is to ensure a record exists.

  def create?
    # false   # no access
    user.present? # minimum requirement for creating records 
                  # like posts or comments is that a user exist and be logged in. 
  end

  def new?
    create?   # same as create - no access
  end

  def update?
    # false   # no access 
    user.present? && (record.user == user || user.admin? ) 
  end # a user is logged in and record's user (record is the post or comment or topic) is the current_user
      # or an admin user
      # record.user == user means the record's owner is the current_user

  def edit?
    update?   # same as update - no access 
  end

  def destroy?
    # false   # no access 
      update? 
  end

  def scope
  #  Pundit.policy_scope!(user, record.class)
    record.class  # scope will simply return the class of the record being authorized. 
                  # For example, for a post instance it will return the Post class.
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
