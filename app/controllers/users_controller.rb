class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @owner_events = Event.where(owner:@user)
    @member_events = @user.members.map{|member| member.event}
    @favorite_informations = @user.favorite_informations
    @users = @user.followings
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "#{@user.user_name}のデータを削除しました。"
    redirect_to users_url
  end

end
