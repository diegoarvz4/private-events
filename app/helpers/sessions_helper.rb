module SessionsHelper
    #user login function
    def login(user)
       session[:user] = user.id
    end
    
    def current_user
        session[:user]
    end
end
