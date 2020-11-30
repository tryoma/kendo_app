class MainPagesController < ApplicationController
  def top
    @events = Event.all
  end
end
