class CheckinsController < ApplicationController
  before_filter :check_confirmed_member_sign_in, except: :index
  def index
    @checkins = Checkin.all.reverse
  end
  include EventsHelper
  def new
    @event = Event.find params[:id]
    unless current_user_checkined?(@event)
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
    params[:checkin][:event_id] = params[:id]
    params[:checkin][:member_id] = current_user.member.id
    @checkin = Checkin.new params[:checkin]
    if @checkin.save
      redirect_to @checkin.event
    else
      render action: :new
    end
  end

  def update
    @checkin = Checkin.find params[:id]
    if @checkin.update_attributes params[:checkin]
      redirect_to member_path(@checkin.member)
    else
      render action: :edit
    end
  end

  def destroy
    @checkin = Checkin.find params[:id]
    event = @checkin.event
    @checkin.destroy
    redirect_to event_path(event)
  end
end
