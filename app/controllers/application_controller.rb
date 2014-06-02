class ApplicationController < ActionController::Base
  include AuthHelper

  def check_user_sign_in
    unless user_signed_in?
      redirect_to not_found_errors_path
    end
  end

  def check_confirmed_member_sign_in
    check_user_sign_in
    unless current_user.accepted?
      flash[:notice] = t('your_account_must_be_confirmed_by_admins')
      redirect_to root_path
    end
  end

  def check_current_user_not_busted
    check_user_sign_in
    if current_user and current_user.busted?
      redirect_to you_are_busted_pages_path
    end
  end

  protect_from_forgery
end
