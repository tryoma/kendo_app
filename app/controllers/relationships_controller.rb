class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:follows, :followers]

  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    redirect_to user_path(params[:user_id])
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to user_path(params[:user_id])
  end

  def follows
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
