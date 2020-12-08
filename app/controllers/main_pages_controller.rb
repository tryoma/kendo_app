class MainPagesController < ApplicationController
  
  def top
    @events = Event.all
    @informations = Information.all
  end
end
