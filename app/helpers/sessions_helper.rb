module SessionsHelper
    #user login function
    def login(user)
       session[:user] = user.id
    end
end
