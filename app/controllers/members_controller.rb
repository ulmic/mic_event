class MembersController < ApplicationController
  before_filter :check_member_sign, except: [ :index, :show, :new, :create ]

  def index
    @members = Member.all.reverse
  end

  def show
    @member = Member.find(params[:id]).decorate
  end

  def new
    @member = Member.new
  end

  def edit
    @member = Member.find params[:id]
  end

  def create
    @member = Member.new params[:member]
    if @member.save
      redirect_to @member
    else
      render action: :new
    end
  end

  def update
    @member = Member.find params[:id]
    if @member.update_attributes params[:member]
      redirect_to @member
    else
      render action: :edit
    end
  end

  def destroy
    @member = Member.find params[:id]
    @member.destroy
    redirect_to members_path
  end
end
