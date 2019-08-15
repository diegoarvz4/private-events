class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new(name: params[:user][:name], password: params[:user][:password])
    if @user.save

      redirect_to @user

    else 

      render 'new'

    end 

  end

  def show
    @user = User.find_by(id: params[:id])

    @upcoming_events = @user.events_dates[0]

    @attended_events = @user.events_dates[1]


    
  end

  private 

    def user_params

      params.require(:user).permit(:name, :password)

    end 
end 
