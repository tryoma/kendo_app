class EventsController < ApplicationController
  require 'line/bot'
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index]

  def index
    @events = Event.paginate(page: params[:page])
  end

  def show
    @comment = Comment.new
    @comments = @event.comments.includes(:user).order(created_at: :asc).last(15)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = '新規作成に成功しました。'
      notification_for(@event)
      redirect_to @event
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      flash[:success] = "稽古会情報を更新しました。"
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "#{@event.place}の稽古会を削除しました。"
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

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token  = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def notification_for(event)
    client.broadcast(message(event))
    client.broadcast(text_message)
  end

  def text_message
    {
      type: "text",
      text: '新しく稽古会が追加されました！確認してみましょう！'
    }
  end

  def message(event)
    { 
      type: 'flex',
      altText: '新しく稽古会が追加されました！確認してみましょう！',
      contents:
      {
        "type": "bubble",
        "body": {
          "type": "box",
          "layout": "vertical",
          "contents": [
            {
              "type": "text",
              "text": "#{event.place}",
              "weight": "bold",
              "size": "xl"
            },
            {
              "type": "box",
              "layout": "vertical",
              "margin": "lg",
              "spacing": "sm",
              "contents": [
                {
                  "type": "box",
                  "layout": "baseline",
                  "spacing": "sm",
                  "contents": [
                    {
                      "type": "text",
                      "text": "住所",
                      "color": "#aaaaaa",
                      "size": "sm",
                      "flex": 1
                    },
                    {
                      "type": "text",
                      "text": "#{event.address}",
                      "wrap": true,
                      "color": "#666666",
                      "size": "sm",
                      "flex": 5
                    }
                  ]
                },
                {
                  "type": "box",
                  "layout": "baseline",
                  "spacing": "sm",
                  "contents": [
                    {
                      "type": "text",
                      "text": "時間",
                      "color": "#aaaaaa",
                      "size": "sm",
                      "flex": 1
                    },
                    {
                      "type": "text",
                      "text": "#{l @event.event_day, format: :long}" + "#{l @event.start_time, format: :time}" + '〜' + "#{l @event.finish_time, format: :time}",
                      "wrap": true,
                      "color": "#666666",
                      "size": "sm",
                      "flex": 5
                    }
                  ]
                }
              ]
            }
          ]
        },
        "footer": {
          "type": "box",
          "layout": "vertical",
          "spacing": "sm",
          "contents": [
            {
              "type": "button",
              "style": "link",
              "height": "sm",
              "action": {
                "type": "uri",
                "label": "詳細地図",
                "uri": "https://www.google.com/maps?q=" + "#{event.latitude}" + ',' + "#{event.longitude}"
              }
            },
            {
              "type": "button",
              "style": "link",
              "height": "sm",
              "action": {
                "type": "uri",
                "label": "詳細確認",
                "uri": "https://protected-shelf-24150.herokuapp.com/"
              }
            },
            {
              "type": "spacer",
              "size": "sm"
            }
          ],
          "flex": 0,
          "borderWidth": "light",
          "borderColor": "#CCCCCC"
        }
      }
    }
  end
end
