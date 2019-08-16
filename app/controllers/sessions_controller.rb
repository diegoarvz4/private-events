class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      login @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy

    logout(current_user)
    redirect_to login_path

  end 
end
