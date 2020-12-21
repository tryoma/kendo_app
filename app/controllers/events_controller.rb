class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @events = Event.paginate(page: params[:page])
  end

  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
    @comments = @event.comments.includes(:user).order(created_at: :desc)
  end
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to @event
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "稽古会情報を更新しました。"
      redirect_to @event
    else
      render :edit      
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "#{@event.event_day}のデータを削除しました。"
    redirect_to events_url
  end

  private

    def event_params
      params.require(:event).permit(:event_day, :start_time, :finish_time, :prefecture, :place, :estimate_people, :level, :comment, :user_id)
    end

end
