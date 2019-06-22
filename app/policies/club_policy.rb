class ClubPolicy
    attr_reader :user, :event
  
    def initialize(user, event)
        @user = user
        @event = event
    end

    def show?
        user.admin? 
    end

    def new?
        user.admin?
    end
end