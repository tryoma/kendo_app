class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index]
  
  def index
    @events = Event.paginate(page: params[:page])
  end

  def show
    @comment = Comment.new
    @comments = @event.comments.includes(:user).order(created_at: :asc)
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
  end

  def update
    if @event.update_attributes(event_params)
      flash[:success] = "稽古会情報を更新しました。"
      redirect_to @event
    else
      render :edit      
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "#{@event.event_day}のデータを削除しました。"
    if current_user.admin?
      redirect_to events_url
    else
      redirect_to user_url(current_user)
    end
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:event_day, :start_time, :finish_time, :prefecture, :place, :estimate_people, :address, :level, :comment, :user_id)
    end

end
