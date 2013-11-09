class AdminsController < ApplicationController
  before_filter :check_admin_sign_in

  def index
    @admins = Admin.all.reverse
  end

  def new
    @admin = Admin.new
    @member = Member.find params[:id]
    @admin.member = @member
  end

  def edit
    @admin = Admin.find params[:id]
    @member = @admin.member
  end

  def create
    @admin = Admin.new params[:admin]
    @admin.member_id = params[:id]
    if @admin.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def update
    @admin = Admin.find params[:id]
    if @admin.update_attributes params[:admin]
      redirect_to @admin
    else
      render action: :edit
    end
  end

  def destroy
    @admin = Admin.find params[:id]
    member = @admin.member
    @admin.destroy
    redirect_to ticket_path(member)
  end
end
