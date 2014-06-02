class MembersController < ApplicationController
  before_filter :check_user_sign_in, except: [ :index, :show, :new, :create ]
  before_filter :check_user_not_busted, only: [ :show, :edit, :update, :destroy ]

  def index
    @members = Kaminari.paginate_array(MemberDecorator.decorate_collection(Member.all.shuffle!)).page(params[:page])
  end

  def show
    @member = Member.find(params[:id]).decorate
  end

  def new
    if user_signed_in?
      if current_user == User.find(params[:id])
        @member = Member.new
      else
        redirect_to new_user_path
      end
    else
      redirect_to root_path, flash: :success
    end
  end

  def edit
    @member = Member.find params[:id]
  end

  def create
    params[:member][:user_id] = current_user.id
    @member = Member.new params[:member]
    @member.id = params[:member][:id]
    if @member.save
      redirect_to new_session_path
    else
      render action: :new
    end
  end

  def update
    @member = Member.find params[:id]
    if @member.update_attributes params[:member]
      redirect_to member_path @member
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
