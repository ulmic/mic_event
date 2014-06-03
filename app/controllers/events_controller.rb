class EventsController < ApplicationController
  def index
    @events = Kaminari.paginate_array(EventDecorator.decorate_collection(Event.all.reverse)).page(params[:page])
  end

  def show
    @event = Event.find params[:id]
  end
end
