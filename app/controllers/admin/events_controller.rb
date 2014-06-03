class Admin::EventsController < Admin::ApplicationController
  def index
    @events = Kaminari.paginate_array(EventDecorator.decorate_collection(Event.all.reverse)).page(params[:page])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find params[:id]
  end

  def create
    @event = Event.new params[:event]
    if @event.save
      redirect_to admin_events_path
    else
      render action: :new
    end
  end

  def update
    @event = Event.find params[:id]
    if @event.update_attributes params[:event]
      redirect_to edit_admin_event_path(@event), flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @event = Event.find params[:id]
    @event.destroy
    redirect_to admin_events_path
  end
end
