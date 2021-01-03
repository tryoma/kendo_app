class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    favorite = current_user.favorites.build(information_id: params[:information_id])
    favorite.save
    redirect_to information_path(params[:information_id])
  end

  def destroy
    favorite = Favorite.find_by(information_id: params[:information_id], user_id: current_user.id)
    favorite.destroy
    redirect_to information_path(params[:information_id])
  end
end
