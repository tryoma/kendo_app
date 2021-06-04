class MainPagesController < ApplicationController
  def top
    @q = Event.ransack(params[:q])
    @search_records = @q.result(distinct: true).includes(:owner).paginate(page: params[:page], per_page: 9)
    @informations = Information.includes(:user).where("limited > ?", Date.today).first(6)
    @records = Record.includes(:user).order(:created_at).first(9)
  end
end
