class MainPagesController < ApplicationController
  
  def top
    @events = Event.all
    @informations = Information.where("limited > ?",Date.today)
    @users = User.all
  end
end
