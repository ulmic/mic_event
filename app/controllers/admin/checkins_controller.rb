class Admin::CheckinsController < Admin::ApplicationController
  def index
    @checkins = Checkin.all
  end
  def new
    @checkin = Checkin.new
  end
  def create
    @checkin = Checkin.new params[:checkin]
    if @checkin.save
      redirect_to admin_checkins_path, flash: :success
    else
      redirect_to admin_checkins_path, flash: :error
    end
  end
  def edit
    @checkin = Checkin.find params[:id]
  end
  def update
    @checkin = Checkin.find params[:id]
    if @checkin.update_attributes params[:checkin]
      redirect_to edit_admin_checkin_path(@checkin), flash: :success
    else
      redirect_to edit_admin_checkin_path(@checkin), flash: :error
    end
  end
  def destroy
    @checkin = Checkin.find params[:id]
    @checkin.destroy
    redirect_to admin_checkins_path
  end
end
