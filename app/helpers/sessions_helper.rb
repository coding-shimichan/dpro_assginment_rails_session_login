module SessionsHelper
    def current_user
        User.first
    end
    
    def logged_in?
        true
    end
end
