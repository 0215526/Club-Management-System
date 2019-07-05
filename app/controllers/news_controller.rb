class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @news = News.all.order("created_at DESC")
    # render json: @news
    authorize @news
  end

  def show
    authorize @news
  end

  def new
    @news = News.new
    authorize @news
  end

  def edit
    authorize @news
  end

  def create
    @news = News.new(news_params)
    authorize @news
    @news.user = current_user
    respond_to do |format|
      if @news.save
        @users = User.all
        NotificationMailer.send_mail(@news, @users)
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @news
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    authorize @news
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private

    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:title, :body, :image)
    end
end
