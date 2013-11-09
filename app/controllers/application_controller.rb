class ApplicationController < ActionController::Base
  include AuthHelper

  def check_member_sign_in
    unless member_signed_in?
      redirect_to not_found_errors_path
    end
  end

  def check_admin_sign_in
    unless member_signed_in?
      redirect_to not_found_errors_path
    else
      unless current_member.admin
        redirect_to not_found_errors_path
      end
    end
  end

  protect_from_forgery
end
