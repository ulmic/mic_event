class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to admin_users_path, flash: :success
    else
      redirect_to admin_users_path, flash: :error
    end
  end
  def edit
    @user = User.find params[:id]
  end
  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      redirect_to edit_admin_user_path(@user), flash: :success
    else
      redirect_to edit_admin_user_path(@user), flash: :error
    end
  end
  def accept
    @user = User.find params[:id]
    @user.accept
    redirect_to admin_users_path
  end
  def bust
    @user = User.find params[:id]
    @user.bust
    redirect_to admin_users_path
  end
  def retrieve
    @user = User.find params[:id]
    @user.retrieve
    redirect_to admin_users_path
  end
end
