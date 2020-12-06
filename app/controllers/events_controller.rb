class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
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
  end

  private

    def event_params
      params.require(:event).permit(:event_day, :start_time, :finish_time, :prefecture, :place, :estimate_people, :level, :comment, :user_id)
    end

end
