class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :destroy]
  before_action :admin_user, only: [:index, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @owner_events = Event.where(owner: @user)
    @member_events = @user.members.map { |member| member.event }
    @favorite_informations = @user.favorite_informations
    @followings = @user.followings
    @followers = @user.followers
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.user_name}のデータを削除しました。"
    redirect_to users_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
