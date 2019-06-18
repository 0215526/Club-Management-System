class EventPolicy
    attr_reader :user, :event
  
    def initialize(user, event)
        @user = user
        @event = event
    end
    
    def index?
        @user.admin? || !@user.admin?
    end

    def show?
        @user.admin? || !@user.admin?
    end

    def new?
        @user.admin?
    end

    def create?
        @user.admin?
    end

    def edit?
        @user.admin?
    end

    def update?
        @user.admin?
    end
    def destroy?
        @user.admin?
    end
end