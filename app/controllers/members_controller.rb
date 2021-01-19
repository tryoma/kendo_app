class MembersController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @member = @event.members.new(user_id:current_user.id)
    if @member.save
      flash[:success] = "参加予定しました。"
      redirect_to @event
    else 
      flash[:danger] = "参加できませんでした。"
      redirect_to @event
    end
  end

  def destroy
    @member = Member.find_by(event_id:params[:event_id], user_id:current_user.id)
    @member.destroy
    flash[:success] = "とりやめました"
    redirect_to event_url(params[:event_id])
  end
  
end
