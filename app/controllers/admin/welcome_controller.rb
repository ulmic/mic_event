class Admin::WelcomeController < Admin::ApplicationController
  def index
    @users = User.last 20
    @events = Event.last 20
  end
end
