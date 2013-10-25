class EventsController < ApplicationController
  before_filter :check_member_sign, except: [ :index, :show, :new, :create ]

  def index
    @events = Event.all.reverse
  end

  def show
    @event = Event.find params[:id]
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
      redirect_to @event
    else
      render action: :new
    end
  end

  def update
    @event = Event.find params[:id]
    if @event.update_attributes params[:event]
      redirect_to @event
    else
      render action: :edit
    end
  end

  def destroy
    @event = Event.find params[:id]
    @event.destroy
    redirect_to events_path
  end
end
