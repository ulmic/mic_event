class ApplicationController < ActionController::Base
  include AuthHelper

  def check_user_sign_in
    unless user_signed_in?
      redirect_to not_found_errors_path
    end
  end

  def check_admin_sign_in
    unless user_signed_in?
      redirect_to not_found_errors_path
    else
      unless current_user.admin
        redirect_to not_found_errors_path
      end
    end
  end

  protect_from_forgery
end
