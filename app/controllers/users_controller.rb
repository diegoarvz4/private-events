class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new(name: params[:user][:name], password: params[:user][:password])
    if @user.save
      login @user  
      redirect_to @user

    else 

      redirect_to signup_path

    end 

  end

  def show
    @user = current_user
    @upcoming_events = @user.events_attended.upcoming_events
    @attended_events = @user.events_attended.past_events
  end

  def attend 
    @user = current_user
    @user.events_attended << [Event.find_by(id: params[:user][:event_id].to_i)]
    redirect_to current_user
  end 

  private 

    def user_params

      params.require(:user).permit(:name, :password)

    end 
end 
