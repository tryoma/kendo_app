class MainPagesController < ApplicationController
  def top
    @events = Event.paginate(page: params[:page], per_page: 9)
    @informations = Information.where("limited > ?", Date.today)
    @records = Record.order(:created_at)
  end
end
