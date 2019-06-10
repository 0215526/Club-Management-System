class HomesController < ApplicationController
  before_action :authenticate_user!
  def index
    if !user_signed_in?
      redirect_to user_session_path
    end
    @users = User.all
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end
  def destroy
    @user = User.find(params[:id])
  
    if @user.destroy
      redirect_to homes_path, notice: "User deleted."
    else
      redirect_to homes_path, flash: { error: "User could not be deleted." }
    end
  end

  def makeAdmin
    @user = User.find(params[:id])
    @user.update(admin: true)
    redirect_to homes_path
  end

  def revokeAdmin
    @user = User.find(params[:id])
    @user.update(admin: false)
    redirect_to homes_path
  end
end
