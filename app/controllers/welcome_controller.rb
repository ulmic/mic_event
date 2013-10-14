class WelcomeController < ApplicationController
  def index
    @events = Event.last(3).reverse
    @checkins = Checkin.last(10).reverse
  end
end
