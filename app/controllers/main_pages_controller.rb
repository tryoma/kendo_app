class MainPagesController < ApplicationController
  def top
    @q = Event.order(:created_at).ransack(params[:q])
    @search_records = @q.result(distinct: true).preload(:owner).paginate(page: params[:page], per_page: 9)
    @informations = Information.preload(user: :profile).where("limited > ?", Date.today).first(6)
    @records = Record.preload(user: :profile).order(:created_at).first(9)
  end
end
