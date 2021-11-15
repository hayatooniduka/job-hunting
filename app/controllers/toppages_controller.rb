class ToppagesController < ApplicationController
  def index
    if logged_in?
      @events = current_user.events.all
    end
  end
end
