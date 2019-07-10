class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    # authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      flash[:success] = "User Updated Successfully"
      redirect_to users_path
    else
      flash.now[:error] = "User is not Updated"
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
  def destroy
    event = Event.select("event_id").where(user_id: params[:id])
    Club.where(event_id: event).delete_all
    Event.where(user_id: params[:id]).delete_all
    News.where(user_id: params[:id]).delete_all
    Club.where(user_id: params[:id]).delete_all
    @user = User.find(params[:id])
    authorize @user
  
    if @user.destroy
      redirect_to users_path, notice: "User deleted."
    else
      redirect_to users_path, flash: {error: "User could not be deleted." }
    end
  end

  def makeAdmin
    @user = User.find(params[:id])
    authorize @user
    @user.update(admin: true)
    redirect_to users_path
  end

  def revokeAdmin
    @user = User.find(params[:id])
    authorize @user
    @user.update(admin: false)
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :dob, :designation, :company, :address, :email)
  end
end
