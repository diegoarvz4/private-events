class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      login @user
      redirect_to @user
    else
      redirect_to 'new'
    end
  end
end
