class MembersController < ApplicationController
  before_filter :check_member_sign_in, except: [ :index, :show, :new, :create ]

  def index
    @members = MemberDecorator.decorate_collection Member.all.shuffle!
  end

  def new
    unless member_signed_in?
      @member = Member.new
    else
      flash[:notice] = t('you_already_have_account')
      redirect_to root_path
    end
  end

  def edit
    @member = Member.find params[:id]
  end

  def create
    @member = Member.new params[:member]
    if @member.save
      redirect_to new_session_path
    else
      render action: :new
    end
  end

  def update
    @member = Member.find params[:id]
    if @member.update_attributes params[:member]
      redirect_to ticket_path(@member)
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
