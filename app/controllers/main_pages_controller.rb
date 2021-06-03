class MainPagesController < ApplicationController
  def top
    @events = Event.includes(:owner).paginate(page: params[:page], per_page: 9)
    @informations = Information.includes(:user).where("limited > ?", Date.today).first(6)
    @records = Record.includes(:user).order(:created_at).first(9)
  end
end
