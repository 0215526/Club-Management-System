class ClubsController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize Club
    @clubs = Club.where(event: params[:event_id])  
  end

  def destroy
    @club = Club.find(params[:id])
    if @club.destroy
      flash[:success] = 'Member was successfully removed.'
      redirect_to request.referer || event_clubs_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to request.referer || event_clubs_path
    end
  end

  def new
    authorize Club
    @clubs = Club.where(event: params[:event_id]).select("user_id")
    @users = User.where("id not in (?)", @clubs)
  end

  def register_to_event
    @clubs = Club.where(" event_id= ? AND user_id= ?", params[:event_id].to_i, params[:user_id].to_i)
    if @clubs.empty?
      @club = Club.new()
      @club.event_id = params[:event_id]
      @club.user_id = params[:user_id]
      if @club.save
        redirect_to request.referer || event_clubs_path
      end
    else
      flash[:errors] = "Could not register"
      redirect_to request.referer || event_clubs_path
    end
  end  
end
