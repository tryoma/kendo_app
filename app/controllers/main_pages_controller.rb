class MainPagesController < ApplicationController
  
  def top
    @events = Event.all
    @informations = Information.all
    @users = User.all
  end
end
