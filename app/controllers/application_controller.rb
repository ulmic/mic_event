class ApplicationController < ActionController::Base
  include AuthHelper

  def check_member_sign
    unless member_signed_in?
      redirect_to not_found_errors_path
    end
  end

  protect_from_forgery
end
