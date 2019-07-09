class UserPolicy
  attr_reader :user, :users

  def initialize(user, users)
    @user = user
    @users = users
  end

  def index?
    user.admin? || !user.admin?
  end

  def show?
    user.admin? || !user.admin?
  end

  def new?
    user.admin? || !user.admin?
  end
  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def makeAdmin?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def revokeAdmin?
    user.admin?
  end
end
