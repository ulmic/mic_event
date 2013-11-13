class UsersController < ApplicationController
  def new
    unless user_signed_in?
      @user = User.new
    else
      flash[:notice] = t('you_already_have_account')
      redirect_to root_path
    end
  end

  def create
    @user = User.new params[:user]
    if @user.save
      user_sign_in @user
      redirect_to new_member_path @user.id
    else
      flash[:notice]= t('all_fields_must_not_blank')
      render action: :new
    end
  end
end
