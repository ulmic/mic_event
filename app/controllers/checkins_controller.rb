class CheckinsController < ApplicationController
  before_filter :check_member_sign, except: :index
  def index
    @checkins = Checkin.all.reverse
  end
  include EventsHelper
  def new
    @event = Event.find params[:id]
    unless current_member_checkined?(@event)
      @checkin = Checkin.new
    else
      flash[:notice] = t('you_are_checkined_here')
      redirect_to @event
    end
  end

  def edit
    @checkin = Checkin.find params[:id]
  end

  def create
    @checkin = Checkin.new params[:checkin]
    @checkin.event = @event
    @checkin.member_id = current_member.id
    if @checkin.save
      redirect_to @event
    else
      render action: :new
    end
  end

  def update
    @checkin = Checkin.find params[:id]
    if @checkin.update_attributes params[:checkin]
      redirect_to @checkin
    else
      render action: :edit
    end
  end

  def destroy
    @checkin = Checkin.find params[:id]
    @checkin.destroy
    redirect_to checkins_path
  end
end
