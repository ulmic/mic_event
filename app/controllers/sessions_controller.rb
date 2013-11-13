class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email params[:user][:email]
    if @user && authenticate_user?(@user, params[:user][:password])
      user_sign_in @user
      redirect_to member_path(@user)
    else
      @user = User.new params[:user]
      flash[:notice] = t('.wrong_login')
      render action: :new
    end
  end

  def destroy
    user_sign_out
    redirect_to :root
  end
end
