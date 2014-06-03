class WelcomeController < ApplicationController
  def index
    @events = Event.last(5).reverse
    @checkins = Checkin.where("description != ''").last(10).reverse
  end
end
