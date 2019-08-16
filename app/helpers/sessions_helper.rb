module SessionsHelper
    #user login function
    def login(user)
       session[:user] = user.id
    end
    
    def current_user
        @current_user ||= User.find_by(id: session[:user]) 
    end

    def logout(user)
        @current_user = nil 
        session.delete(:user)
    end 
end
