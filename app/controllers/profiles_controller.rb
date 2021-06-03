class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to @user
      flash[:success] = "#{@profile.name}のプロフィールを更新しました。"
    else
      flash[:alert] = "だめでした。"
      render :edit
    end
  end

  private

  def set_profile
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def profile_params
    params.require(:user).permit(profile: [:name, :image, :grade, :birthday, :prefecture, :dojo, :description, :user_id])[:profile]
  end
end
