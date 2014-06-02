class Admin::MembersController < Admin::ApplicationController
  def index
    @members = Kaminari.paginate_array(MemberDecorator.decorate_collection(Member.all.shuffle!)).page(params[:page])
  end
  def new
    @member = Member.new
  end
  def create
    @member = Member.new params[:member]
    if @member.save
      redirect_to admin_members_path, flash: :success
    else
      redirect_to admin_members_path, flash: :error
    end
  end
  def edit
    @member = Member.find params[:id]
  end
  def update
    @member = Member.find params[:id]
    if @member.update_attributes params[:member]
      redirect_to edit_admin_member_path(@member), flash: :success
    else
      redirect_to edit_admin_member_path(@member), flash: :error
    end
  end
  def destroy
    @member = Member.find params[:id]
    @member.destroy
    redirect_to admin_members_path
  end
end
