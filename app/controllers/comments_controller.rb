class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to event_path(@event)
    else
      flash[:alert] = 'コメントを入力してください。'
      redirect_to event_path(@event)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:alert] = '削除しました'
    redirect_to event_path(params[:event_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
