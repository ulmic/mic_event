class CheckinsController < ApplicationController
  before_filter :check_member_sign, except: [ :index, :show ]

  def index
    @checkins = Checkin.all.reverse
  end

  def show
    @checkin = Checkin.find params[:id]
  end

  def new
    @checkin = Checkin.new
  end

  def edit
    @checkin = Checkin.find params[:id]
  end

  def create
    @checkin = Checkin.new params[:checkin]
    @checkin.event_id = params[:id]
    @checkin.member_id = current_member.id
    if @checkin.save
      redirect_to @checkin
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
