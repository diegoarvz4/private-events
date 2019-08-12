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
  end

  private 

    def user_params

      params.require(:user).permit(:name, :password)

    end 
end 
