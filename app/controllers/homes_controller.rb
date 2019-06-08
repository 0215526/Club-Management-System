class HomesController < ApplicationController
  before_action :authenticate_user!
  def index
    if user_signed_in?
      redirect_to new_home_path
    else
      redirect_to user_session_path
    end
  end

  def new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  def destroy
    @user = User.find(params[:id])
  
    if @user.destroy
      redirect_to new_home_path, notice: "User deleted."
    else
      redirect_to new_home_path, flash: { error: "User could not be deleted." }
    end
  end
end
