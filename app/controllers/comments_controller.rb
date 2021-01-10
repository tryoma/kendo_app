class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    if @comment.save
      render :index
    else
      flash[:alert] = 'コメントを入力してください。'
      render :index
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:alert] = '削除しました'
    render :index
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
