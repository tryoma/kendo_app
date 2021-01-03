class MainPagesController < ApplicationController
  
  def top
    @events = Event.all
    @informations = Information.where("limited > ?",Date.today)
    @users = User.all
    @records = Record.order(:created_at)
  end
end
