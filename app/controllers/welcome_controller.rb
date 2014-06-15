class WelcomeController < ApplicationController
  def index
    @events = EventDecorator.decorate_collection Event.last(5).reverse
    @checkins = Checkin.where("description != ''").last(10).reverse
  end
end
